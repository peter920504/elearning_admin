<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
//var sysCom_Items_Json = ${sysCom_Items_Json};

$(document).ready(function() {
	var actYN = $('input[name=actYN]').val();
	actYN = "Y";
	
	$("#pageUnit").val("${searchVO.pageUnit}");
	$("#qw").val("${searchVO.qw}");
	$("#actYN").val("${searchVO.listActYN}");
});
</script>

<script type="text/javascript">

function goAdd() {
	
	var url = "./managerWrite";
		
    var winpop = window.open(url, "_mod_pop_data", "resizable=yes,scrollbars=yes,width=950,height=950");
    winpop.focus();
    
}

function goModify(seq) {
	
	var url = "./managerWrite?seq="+seq;
	
    var winpop = window.open(url, "_mod_pop_data", "resizable=yes,scrollbars=yes,width=950,height=950");
    winpop.focus();
    
}

function deactivatedList(){
	searchForm.actYN.value="N";
	searchForm.submit();
	var i = searchForm.deactBtn.find('i');
	i.className = "ace-icon fa fa-check-square-o";
}

function activatedList(){
	searchForm.actYN.value="Y";
	searchForm.submit();
	var i = searchForm.deactBtn.find('i');
	i.className = "ace-icon fa fa-check-square-o";
}

/* function deleteRecord(id) {
	var ids=[];
	ids.push(id);
	deleteRecordByIds(ids);
}

function deleteRecordMulti() {	
	var ids = $('.data-list input:checkbox:checked').map(function () {
		  return this.value;
		}).get();
	
	deleteRecordByIds(ids);
}ㄴ

function deleteRecordByIds(ids) {
	_deleteRecordByIds("./recordDeleteIds", ids);
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
} */

function goListAll() {
    $("#searchForm #q").val("");
    $("#searchForm #qw").val("");
    $("#searchForm #actYN").val("${searchVO.listActYN}");
    
    $("#searchForm").submit();
}


</script>

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
			<li class="active">관리자계정</li>
			<li class="active">계정목록</li>
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
					<input type="hidden" id="actYN" name="actYN" value="Y">
				
					<div class="form-group">
						<label class="control-label col-xs-4">검색필드</label>
						<div class="col-xs-6">
							<select name="qw" id="qw" class="form-control">
								<option value="">전체</option>
								<option value="id">아이디</option>
								<option value="name">이름</option>
								<option value="department">부서</option>
								<option value="phone">연락처</option>
								<option value="type_Name">권한</option>
							</select>
						</div>
						<div class="col-xs-17">
							<input type="text" name="q" id="q" size="30" value="${searchVO.q}" placeholder="검색어 입력" class="form-control">
						</div>
						<!-- <div>
							<label class="control-label col-xs-4">비활성 계정</label>
							<input type="checkbox" value="deactivate">
						</div> -->
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
			<button type="button" id="deactBtn" class="btn btn-success btn-sm" onclick="deactivatedList();"><i class="ace-icon fa fa-square-o"></i>비활성 계정</button>
			<button type="button" id="actBtn" class="btn btn-success btn-sm" onclick="activatedList();"><i class="ace-icon fa fa-square-o"></i>활성 계정</button>
			<button type="button" class="btn btn-info btn-sm" onclick="goAdd()"><i class="ace-icon glyphicon glyphicon-plus"></i>계정등록</button>
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
						<col style="width:18%">
						<col style="width:18%">
						<col style="width:18%">
						<col style="width:18%">
						<col style="width:4%">
						<col style="width:4%">
					</colgroup>
					<thead>
			        <tr>
						<th>번호</th>
						<th class="col-sort" data-sort="id">아이디</th>
						<th class="col-sort" data-sort="name">이름</th>
						<th class="col-sort" data-sort="department">부서</th>
						<th class="col-sort" data-sort="typeCode">권한</th>
						<th>활성상태</th>
						<th>관리</th>
			        </tr>
			        </thead>
					<tbody>
			        <c:forEach var="item" items="${managerList}" varStatus="rowStatus">
				    <tr>
						<td>${searchVO.firstIndex + rowStatus.count}</td>
						<td>${item.id}</td>
						<td>${item.name}</td>
						<td>${item.department}</td>
						<td>${item.typeName}</td>
						<c:if test="${item.activateYN eq'Y'}">
							<td>활성</td>
						</c:if>
						<c:if test="${item.activateYN eq 'N'}">
							<td>비활성</td>
						</c:if>
						<td>
							<a href="javascript:goModify('${item.seq}')" class="btn btn-minier">편집</a>
				      	</td>
				    </tr>
				    </c:forEach>
					<c:if test="${empty managerList}">
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