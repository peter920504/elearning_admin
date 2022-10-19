//Show notification
const showNotification = () => {
//function showNotification() {
	var notification = document.getElementById('notification-container');
    notification.classList.add('show')
    setTimeout(() => {
      notification.classList.remove('show')
    }, 3000)
};

// Show notification
const showNotification2 = () => {
	//function showNotification() {
	var notification = document.getElementById('notification-container3');
	notification.classList.add('show')
	setTimeout(() => {
		notification.classList.remove('show')
	}, 3000)
};

//Show notification
const showNotification3 = () => {
	//function showNotification() {
	var notification = document.getElementById('notification-container4');
	notification.classList.add('show')
	setTimeout(() => {
		notification.classList.remove('show')
	}, 3000)
};

function insertMyCon(itemSeq) {
	$.ajax({
		type : "GET",
		url : "../edu/insertMyContent?conSeq="+itemSeq,
		dataType: 'json',
		success : function(data) {
			
			if(data > 0) {
				showNotification();
				
				var html = "";
				html += "<div class='card-ribbon card-ribbon-bottom card-ribbon-right bg-primary text-white'>수강중</div>";
				
				var div_name = itemSeq + '-ribbon-div';
				//var ribbon_div = document.getElementById(div_name);
				//ribbon_div.append(html);
				$('#'+div_name).append(html);
				
				setTimeout(function(){
					location.reload();
				},2000);
				
			}
			
		}
	});
}

function addWishList(itemSeq) {
	$.ajax({
		async: false,
		type: "POST",
		url: "../../account/addWish",
		data: { conSeq: itemSeq },
		success: function(data) {
			if (data > 0) {
				showNotification2();

				setTimeout(function() {
					location.reload();
				}, 2000);
			}
		},
		error: function(request, error) {
			alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}

function delWishList(itemSeq) {
	$.ajax({
		async: false,
		type: "POST",
		url: "../../account/delWish",
		data: { conSeq: itemSeq },
		success: function(data) {
			if (data > 0) {
				showNotification3();

				setTimeout(function() {
					location.reload();
				}, 2000);
			}
		},
		error: function(request, error) {
			alert("code:"  + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		}
	});
}