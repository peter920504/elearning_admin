<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">

function goAdd() {
	
	var url = "./faqWrite";
		
    var winpop = window.open(url, "_mod_pop_data", "resizable=yes,scrollbars=yes,width=950,height=950");
    winpop.focus();
    
}

function goModify(seq) {
	
	var url = "./faqWrite?seq="+seq;
	
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
			<li class="active">고객소통관리</li>
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
			<button type="button" class="btn btn-success btn-sm" onclick="selectAll();"><i class="ace-icon fa fa-check-square-o"></i>전체선택</button>
			<button type="button" class="btn btn-success btn-sm" onclick="releaseAll();"><i class="ace-icon fa fa-square-o"></i>전체해제</button>
			<button type="button" class="btn btn-info btn-sm" onclick="goAdd()"><i class="ace-icon glyphicon glyphicon-plus"></i>글 작성</button>
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
						<col style="width:15%">
						<col style="width:40%">
						<col style="width:15%">
						<col style="width:15%">
						<col style="width:5%">
					</colgroup>
					<thead>
			        <tr>
			        	<th></th>
						<th>번호</th>
						<th class="col-sort" data-sort="type">카테고리</th>
						<th class="col-sort" data-sort="">제목</th>
						<th class="col-sort" data-sort="managerSeq">작성자</th>
						<th class="col-sort" data-sort="regDate">작성일</th>
						<th>관리</th>
			        </tr>
			        </thead>
					<tbody>
			        <c:forEach var="item" items="${faqList}" varStatus="rowStatus">
				    <tr>
						<td><input type="checkbox" value="${item.seq}"></td>
						<td>${searchVO.firstIndex + rowStatus.count}</td>
						<td>${item.type}</td>
						<td>${item.title}</td>
						<td>${item.managerName}</td>
						<td>${item.regDate}</td>
						<td>
							<a href="javascript:goModify('${item.seq}')" class="btn btn-minier">편집</a>
				      	</td>
				    </tr>
				    </c:forEach>
					<c:if test="${empty faqList}">
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