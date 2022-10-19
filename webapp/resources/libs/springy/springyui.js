/**
Copyright (c) 2010 Dennis Hotson

 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:

 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
*/

(function() {

jQuery.fn.springy = function(params) {
	var graph = this.graph = params.graph || new Springy.Graph();
	
	var nodeFont = params.nodeFont || "14px Verdana, sans-serif";
	var edgeFont = params.edgeFont || "8px Verdana, sans-serif";
	var fontHeight = params.fontHeight || 16;

	var nodeHitTestDistance = params.nodeHitTestDistance || 0.5; //0: not limited;
	var edgeHitTestDistance = params.edgeHitTestDistance || 0.3; //0: not limited;
	
	var stiffness = params.stiffness || 400.0;
	var repulsion = params.repulsion || 400.0;
	
	var damping = params.damping || 0.5;
	var minEnergyThreshold = params.minEnergyThreshold || 0.00001;
	
	var nodeSelected = params.nodeSelected || null;
	var edgeSelected = params.edgeSelected || null;
	var nodeDbClicked = params.nodeDbClicked || null;
	var edgeDbClicked = params.edgeDbClicked || null;
	
	var nodeImages = {};
	var edgeLabelsUpright = true;

	var canvas = this[0];
	var ctx = canvas.getContext("2d");

	var layout = this.layout = new Springy.Layout.ForceDirected(graph, stiffness, repulsion, damping, minEnergyThreshold);

	// calculate bounding box of graph layout.. with ease-in
	var currentBB = layout.getBoundingBox();
	var targetBB = {bottomleft: new Springy.Vector(-2, -2), topright: new Springy.Vector(2, 2)};

	// auto adjusting bounding box
	Springy.requestAnimationFrame(function adjust() {
		targetBB = layout.getBoundingBox();
		// current gets 20% closer to target every iteration
		currentBB = {
			bottomleft: currentBB.bottomleft.add( targetBB.bottomleft.subtract(currentBB.bottomleft)
				.divide(10)),
			topright: currentBB.topright.add( targetBB.topright.subtract(currentBB.topright)
				.divide(10))
		};

		Springy.requestAnimationFrame(adjust);
	});

	// convert to/from screen coordinates
	var toScreen = function(p) {
		var size = currentBB.topright.subtract(currentBB.bottomleft);
		var sx = p.subtract(currentBB.bottomleft).divide(size.x).x * canvas.width;
		var sy = p.subtract(currentBB.bottomleft).divide(size.y).y * canvas.height;
		return new Springy.Vector(sx, sy);
	};

	var fromScreen = function(s) {
		var size = currentBB.topright.subtract(currentBB.bottomleft);
		var px = (s.x / canvas.width) * size.x + currentBB.bottomleft.x;
		var py = (s.y / canvas.height) * size.y + currentBB.bottomleft.y;
		return new Springy.Vector(px, py);
	};

	// half-assed drag and drop
	var selectedNode = null;
	var selectedEdge = null;
	var nearestNode = null;
	var dragged = null;

	this.getSelectedNode = function() {
		if(selectedNode == null)
			return null; 
		return selectedNode.node;
	}
	
	jQuery(canvas).mousedown(function(e) {
		var pos = jQuery(this).offset();
		var p = fromScreen({x: e.pageX - pos.left, y: e.pageY - pos.top});
		
		var nearHitNode = layout.nearest(p);
		var hitedNode = false;
		if(nodeHitTestDistance==0 || nearHitNode.distance<=nodeHitTestDistance)  {
			hitedNode = true;
			selectedNode = nearestNode = dragged = nearHitNode;
		}
		//console.log("Node.distance: " + nearHitNode.distance);
		if(hitedNode && selectedNode.node !== null) {
			dragged.point.m = 10000.0;
			if (nodeSelected) {
				nodeSelected(selectedNode.node);
			}
		}

		if (edgeSelected && !hitedNode) {
			var nearHitEdge = layout.nearestEdge(p);
			var hitedEdge = false;
			if(edgeHitTestDistance==0 || nearHitEdge.distance<=edgeHitTestDistance)  {
				hitedEdge = true;
				selectedEdge = nearHitEdge;
			}
			//console.log("nearEdge",JSON.stringify(nearEdge.edge), nearEdge.distance);
			if (hitedEdge && selectedEdge.edge !== null) {		
				edgeSelected(selectedEdge.edge);
			}
			//console.log("Edge.distance: " + nearHitEdge.distance);
		}			

		renderer.start();
	});

	this.kysFakeCode = function() { //초기로딩시 오류때문에 임시방편으로 시기침
		var pos = jQuery(this).offset();
		var p = fromScreen({x: 300 - pos.left, y: 200 - pos.top});
		var dragged = layout.nearest(p);
		if(dragged)
			dragged.point.m = 10000.0;
	}
	
	// Basic double click handler
	jQuery(canvas).dblclick(function(e) {
		var pos = jQuery(this).offset();
		var p = fromScreen({x: e.pageX - pos.left, y: e.pageY - pos.top});
		
		var nearHitNode = layout.nearest(p);
		var hitedNode = false;
		if(nodeHitTestDistance==0 || nearHitNode.distance<=nodeHitTestDistance)  {
			hitedNode = true;
			selectedNode = nearHitNode;
		}

		if(hitedNode && selectedNode.node !== null) {
			if(selectedNode.node.data && selectedNode.node.data.ondoubleclick) {
				selectedNode.node.data.ondoubleclick();
			}
		
			if (selectedNode.node && nodeDbClicked) {
				nodeDbClicked(selectedNode.node);
			}		
		}

		if (edgeDbClicked  && !hitedNode) {
			var nearHitEdge = layout.nearestEdge(p);
			var hitedEdge = false;
			if(edgeHitTestDistance==0 || nearHitEdge.distance<=edgeHitTestDistance)  {
				hitedEdge = true;
				selectedEdge = nearHitEdge;
			}

			if (hitedEdge && selectedEdge.edge !== null) {		
				edgeDbClicked(selectedEdge.edge);
			}
		}	
	});

	jQuery(canvas).mousemove(function(e) {
		var pos = jQuery(this).offset();
		var p = fromScreen({x: e.pageX - pos.left, y: e.pageY - pos.top});
		nearestNode = layout.nearest(p);

		if (dragged !== null && dragged.node !== null) {
			dragged.point.p.x = p.x;
			dragged.point.p.y = p.y;
		}

		renderer.start();
	});

	jQuery(window).bind('mouseup',function(e) {
		dragged = null;
	});

	var getTextWidth = function(node) {
		var text = (node.data.label !== undefined) ? node.data.label : node.id;
		if (node._width && node._width[text])
			return node._width[text];

		ctx.save();
		ctx.font = (node.data.font !== undefined) ? node.data.font : nodeFont;
		var width = ctx.measureText(text).width;
		ctx.restore();

		node._width || (node._width = {});
		node._width[text] = width;

		return width;
	};

	var getTextHeight = function(node) {
		//return 16;
		return (node.data.fontHeight !== undefined)? node.data.fontHeight : fontHeight;
		// In a more modular world, this would actually read the font size, but I think leaving it a constant is sufficient for now.
		// If you change the font size, I'd adjust this too.
	};

	var getImageWidth = function(node) {
		var width = (node.data.image.width !== undefined) ? node.data.image.width : nodeImages[node.data.image.src].object.width;
		return width;
	}

	var getImageHeight = function(node) {
		var height = (node.data.image.height !== undefined) ? node.data.image.height : nodeImages[node.data.image.src].object.height;
		return height;
	}

	Springy.Node.prototype.getHeight = function() {
		var height;
		if (this.data.image == undefined) {
			var isFixedSize = (this.data.fixedSize != undefined && this.data.fixedSize != "");
			if(isFixedSize) {
				height = parseInt(this.data.fixedSize);
			} else {
				height = getTextHeight(this);
			}
		} else {
			if (this.data.image.src in nodeImages && nodeImages[this.data.image.src].loaded) {
				height = getImageHeight(this);
			} else {height = 10;}
		}
		return height;
	}

	Springy.Node.prototype.getWidth = function() {
		var width;
		if (this.data.image == undefined) {
			var isFixedSize = (this.data.fixedSize != undefined && this.data.fixedSize != "");
			if(isFixedSize) {
				width = parseInt(this.data.fixedSize);
			} else {
				width = getTextWidth(this);
			}
			
		} else {
			if (this.data.image.src in nodeImages && nodeImages[this.data.image.src].loaded) {
				width = getImageWidth(this);
			} else {width = 10;}
		}
		
		return width;
	}

	var renderer = this.renderer = new Springy.Renderer(layout,
		function clear() {
			ctx.clearRect(0,0,canvas.width,canvas.height);
		},
		function drawEdge(edge, p1, p2) {
			var x1 = toScreen(p1).x;
			var y1 = toScreen(p1).y;
			var x2 = toScreen(p2).x;
			var y2 = toScreen(p2).y;

			var direction = new Springy.Vector(x2-x1, y2-y1);
			var normal = direction.normal().normalise();

			var from = graph.getEdges(edge.source, edge.target);
			var to = graph.getEdges(edge.target, edge.source);

			var total = from.length + to.length;

			// Figure out edge's position in relation to other edges between the same nodes
			var n = 0;
			for (var i=0; i<from.length; i++) {
				if (from[i].id === edge.id) {
					n = i;
				}
			}

			//change default to  10.0 to allow text fit between edges
			var spacing = 12.0;

			// Figure out how far off center the line should be drawn
			var offset = normal.multiply(-((total - 1) * spacing)/2.0 + (n * spacing));

			var paddingX = 6;
			var paddingY = 6;

			var s1 = toScreen(p1).add(offset);
			var s2 = toScreen(p2).add(offset);

			var boxWidth = edge.target.getWidth() + paddingX;
			var boxHeight = edge.target.getHeight() + paddingY;

			if(edge.target.data.shape == "circle") {
				if(boxWidth>boxHeight) 
					boxHeight = boxWidth;
				else 
					boxWidth = boxHeight;
			}

			var intersection = intersect_line_box(s1, s2, {x: x2-boxWidth/2.0, y: y2-boxHeight/2.0}, boxWidth, boxHeight);

			if (!intersection) {
				intersection = s2;
			}

			var stroke = (edge.data.color !== undefined) ? edge.data.color : '#000000';

			var arrowWidth;
			var arrowLength;

			var weight = (edge.data.weight !== undefined) ? edge.data.weight : 1.0;

			ctx.lineWidth = Math.max(weight *  2, 0.1);
			arrowWidth = 1 + ctx.lineWidth;
			arrowLength = 7 + ctx.lineWidth; //kys:8 (orignal)

			var directional = (edge.data.directional !== undefined) ? edge.data.directional : true;

			// line
			var lineEnd;
			if (directional) {
				lineEnd = intersection.subtract(direction.normalise().multiply(arrowLength * 0.5));
			} else {
				lineEnd = s2;
			}

			ctx.save();
			ctx.strokeStyle = stroke;
			if (ctx.setLineDash && (edge.data.lineStyle !== undefined && edge.data.lineStyle == "dash")) {
				ctx.setLineDash([ctx.lineWidth*2, ctx.lineWidth*2]);
			}
			ctx.beginPath();
			ctx.moveTo(s1.x, s1.y);
			ctx.lineTo(lineEnd.x, lineEnd.y);
			ctx.stroke();
			ctx.restore();

			// arrow
			if (directional) {
				ctx.save();
				ctx.fillStyle = stroke;
				ctx.translate(intersection.x, intersection.y);
				ctx.rotate(Math.atan2(y2 - y1, x2 - x1));
				ctx.beginPath();
				ctx.moveTo(-arrowLength, arrowWidth);
				ctx.lineTo(0, 0);
				ctx.lineTo(-arrowLength, -arrowWidth);
				ctx.lineTo(-arrowLength * 0.8, -0);
				ctx.closePath();
				ctx.fill();
				ctx.restore();
			}

			// label
			if (edge.data.label !== undefined) {
				ctx.save();
				ctx.textAlign = "center";
				ctx.textBaseline = "top";
				ctx.font = (edge.data.font !== undefined) ? edge.data.font : edgeFont;
				ctx.fillStyle = (edge.data.lblColor !== undefined) ? edge.data.lblColor : '#000000';;
				var angle = Math.atan2(s2.y - s1.y, s2.x - s1.x);
				var displacement = -8;
				if (edgeLabelsUpright && (angle > Math.PI/2 || angle < -Math.PI/2)) {
					displacement = 8;
					angle += Math.PI;
				}
				var textPos = s1.add(s2).divide(2).add(normal.multiply(displacement));
				ctx.translate(textPos.x, textPos.y);
				ctx.rotate(angle);
				ctx.fillText(edge.data.label, 0,-2);
				ctx.restore();
			}
			
			if (selectedEdge !== null && selectedEdge.edge !== null && selectedEdge.edge.id === edge.id) {
				ctx.save();
				ctx.lineWidth = 14;
				ctx.strokeStyle = "rgba(255,255,0,0.3)";
				ctx.beginPath();
				ctx.moveTo(s1.x, s1.y);
				ctx.lineTo(lineEnd.x, lineEnd.y);
				ctx.stroke();
				ctx.restore();
			}
		},
			
		function drawNode(node, p) {
			var s = toScreen(p);

			ctx.save();

			// Pulled out the padding aspect sso that the size functions could be used in multiple places
			// These should probably be settable by the user (and scoped higher) but this suffices for now
			var paddingX = 6;
			var paddingY = 6;

			var contentWidth = node.getWidth();
			var contentHeight = node.getHeight();
			var boxWidth = contentWidth + paddingX;
			var boxHeight = contentHeight + paddingY;

			var focusType = "";
			if (selectedNode !== null && selectedNode.node !== null && selectedNode.node.id === node.id) {
				focusType = "select";
			} else if (nearestNode !== null && nearestNode.node !== null && nearestNode.node.id === node.id) {
				focusType = "nearest";
			}
			
			if (node.data.image == undefined) {
				
				if(node.data.shape == "rect")
					drawRoundRect(ctx,s.x - boxWidth/2, s.y - boxHeight/2, boxWidth, boxHeight, 0, node.data.thick, node.data.stroke, node.data.fill, focusType);
				else if(node.data.shape == "round")
					drawRoundRect(ctx,s.x - boxWidth/2, s.y - boxHeight/2, boxWidth, boxHeight, node.data.radius, node.data.thick, node.data.stroke, node.data.fill, focusType);
				else if(node.data.shape == "ellispe")
					drawEllipse(ctx,s.x - boxWidth/2, s.y - boxHeight/2, boxWidth, boxHeight, node.data.thick, node.data.stroke, node.data.fill, focusType);
				else if(node.data.shape == "circle")
					drawCircle(ctx,s.x - boxWidth/2, s.y - boxHeight/2, boxWidth, boxHeight, node.data.thick, node.data.stroke, node.data.fill, focusType);
				else
					drawFocusRect(ctx, s.x - boxWidth/2, s.y - boxHeight/2, boxWidth, boxHeight, focusType);
				
				ctx.font = (node.data.font !== undefined) ? node.data.font : nodeFont;
				ctx.fillStyle = (node.data.color !== undefined) ? node.data.color : "#000000";
				var text = (node.data.label !== undefined) ? node.data.label : node.id;

				var isFixedSize = (node.data.fixedSize != undefined && node.data.fixedSize != "");
				if(isFixedSize) {
					ctx.textAlign = "center";
					ctx.textBaseline = "middle";
					ctx.fillText(text, s.x, s.y);
				} else {
					ctx.textAlign = "left";
					ctx.textBaseline = "top";
					ctx.fillText(text, s.x - contentWidth/2, s.y - contentHeight/2);
				}
			} else {
				drawFocusRect(ctx, s.x - boxWidth/2, s.y - boxHeight/2, boxWidth, boxHeight, focusType);
				
				// Currently we just ignore any labels if the image object is set. One might want to extend this logic to allow for both, or other composite nodes.
				var src = node.data.image.src;  // There should probably be a sanity check here too, but un-src-ed images aren't exaclty a disaster.
				if (src in nodeImages) {
					if (nodeImages[src].loaded) {
						// Our image is loaded, so it's safe to draw
						ctx.drawImage(nodeImages[src].object, s.x - contentWidth/2, s.y - contentHeight/2, contentWidth, contentHeight);
					}
				}else{
					// First time seeing an image with this src address, so add it to our set of image objects
					// Note: we index images by their src to avoid making too many duplicates
					nodeImages[src] = {};
					var img = new Image();
					nodeImages[src].object = img;
					img.addEventListener("load", function () {
						// HTMLImageElement objects are very finicky about being used before they are loaded, so we set a flag when it is done
						nodeImages[src].loaded = true;
					});
					img.src = src;
				}
			}
			ctx.restore();
		}
	);

	renderer.start();

	// helpers for figuring out where to draw arrows
	function intersect_line_line(p1, p2, p3, p4) {
		var denom = ((p4.y - p3.y)*(p2.x - p1.x) - (p4.x - p3.x)*(p2.y - p1.y));

		// lines are parallel
		if (denom === 0) {
			return false;
		}

		var ua = ((p4.x - p3.x)*(p1.y - p3.y) - (p4.y - p3.y)*(p1.x - p3.x)) / denom;
		var ub = ((p2.x - p1.x)*(p1.y - p3.y) - (p2.y - p1.y)*(p1.x - p3.x)) / denom;

		if (ua < 0 || ua > 1 || ub < 0 || ub > 1) {
			return false;
		}

		return new Springy.Vector(p1.x + ua * (p2.x - p1.x), p1.y + ua * (p2.y - p1.y));
	}

	function intersect_line_box(p1, p2, p3, w, h) {
		var tl = {x: p3.x, y: p3.y};
		var tr = {x: p3.x + w, y: p3.y};
		var bl = {x: p3.x, y: p3.y + h};
		var br = {x: p3.x + w, y: p3.y + h};

		var result;
		if (result = intersect_line_line(p1, p2, tl, tr)) { return result; } // top
		if (result = intersect_line_line(p1, p2, tr, br)) { return result; } // right
		if (result = intersect_line_line(p1, p2, br, bl)) { return result; } // bottom
		if (result = intersect_line_line(p1, p2, bl, tl)) { return result; } // left

		return false;
	}
	
	function drawFocusRect(ctx, x, y, width, height, focusType) {
		// clear background
		var focusFill = "#FFFFFF";
		if (focusType == "select") {
			focusFill = "#E0E0E0";
		} else if (focusType == "nearest") {
			focusFill = "#EEEEEE";
		} else {
			focusFill = "#FFFFFF";
		}
		
		ctx.clearRect(x, y, width, height);
		ctx.fillStyle = focusFill;
		ctx.fillRect(x, y, width, height);		
	}
	
	function drawCircle(ctx, x, y, width, height, thick, stroke, fill, focusType) {
		
		if(width>height) {
			y -= (width-height)/2;
			height = width;
		} else {
			x -= (height - width)/2;
			width = height;
		}
		
		drawEllipse(ctx, x, y, width, height, thick, stroke, fill, focusType);	
	}

	function drawEllipse(ctx, x, y, width, height, thick, stroke, fill, focusType) {
		
		if (focusType=="select" || focusType=="nearest") {
			ctx.beginPath();
			ctx.ellipse(x+width/2, y+height/2, width/2+6, height/2+6, 0, 0, 2 * Math.PI);
			ctx.fillStyle = "#f5F6F6";
			ctx.fill();
			
			ctx.lineWidth = 3;
			if(focusType=="select")
				ctx.strokeStyle = "rgba(151, 151, 151, 0.5)";
			else
				ctx.strokeStyle = "rgba(151, 151, 151, 0.2)";
			ctx.stroke();
		}
		
		ctx.beginPath();
		//ctx.ellipse(100, 100, 50, 75, 45 * Math.PI/180, 0, 2 * Math.PI);
		ctx.ellipse(x+width/2, y+height/2, width/2, height/2, 0, 0, 2 * Math.PI);
		
		if (typeof stroke != "undefined" && stroke != "") {
			ctx.strokeStyle = stroke;
			if (typeof thick == "undefined") {
				thick = 1;
			}
			ctx.lineWidth = thick;
			ctx.stroke();
		}
		
		if (typeof fill != "undefined" && fill != "") {
			ctx.fillStyle = fill;
			ctx.fill();
		}
	}
	
	function stokeRoundPath(ctx, x, y, width, height, radius) {
		ctx.beginPath();
		ctx.moveTo(x + radius, y);
		ctx.lineTo(x + width - radius, y);
		ctx.quadraticCurveTo(x + width, y, x + width, y + radius);
		ctx.lineTo(x + width, y + height - radius);
		ctx.quadraticCurveTo(x + width, y + height, x + width - radius, y + height);
		ctx.lineTo(x + radius, y + height);
		ctx.quadraticCurveTo(x, y + height, x, y + height - radius);
		ctx.lineTo(x, y + radius);
		ctx.quadraticCurveTo(x, y, x + radius, y);
		ctx.closePath();		
	}
	
	function drawRoundRect(ctx, x, y, width, height, radius, thick, stroke, fill, focusType) {
		
	    //ctx.fillRect(25,25,100,100);
	    //ctx.clearRect(45,45,60,60);
	    //ctx.strokeRect(50,50,50,50);
	    
		if (typeof radius === "undefined") {
			radius = 5;
		}		  
		
		if (focusType=="select" || focusType=="nearest") {
			
			stokeRoundPath(ctx, x-6, y-6, width + 12, height + 12, radius+3);
			
			ctx.fillStyle = "#f5F6F6";
			ctx.fill();
			
			ctx.lineWidth = 3;
			if(focusType=="select")
				ctx.strokeStyle = "rgba(151, 151, 151, 0.5)";
			else
				ctx.strokeStyle = "rgba(151, 151, 151, 0.2)";
			ctx.stroke();
		}

		stokeRoundPath(ctx, x, y, width, height, radius);
		  
		if (typeof stroke != "undefined" && stroke != "") {
			ctx.strokeStyle = stroke;
			if (typeof thick == "undefined") {
				thick = 1;
			}
			ctx.lineWidth = thick;
			ctx.stroke();
		}
		
		if (typeof fill != "undefined" && fill != "") {
			ctx.fillStyle = fill;
			ctx.fill();
		}
	}

	return this;
}

})();
