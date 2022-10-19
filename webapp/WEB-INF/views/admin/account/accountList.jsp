<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">

$(document).ready(function() {
	$("#pageUnit").val("${searchVO.pageUnit}");
	$('.page-content')
		.on('change', '.접속권한', function( evt ) {
			권한_변경_처리( this );
		})

		//alert('${searchVO.getSortField()}');
});	

function selectImgAll() {
	$('.data-list input:checkbox').prop('checked', true);
}

function releaseImgAll() {
	$('.data-list input:checkbox').prop('checked', false);
}


function goListAll(btn) {
    $(btn.form).find(":input[name='q']").val("");
    $(btn.form).find(":input[name='qw']").val("");
    $(btn.form).submit();
}

function 권한_삭제_처리() {
	var 삭제사용자id = $('.data-list input:checkbox:checked').map(function () {
		  return this.value;
	}).get();

	if(삭제사용자id.length <1) {
		alert(" 삭제할 항목을 1개 이상 선택하세요!");
		return;
	}
	if ( confirm("선택한 사용자를 삭제하시겠습니까?") ) {

		$.blockUI({message: '<div><img src="/resources/images/common/busy.gif" width="50px"/></div>'});
		$.post("<c:url value='/admin/account/deleteUserroleList' />", { "삭제사용자id": 삭제사용자id }, null, "json").done(function (result, textStatus, jqXHR) {

			if (result.success)
				self.location.reload();
			else
				alert(result.message);
			
		}).fail(function (jqXHR, textStatus, errorThrown) { alert(jqXHR.status + " : " + textStatus + " : " + errorThrown); });
	}
}

function 권한_변경_처리( target  ) {
	var frmdata = {"사용자ID": $(target).data('userid'), "접속권한":target.value };

	$.blockUI({message: '<div><img src="/resources/images/common/busy.gif" width="50px"/></div>'});
	$.post("<c:url value='/admin/account/modifyUserrole' />", frmdata, null, "json").done(function (result, textStatus, jqXHR) {

		if (result.success)
			alert("권한을 수정하였습니다");
		else
			alert(result.message);
		
	}).fail(function (jqXHR, textStatus, errorThrown) { alert(jqXHR.status + " : " + textStatus + " : " + errorThrown); });
}

function goAdd() {
	   document.location.href = "write";
}

function 그룹웨어_검색_처리(frm) {
	var param = $(frm).serialize();
	$.blockUI({message: '<div><img src="/resources/images/common/busy.gif" width="50px"/></div>'});
	$.post( "<c:url value='/admin/account/gwUserList' />", param).done(function (result, textStatus, jqXHR) {
		
		$("#gwUserList").html( result );
		
	}).fail(function (jqXHR, textStatus, errorThrown) { alert(jqXHR.status + " : " + textStatus + " : " + errorThrown); });
}






function gwUserListPage( pageParam, pageIndex, pageUnit) {
	var param = pageParam + "&pageIndex=" + pageIndex + "&pageUnit=" + pageUnit;

	$.blockUI({message: '<div><img src="/resources/images/common/busy.gif" width="50px"/></div>'});
	$.post( "<c:url value='/admin/account/gwUserList' />", param).done(function (result, textStatus, jqXHR) {
		
		$("#gwUserList").html( result );
		
	}).fail(function (jqXHR, textStatus, errorThrown) { alert(jqXHR.status + " : " + textStatus + " : " + errorThrown); });
}





function 권한_등록_처리( btn ) {
	
	var 등록사용자id = $('#frmsearch그룹웨어 input:checkbox:checked').map(function () {
		  return this.value;
	}).get();

	if( 등록사용자id.length == 0 ) {
		alert(" 등록할 할 사용자를 1개 이상 선택하세요.");
		return;
	}
	if ( confirm("선택한 사용자를 등록하시겠습니까?") ) {
		$.blockUI({message: '<div><img src="/resources/images/common/busy.gif" width="50px"/></div>'});
		$.post("<c:url value='/admin/account/registUser' />", { "등록사용자id": 등록사용자id }, null, "json").done(function (result, textStatus, jqXHR) {
    
			if (result.success)
				self.location.reload();
			else
				alert(result.message);
			
		}).fail(function (jqXHR, textStatus, errorThrown) { alert(jqXHR.status + " : " + textStatus + " : " + errorThrown); });
	}
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
			<li class="active">시스템관리</li>
			<li class="active">계정관리</li>
		</ul>
	</div>

	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					<span>검색조건</span>
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form name="searchForm" id="searchForm" method="get" action="<c:url value='/admin/account/list' />" class="form-horizontal">
					<input type="hidden" name="sortField" value="">
					<input type="hidden" name="sortOrder" value="">
					<input type="hidden" name="pageUnit" value="${searchVO.pageUnit}">

					<div class="form-group">
						<label class="control-label col-xs-8">검색</label>
						<div class="col-xs-8">
							<select name="qw" class="form-control">
								<option value="전체" selected >전체</option>
							</select>
						</div>
						<div class="col-xs-8">
							<input type="text" class="form-control" name="q" value="${searchVO['q']}">
						</div>
						<div class="col-xs-16">
							<button type="submit" class="btn btn-primary btn-sm"><i class="ace-icon fa fa-search"></i>검색</button>
							<button type="button" class="btn btn-primary btn-sm" onclick="goListAll(this)">전체목록</button>
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
		
		<div class="cont-info">
  	
			<button type="button" class="btn btn-success btn-xs" onclick="selectImgAll();"><i class="ace-icon fa fa-check-square-o"></i>전체선택</button>
			<button type="button" class="btn btn-success btn-xs" onclick="releaseImgAll();"><i class="ace-icon fa fa-square-o"></i>전체해제</button>
			<button type="button" class="btn btn-danger btn-xs" onclick="권한_삭제_처리();"><i class="ace-icon fa fa-trash-o"></i>선택삭제</button>

			<div class="pull-right">
				<button type="button" class="btn btn-success btn-xs" onclick="goAdd();">등록</button>
			</div>
 		</div>
 				
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller pull-left">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					검색목록 <span class="data-cnt">(${fnItkc:to3DecimalFmt(dataCount)} 개)</span>
				</h4>
				<div class="pull-right page-changer">
					목록수:
					<select name="pageUnit" id="pageUnit" onchange="changeFirstIndex('pageUnit', this.value);">
						<option value="10"   ${searchVO["pageUnit"]=="10"?"selected":""} >10</option>
						<option value="20"   ${searchVO["pageUnit"]=="20"?"selected":""} >20</option>
						<option value="50"   ${searchVO["pageUnit"]=="50"?"selected":""} >50</option>
						<option value="100"  ${searchVO["pageUnit"]=="100"?"selected":""} >100</option>
					</select>
				</div>
			</div>
			<div class="widget-body data-tbl">	
				<div class="">
				    <table class="table table-striped table-bordered table-hover data-list">
						<colgroup>
							<col style="width:20px">
							<col style="width:60px">
							<col style="width:200px">
							<col>
							<col style="width:200px">
							<col style="width:200px">
							<col style="width:200px">
						</colgroup>
						<thead>
				        <tr>
							<th></th>
							<th class="col-sort" data-sort="">번호</th>
							<th class="col-sort" data-sort="연락처">연락처</th>
							<th class="col-sort" data-sort="사용자ID">사용자ID</th>
							<th>부서명</th>
							<th class="col-sort" data-sort="이름">사용자이름</th>
							<th class="col-sort" data-sort="접속권한">접속권한</th>
				        </tr>
				        </thead>
			        	<tbody>
				        <c:forEach var="item" items="${dataList}" varStatus="rowStatus">
					    <tr>
							<td><input type="checkbox" value="${item['사용자ID']}"></td>
							<td>${searchVO.firstIndex + rowStatus.count}</td>
							<td>${item['연락처']}</td>
							<td><a href="./write?사용자ID=${item['사용자ID']}">${item['사용자ID']}</a></td>
							<td>${item['부서']}</td>
							<td>${item['이름']}</td>
							<td>${fn:replace(item['접속권한'], 'ROLE_', '')}
							<!-- 
								<c:if test="${item['접속권한']=='ROLE_시스템관리자'}">
									시스템관리자
								</c:if>
								<c:if test="${item['접속권한']=='ROLE_일반관리자'}">
									일반관리자
								</c:if>
								<c:if test="${item['접속권한']=='ROLE_일반사용자'}">
									일반사용자
								</c:if> -->
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
				</div>
			</div><!-- widget-body -->
		</div><!-- widget-box -->

	</div><!-- page-content -->
</div><!-- main-content-inner -->
