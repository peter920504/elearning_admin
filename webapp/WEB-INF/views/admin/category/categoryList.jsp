<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
//var sysCom_Items_Json = ${sysCom_Items_Json};

$(document).ready(function() {
	$("#pageUnit").val("${searchVO.pageUnit}");
	$("#qw").val("${searchVO.qw}");
	
	$.ajax(url,{
 		method : "POST",
 		dataType : "json",
 		data : {
 			"seq" : seq
 			},
 		success: function(data) {
 			var cnt = data.chkCnt;
			if(cnt > 1){
				alert('삭제불가 : 하위데이터 존재 ('+(cnt-1)+'개)');
				return false;
			}else{
				deleteRecord(seq);
			}
 		}
	});
	
	
	
});
</script>

<script type="text/javascript">

function goAdd() {
	
	var url = "./categoryWrite";
		
    var winpop = window.open(url, "_mod_pop_data", "resizable=yes,scrollbars=yes,width=950,height=950");
    winpop.focus();
    
}

function goModify(seq) {
	
	var url = "./categoryWrite?seq="+seq;
	
    var winpop = window.open(url, "_mod_pop_data", "resizable=yes,scrollbars=yes,width=950,height=950");
    winpop.focus();
    
}

function checkRowLevel(seq){
	var url = "./checkRowLevel";
	$.ajax(url,{
 		method : "POST",
 		dataType : "json",
 		data : {
 			"seq" : seq
 			},
 		success: function(data) {
 			var cnt = data.chkCnt;
			if(cnt > 1){
				alert('삭제불가 : 하위데이터 존재 ('+(cnt-1)+'개)');
				return false;
			}else{
				deleteRecord(seq);
			}
 		}
	});
}

function deleteRecord(id) {
	var ids=[];
	ids.push(id);
	deleteRecordByIds(ids);
}

function deleteRecordMulti() {	
	var ids = $('.data-list input:checkbox:checked').map(function () {
		  return this.value;
		}).get();
	
	deleteRecordByIds(ids);
}

function deleteRecordByIds(ids) {
	_deleteRecordByIds("./categoryDeleteIds", ids);
}

function _deleteRecordByIds(url, ids) {
	if(ids.length <1) {
		alert("삭제할 항목을 1개 이상 선택하세요!");
		return;
	}
	
    if (confirm("선택한 항목를 삭제하시겠습니까")) {
    	$.blockUI({message: '<div><img src="<c:url value='/resources/images/common/busy.gif'/>" width="50px"/></div>'});
        $.post(url, { "ids": ids }, null, "json")
        .done(function (result, textStatus, jqXHR) {
			//alert(result + ":" + textStatus + ":" + jqXHR.status); //jqXHR.readyState,jqXHR.status,jqXHR.statusText,jqXHR.responseXML,jqXHR.responseTexT
			if (result.success) {
			    alert("자료가 삭제되었습니다.");
			    self.location.reload();

			}else
			    alert(result.message);
		}).fail(function (jqXHR, textStatus, errorThrown) { alert(jqXHR.status + " : " + textStatus + " : " + errorThrown); });
    }
}

function goListAll() {
    $("#searchForm #q").val("");
    $("#searchForm #qw").val("");
    
    $("#searchForm").submit();
}

function selectLv2(seq){
	var level = 2;
	var url = "./categoryAjax";
	
	$.ajax(url,{
 		method : "POST",
 		dataType : "json",
 		data : {
 			"seq" : seq,
 			"level" : level
 			},
 		success: function(data) {
 			var dataList = data.dataList;
 			var body = $("#tBodyLv2");
 			body.empty();

 			if(dataList == "") {
 				body.append("<tr><td colspan='11'>조회 목록이 존재하지 않습니다.</td></tr>");
 			}else {
	 			body.append(dataList);
 			}
 		}
	});
}

function selectLv3(seq){
	var level = 3;
	var url = "./categoryAjax";
	
	$.ajax(url,{
 		method : "POST",
 		dataType : "json",
 		data : {
 			"seq" : seq,
 			"level" : level
 			},
 		success: function(data) {
 			var dataList = data.dataList;
 			var body = $("#tBodyLv3");
 			body.empty();
 			
 			if(dataList == "") {
 				body.append("<tr><td colspan='11'>조회 목록이 존재하지 않습니다.</td></tr>");
 			}else {
	 			body.append(dataList);
 			}
 		}
	});
}

</script>

<style>
	.cateTable{
		width: 30%;
		float: left;
		margin-right: 3%;
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
			<li class="active">카테고리</li>
			<li class="active">카테고리 목록</li>
		</ul>
	</div>
	
	<div class="page-content">
		<div class="cont-info">
			<button type="button" class="btn btn-info btn-sm" onclick="goAdd()"><i class="ace-icon glyphicon glyphicon-plus"></i>카테고리 등록</button>
		</div>
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller pull-left">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					카테고리 목록
				</h4>
			</div>
			<div class="widget-body data-tbl" style="overflow: auto;">
			    <table class="table table-striped table-bordered table-hover data-list cateTable">
					<colgroup>
						<col style="width:80%">
						<col style="width:20%">
					</colgroup>
					<thead>
				        <tr>
							<th class="col-sort">대분류</th>
							<th class="col-sort">관리</th>
				        </tr>
			        </thead>
					<tbody>
		        		<c:forEach var="item" items="${categoryList}" varStatus="rowStatus">
				    		<tr>
								<td>
									<a href="javascript:selectLv2(${item.seq});"> ${item.title} </a>
								</td>
								<td>
									<a href="javascript:goModify(${item.seq})" class="btn btn-minier">편집</a>
									<a href="javascript:checkRowLevel(${item.seq})" class="btn btn-minier">삭제</a>
								</td>
						    </tr>
				    	</c:forEach>
						<c:if test="${empty categoryList}">
							<tr><td colspan="11">조회 목록이 존재하지 않습니다.</td></tr>
						</c:if>
					</tbody>
			    </table>		
				
			    <table class="table table-striped table-bordered table-hover data-list cateTable">
					<colgroup>
						<col style="width:80%">
						<col style="width:20%">
					</colgroup>
					<thead>
				        <tr>
							<th class="col-sort">중분류</th>
							<th class="col-sort">관리</th>
				        </tr>
			        </thead>
					<tbody id="tBodyLv2">
						
					</tbody>
			    </table>		
				
			    <table class="table table-striped table-bordered table-hover data-list cateTable">
					<colgroup>
						<col style="width:80%">
						<col style="width:20%">
					</colgroup>
					<thead>
				        <tr>
							<th class="col-sort">소분류</th>
							<th class="col-sort">관리</th>
				        </tr>
			        </thead>
					<tbody id="tBodyLv3">
						
					</tbody>
			    </table>		
			    
			    
			</div><!-- widget-body -->
		</div><!-- widget-box -->
	</div><!-- page-content -->
</div><!-- main-content-inner -->