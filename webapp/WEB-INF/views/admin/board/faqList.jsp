<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function() {
	$("#pageUnit").val("${searchVO.pageUnit}");
	$("#qw").val("${searchVO.qw}");
	
	$('.page-content')
	.on('click', '.del', function( evt ) {
		delFaqIds(evt.target.form);
	});
	
});
</script>

<script type="text/javascript">
function goDeleteByIds(ids) {
	_goDeleteByIds("./deleteBoardIds", ids);
}

function delFaqIds() {
	var delId = $('.data-list input:checkbox:checked').map(function () {
		  return this.value;
	}).get();	

	if(delId.length < 1) {
		alert(" 삭제할 항목을 1개 이상 선택하세요!");
		return;
	}
	if ( confirm("선택한 데이터를 삭제하시겠습니까?") ) {

		$.blockUI({message: '<div><img src="/resources/images/common/busy.gif" width="50px"/></div>'});
		$.post("<c:url value='/admin/faq/delFaqIds' />", { "ids": delId }, null, "json").done(function (result, textStatus, jqXHR) {
			if (result.success) {
				self.location.reload();
			} else {
				alert(result.message);
			}
			
		}).fail(function (jqXHR, textStatus, errorThrown) { alert(jqXHR.status + " : " + textStatus + " : " + errorThrown); });
	}
}
function goAdd() {
    /* 
    var url = "./boardWrite";
    var winpop = window.open(url, "_add_pop", "resizable=yes,scrollbars=yes,width=1100,height=750");
    winpop.focus(); 
    */
   // document.location.href = "faqWrite";
    
    var url = "./faqWrite";
    var winpop = window.open(url, "_view_pop", "resizable=yes,scrollbars=yes,width=1100,height=650");
    winpop.focus();
}
function goModify(id) {
    var url = "./faqWrite?아이디=" + encodeURI(id);
	var winpop = window.open(url, "_view_pop", "resizable=yes,scrollbars=yes,width=1100,height=650");
    winpop.focus();
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
				<a href="<c:url value='/' />">Home</a>
			</li>
			<li class="active">게시판관리</li>
			<li class="active">FAQ</li>
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
						<label class="control-label col-xs-4">검색필드</label>
						<div class="col-xs-6">
							<select name="qw" id="qw" class="form-control">
								<option value="">전체</option>
								<option value="tit">제목</option>
							    <option value="cont">내용</option>
								<option value="writer">등록자</option>
								<option value="modifier">수정자</option>
							</select>
						</div>
						<div class="col-xs-14">
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
			<button type="button" class="btn btn-danger btn-sm del" "><i class="ace-icon fa fa-remove"></i>자료삭제</button>
			<button type="button" class="btn btn-info btn-sm" onclick="goAdd()"><i class="ace-icon glyphicon glyphicon-plus"></i>등록</button>
		</div>
		
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller pull-left">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					<%-- 검색목록 <span class="data-cnt">(조회수: ${fnItkc:to3DecimalFmt(dataCount)})</span> --%>
					검색목록 <span class="data-cnt">(${fnItkc:to3DecimalFmt(dataCount)})</span>
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
						<col style="width:60px">
						<col>
						<col>
						<col>
					</colgroup>
					<thead>
			        <tr>
			        	<th></th>
						<th class="col-sort" data-sort="">번호</th>
						<th class="col-sort" data-sort="ans">질문</th>
						<th class="col-sort" data-sort="writer">등록자</th>
						<th class="col-sort" data-sort="dateW">등록일</th>
			        </tr>
			        </thead>
			        <tbody>
			        <c:forEach var="item" items="${faqList}" varStatus="rowStatus"> 
				    <tr>
						<td><input type="checkbox" value="${item['아이디']}"></td>
						<td>${item['아이디']}</td>
						<td><a onclick="goModify('${item['아이디']}')">${item['질문']}</a></td>
						<td>${item['등록자이름']}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${item['등록일']}" /></td>
				    </tr>
				    </c:forEach>
					<c:if test="${empty faqList}">
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