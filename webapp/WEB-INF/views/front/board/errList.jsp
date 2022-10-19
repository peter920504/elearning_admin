<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function() {
	$("#pageUnit").val("${searchVO.pageUnit}");
	$("#qw").val("${searchVO.qw}");
	$("#itemName").val("${searchVO.itemName}");
	$("#errType").val("${searchVO.errType}");
	$("#replyType").val("${searchVO.replyType}");
});
</script>

<script type="text/javascript">
function goDeleteByIds(ids) {
	_goDeleteByIds("./deleteErrIds", ids);
}

function goAdd() {
    var url = "./errWrite?mode=new";
    var winpop = window.open(url, "_add_pop", "resizable=yes,scrollbars=yes,width=700,height=650");
    winpop.focus();
}

function goWrite(id) {
    var url = "./errWrite?mode=modify&id=" + encodeURI(id);
    var winpop = window.open(url, "_modify_pop", "resizable=yes,scrollbars=yes,width=700,height=650");
    winpop.focus();
}
function goReply(id) {
    var url = "./errWrite?mode=reply&id=" + encodeURI(id);
    var winpop = window.open(url, "_reply_pop", "resizable=yes,scrollbars=yes,width=700,height=950");
    winpop.focus();
}
function goListAll() {
    $("#searchForm #q").val("");
    $("#searchForm #qw").val("");
    $("#searchForm #itemName").val("");
    $("#searchForm #errType").val("");
    $("#searchForm #replyType").val("");
    $("#searchForm").submit();
}
</script>

<div class="main-content-inner">
	<div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
		<script type="text/javascript">
			try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){return;}
		</script>

		<ul class="breadcrumb">
			<li>
				<i class="ace-icon fa fa-home home-icon"></i>
				<a href="<c:url value='/' />">Home</a>
			</li>
			<li class="active">열린마당</li>
			<li class="active">오류신고</li>
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
					<input type="hidden" name="sortField" value="">
					<input type="hidden" name="sortOrder" value="">
					<input type="hidden" name="pageUnit" value="${searchVO.pageUnit}">

					<div class="form-group">
						<label class="control-label col-xs-4">오류유형</label>
						<div class="col-xs-5">
							<select name="errType" id="errType" class="form-control">
								<option value="">전체</option>
						        <c:forEach var="item" items="${sysCom_ErrRpt_ErrTypes}" varStatus="rowStatus">
								<option value="${item['이름']}">${item['이름']}</option>
							    </c:forEach>
							</select>
						</div>	
						
						<label class="control-label col-xs-4">처리상태</label>
						<div class="col-xs-5">
							<select name="replyType" id="replyType" class="form-control">
								<option value="">전체</option>
								<option value="N">미완료</option>
								<option value="Y">완료</option>
							</select>						
						</div>						
					</div>
											
					<div class="form-group">
						<label class="control-label col-xs-4">검색필드</label>
						<div class="col-xs-5">
							<select name="qw" id="qw" class="form-control">
								<option value="">전체</option>
								<option value="title">제목</option>
							    <option value="errUrl">오류URL</option>
								<option value="errCont">오류내용</option>
								<option value="reporter">신고자</option>
								<option value="rptEmail">신고자이메일</option>
								<option value="replyer">답변자</option>
								<option value="replyCont">답변내용</option>
							</select>
						</div>
						<div class="col-xs-20">
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
			<button type="button" class="btn btn-danger btn-sm" onclick="goDeleteMulti();"><i class="ace-icon fa fa-remove"></i>자료삭제</button>
			<button type="button" class="btn btn-info btn-sm" onclick="goAdd()"><i class="ace-icon glyphicon glyphicon-plus"></i>등록</button>
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
						<col style="width:20px">
						<col style="width:50px">
						<col>
						<col>
						<col>
						<col>
						<col style="width:130px">
						<col style="width:130px">
					</colgroup>
					<thead>
			        <tr>
			        	<th></th>
						<th class="col-sort" data-sort="">번호</th>
						<th class="col-sort" data-sort="errType">오류유형</th>
						<th class="col-sort" data-sort="title">제목</th>
						<th class="col-sort" data-sort="replyType">처리상태</th>
						<th class="col-sort" data-sort="reporter">신고자</th>
						<th class="col-sort" data-sort="dateW">신고일</th>
						<th>관리</th>
			        </tr>
			        </thead>
			        <tbody>
			        <c:forEach var="item" items="${dataList}" varStatus="rowStatus">
				    <tr>
						<td><input type="checkbox" value="${item['오류신고번호']}"></td>
						<td>${searchVO.firstIndex + rowStatus.count}</td>
						<td>${item['오류유형']}</td>
						<td>${item['제목']}</td>
						<td>${item['처리상태']}</td>
						<td>${item['신고자이름']}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${item['신고일']}" /></td>
						<td>
							<a href="javascript:goWrite('${item['오류신고번호']}')" class="btn btn-minier">수정</a>
							<a href="javascript:goReply('${item['오류신고번호']}')" class="btn btn-minier">답변</a>
							<a href="javascript:goDelete('${item['오류신고번호']}')" class="btn btn-minier">삭제</a>
				      	</td>
				    </tr>
				    </c:forEach>
					<c:if test="${empty dataList}">
						<tr><td colspan="20">조회 목록이 존재하지 않습니다.</td></tr>
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