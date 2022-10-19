<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<script type="text/javascript">
//var sysCom_Items_Json = ${sysCom_Items_Json};

$(document).ready(function() {
	$("#pageUnit").val("${searchVO.pageUnit}");
	$("#qw").val("${searchVO.qw}");
});
</script>

<script type="text/javascript">


function goAdd() {
	
	var url = "./managerWrite";
		
    var winpop = window.open(url, "_mod_pop_data", "resizable=yes,scrollbars=yes,width=950,height=950");
    winpop.focus();
    
}

function goModify(seq) {
	
	var url = "./answerWrite?seq="+seq;
	
    var winpop = window.open(url, "_mod_pop_data", "resizable=yes,scrollbars=yes,width=950,height=950");
    winpop.focus();
    
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
}

function goListAll() {
    $("#searchForm #q").val("");
    $("#searchForm #qw").val("");
    
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
			<li class="active">고객 소통 관리</li>
			<li class="active">1:1 문의</li>
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
						<label class="control-label col-xs-4">검색필드</label>
						<div class="col-xs-6">
							<select name="qw" id="qw" class="form-control">
								<option value="">전체</option>
								<option value="contentSeq">교육 컨텐츠 코드</option>
								<option value="userSeq">사용자</option>
								<option value="evaluation">내용</option>
								<option value="depth">답변 유무</option>
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
						<col style="width:3%">
						<col style="width:45%">
						<col style="width:25%">
						<col style="width:10%">
						<col style="width:5%">
						<col style="width:5%">
					</colgroup>
					<thead>
			        <tr>
						<th></th>
						<th>번호</th>
						<th class="col-sort" data-sort="contentsSeq">강의 제목</th>
						<th class="col-sort" data-sort="userSeq">작성자</th>
						<th class="col-sort" data-sort="wdate">작성일자</th>
						<th class="col-sort" data-sort="depth">답변유무</th>
						<th>관리</th>
			        </tr>
			        </thead>
					<tbody>
			        <c:forEach var="item" items="${questionList}" varStatus="rowStatus">
				    <tr>
						<td><input type="checkbox" value="${item.seq}"></td>
						<td>${searchVO.firstIndex + rowStatus.count}</td>
						<td>${item.title}</td>
						<td>${item.writerName}</td>
						<td>${item.wDate}</td>
						<td>
							<c:if test="${item.replyYN ne 'Y' }">Y</c:if>
						</td>
						<td>
							<a href="javascript:goModify('${item.seq}')" class="btn btn-minier">답변</a>
							<a href="javascript:goDelete('${item.seq}')" class="btn btn-minier">삭제</a>
				      	</td>
				      	
				    </tr>
				    </c:forEach>
					<c:if test="${empty questionList}">
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