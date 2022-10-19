<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
//var sysCom_Items_Json = ${sysCom_Items_Json};

$(document).ready(function() {
	$("#pageUnit").val("${searchVO.pageUnit}");
	$("#qw").val("${searchVO.qw}");
	
	
	$("#searchCate1").change(function() {
		var resetOption = '<option value="">소분류전체</option>'
		$("#searchCate3").empty();
		$("#searchCate3").html(resetOption);
		
		var key = $("#searchCate1").val();
		var level = 2;
		getSubCate2(key, level);
	});
	
	$("#searchCate2").change(function() {
		var key = $("#searchCate2").val();
		var level = 3;
		getSubCate3(key, level);
	});
	
});

function getSubCate2(key, level) {
	$.ajax({
		type : "GET",
		url : "../admin/getSubCateList",
		data : {
			key: key,
			level: level
		},
		dataType: 'json',
		success : function(data) {
			var html = "";
			var cate2 = $('#searchCate2').val();
			html += '<option value="">중분류전체</option>'
			
			if(data.length == 0 || data.length == '0' || data[0].pSeq == 0) { 
				//조회한 카테고리 목록이 없는 경우
				html += '<option value="1">기타</option>';
				$("#searchCate2").empty();
				$("#searchCate2").html(html);
			}else {
				for(var i = 0; i<data.length; i++) {
					if(cate2 != null && cate2 != '' && cate2 == data[i].seq) {
						html += '<option value="'+data[i].seq+'" selected>' +data[i].title+'</option>';
					}else {
						html += '<option value="'+data[i].seq+'">' +data[i].title+'</option>';
					}
					$("#searchCate2").html(html);
				}
				html += '<option value="1">기타</option>';
				$("#searchCate2").html(html);
			}
			
			var cate2 = $('#searchCate2').val();
			getSubCate3(cate2, 3);
		}
	});
	
}

function getSubCate3(key, level) {
	$.ajax({
		type : "GET",
		url : "../admin/getSubCateList",
		data : {
			key: key,
			level: level
		},
		dataType: 'json',
		success : function(data) {
			var html = "";
			var cate3 = $('#searchCate3').val();
			html += '<option value="">소분류전체</option>'
			
			if(data.length == 0 || data.length == '0' || data[0].pSeq == 0) {
				html += '<option value="1">기타</option>';
				$("#searchCate3").empty();
				$("#searchCate3").html(html);
			}else {
				for(var i = 0; i<data.length; i++) {
					if(cate3 != null && cate3 != '' && cate3 == data[i].seq) {
						html += '<option value="'+data[i].title+'" selected>' +data[i].title+'</option>';
					}else {
						html += '<option value="'+data[i].title+'">' +data[i].title+'</option>';
					}
					$("#searchCate3").html(html);
				}
				html += '<option value="1">기타</option>';
				$("#searchCate3").html(html);
			}
			
		}
	});
}



function goListAll() {
    $("#searchForm #q").val("");
    $("#searchForm #qw").val("");
    
    $("#searchForm #searchCate1").val("");
    $("#searchForm #searchCate2").val("");
    $("#searchForm #searchCate3").val("");
    
    $("#searchForm").submit();
}

function goAdd() {
	
	var url = "./eduContentsWrite";
		
    var winpop = window.open(url, "_mod_pop_data", "resizable=yes,scrollbars=yes,width=950,height=950");
    winpop.focus();
    
}

function goModify(seq) {
	
	var url = "./eduContentsWrite?seq="+seq;
	
    var winpop = window.open(url, "_mod_pop_data", "resizable=yes,scrollbars=yes,width=950,height=950");
    winpop.focus();
    
}

function goCurriculum(seq) {
	var url = "./curriculumList?qw=CONTENTS_SEQ&q="+seq;
	location.href=url;
}


function goDelete(seq) {
	if(confirm("삭제시 해당 컨텐츠와 관련된 교육과정도 함께 삭제됩니다. 해당 컨텐츠를 삭제하시겠습니까?")) {
		location.href = "<c:url value='./eduContentsDelete?seq="+seq+"'/>";
	}
}

function delEduContentsIds() {
	 var delId = $('.data-list input:checkbox:checked').map(function () {
			return this.value;
		}).get();
	 
	 var fileId = new Array();
		for (var i = 1; i < $('table tr').size(); i++) {
			var chk = $('table tr').eq(i).children().find('input[type="checkbox"]').is(':checked');

			if (chk == true) {
				var id = $('table tr').eq(i).children().find('input[type="hidden"]').map(function() {
					fileId.push(this.value);
					return this.value;
				}).get();
			}
		}

		if(delId.length < 1) {
			alert(" 삭제할 항목을 1개 이상 선택하세요!");
			return;
		}
		if ( confirm("선택한 데이터를 삭제하시겠습니까?") ) {

			$.blockUI({message: '<div><img src="/resources/images/common/busy.gif" width="50px"/></div>'});
			$.post("<c:url value='./delEduContentsSeqs' />", { "seqs": delId}, null, "json").done(function (result, textStatus, jqXHR) {
				if (result.success) {
					self.location.reload();
				} else {
					alert(result.message);
				}
				
			}).fail(function (jqXHR, textStatus, errorThrown) { alert(jqXHR.status + " : " + textStatus + " : " + errorThrown); });
		}
	}


</script>

<style>
table {
	text-align: center;
}

th {
	text-align: center;
}

.mngBtn {
	padding: 1px !important;
}

</style>

<div class="main-content-inner">

	<div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
		<script type="text/javascript">
			try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
		</script>

		<ul class="breadcrumb">
			<li>
				<i class="ace-icon fa fa-home home-icon"></i>
				<a href="<c:url value='/admin' />">Home</a>
			</li>
			<li class="active">컨텐츠관리</li>
			<li class="active">컨텐츠목록</li>
		</ul>
	</div>
	
	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					검색조건
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form name="searchForm" id="searchForm" method="get" class="form-horizontal">
				<div class="form-group">
						<label class="control-label col-xs-4">카테고리</label>
						<div class="col-xs-6">
							<select name="searchCate1" id="searchCate1" class="form-control">
								<option value="">대분류전체</option>
								<c:forEach var="item" items="${categoryList}" varStatus="rowStatus">
									<c:if test="${item.level eq 1}">
										<option value="${item.seq}" ${searchVO.searchCate1 eq item.seq ? "selected" : ""}>${item.title}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class="col-xs-6">
							<select name="searchCate2" id="searchCate2" class="form-control">
								<option value="">중분류전체</option>
								<c:forEach var="item" items="${categoryList}" varStatus="rowStatus">
									<c:if test="${item.level eq 2}">
										<option value="${item.seq}" ${searchVO.searchCate2 eq item.seq ? "selected" : ""}>${item.title}</option>
									</c:if>
								</c:forEach>
								<option value="1" ${searchVO.searchCate2 eq "1" ? "selected" : ""}>기타</option>
							</select>
						</div>
						<div class="col-xs-6">
							<select name="searchCate3" id="searchCate3" class="form-control">
								<option value="">소분류전체</option>
								<c:forEach var="item" items="${categoryList}" varStatus="rowStatus">
									<c:if test="${item.level eq 3}">
										<option value="${item.seq}" ${searchVO.searchCate3 eq item.seq ? "selected" : ""}>${item.title}</option>
									</c:if>
								</c:forEach>
								<option value="1" ${searchVO.searchCate3 eq "1" ? "selected" : ""}>기타</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-4">검색필드</label>
						<div class="col-xs-6">
							<select name="qw" id="qw" class="form-control">
								<option value="">전체</option>
								<option value="seq">등록번호</option>
								<option value="title">제목</option>
								<option value="difficulty">난이도</option>
							</select>
						</div>
						<div class="col-xs-17">
							<input type="text" name="q" id="q" size="30" value="${searchVO.q}" placeholder="검색어 입력" class="form-control">
						</div>
						<div class="col-xs-15">
							<button type="submit" class="btn btn-primary btn-sm"><i class="ace-icon fa fa-search"></i>검색</button>
							<input type="button" value="전체목록" class="btn btn-primary btn-sm" onclick="goListAll()">
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
		
		<div class="cont-info">
			<button type="button" class="btn btn-success btn-sm" onclick="selectAll();"><i class="ace-icon fa fa-check-square-o"></i>전체선택</button>
			<button type="button" class="btn btn-success btn-sm" onclick="releaseAll();"><i class="ace-icon fa fa-square-o"></i>전체해제</button>
			<button type="button" class="btn btn-danger btn-sm" onclick="delEduContentsIds();"><i class="ace-icon fa fa-remove"></i>선택삭제</button>
			<button type="button" class="btn btn-info btn-sm" onclick="goAdd()"><i class="ace-icon glyphicon glyphicon-plus"></i>컨텐츠등록</button>
		</div>
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller pull-left">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					검색목록 <span class="data-cnt">(조회수: ${fnItkc:to3DecimalFmt(dataCount)})</span>
				</h4>
				<div class="pull-right page-changer">
				    목록수:
					<select name="pageUnit" id="pageUnit" onchange="changeFirstIndex('pageUnit', this.value);">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
						<option value="100">100</option>
						<option value="200">200</option>
					</select>
				</div>
			</div>
			<div class="widget-body data-tbl">
			    <table class="table table-striped table-bordered table-hover data-list">
					<colgroup>
						<col style="width:3%">
						<col style="width:4%">
						<col style="width:18%">
						<col style="width:15%">
						<col style="width:6%">
						<col style="width:5%">
						<col style="width:5%">
						<col style="width:10%">
					</colgroup>
					<thead>
			        <tr>
						<th></th>
						<th class="col-sort" data-sort="seq">등록번호</th>
						<th class="col-sort" data-sort="title">제목</th>
						<th class="col-sort">카테고리</th>
						<th class="col-sort">강사/저자</th>
						<th class="col-sort" data-sort="difficulty">난이도</th>
						<th class="col-sort">서비스유무</th>
						<th>관리</th>
			        </tr>
			        </thead>
					<tbody>
			        <c:forEach var="item" items="${eduContentsList}" varStatus="rowStatus">
				    <tr>
						<td><input type="checkbox" value="${item.seq}"></td>
						<!-- <td>${searchVO.firstIndex + rowStatus.count}</td> -->
						<td>${item.seq}</td>
						<td>${item.title}</td>
						<td>${item.cate1Name} &gt; ${item.cate2Name} &gt; ${item.cate3Name}</td>
						<td>${item.author}</td>
						<td>${item.difficulty}</td>
						<td>${item.isService}</td>
						<td>
							<a href="javascript:goModify('${item.seq}')" class="btn btn-info mngBtn">컨텐츠관리</a>
							<a href="javascript:goCurriculum('${item.seq}')" class="btn btn-info mngBtn">과정관리</a>
							<a href="javascript:goDelete('${item.seq}')" class="btn btn-grey mngBtn">삭제</a>
				      	</td>
				    </tr>
				    </c:forEach>
					<c:if test="${empty eduContentsList}">
						<tr><td colspan="11">조회 목록이 존재하지 않습니다.</td></tr>
					</c:if>
					</tbody>
			    </table>		
				
				
				<div id="paging">
					<div class="pagination-wrap">
						${RenderPagination}
					</div>
					<div class="page-index-changer">
						<input class="ui-pg-input" type="text" maxlength="7" value="${searchVO.pageIndex}"> / <span style="vertical-align:middle;">${searchVO.totalPage}</span>
						<a onclick="changeLocation('pageIndex', $(this).closest('div').find('.ui-pg-input').val())" class="btn btn-info btn-minier">go</a>					
					</div>
				</div>
				
			</div><!-- widget-body -->
		</div><!-- widget-box -->
		
	</div><!-- page-content -->
</div><!-- main-content-inner -->