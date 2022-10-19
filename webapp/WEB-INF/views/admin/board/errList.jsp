<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function() {
	$("#pageUnit").val("${searchVO.pageUnit}");
	$("#qw").val("${searchVO.qw}");
	$("#q").val("${searchVO.q}");
	
});
</script>

<script type="text/javascript">
function goDeleteByIds(ids) {
	_goDeleteByIds("./deleteBoardIds", ids);
}
function delErrIds() {
	var delId = $('.data-list input:checkbox:checked').map(function () {
		return this.value;
	}).get();	
	
	var fileId = new Array();
	for (var i = 1; i < $('table tr').size(); i++) {
		var chk = $('table tr').eq(i).children().find('input[type="checkbox"]').is(':checked');

		if (chk == true) {
			var id = $('table tr').eq(i).children().find('input[type="hidden"]').map(function() {
				fileId.push(this.value);
				//alert("thisvalue : " + this.value);
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
		$.post("<c:url value='/admin/err/delErrIds' />", { "ids": delId, "fileId" : fileId }, null, "json").done(function (result, textStatus, jqXHR) {
			if (result.success) {
				self.location.reload();
			} else {
				alert(result.message);
			}
			
		}).fail(function (jqXHR, textStatus, errorThrown) { alert(jqXHR.status + " : " + textStatus + " : " + errorThrown); });
	}
}
function goListAll() {
    $("#searchForm #q").val("");
    $("#searchForm #qw").val("");
    $("#searchForm").submit();
}
function deleteErr(id){
	if(confirm("해당 메인페이지를 삭제하시겠습니까?")){
		location.href = "<c:url value='/admin/err/delete?id="+id+"'/>";
	}
}
function viewErr(id){
	var url = "<c:url value='/admin/err/View?id="+id+"'/>";
	var winpop = window.open(url, "_view_pop", "resizable=yes,scrollbars=yes,width=800,height=750");
	winpop.focus();
}

</script>

<script type="text/javascript">
$(document).ready(function() {
      
    var xOffset = 200;
    var yOffset = 30;

    $(document).on("mouseover",".preview",function(e){ //마우스 오버시
    	var source = $(this).attr("data-src");
         if(source != "") {
	        $("body").append("<p id='preview'><img src='"+ source +"' width='400px' /></p>"); //보여줄 이미지를 선언                       
	        $("#preview")
	            .css("top",(e.pageY - xOffset) + "px")
	            .css("left",(e.pageX + yOffset) + "px")
	            .fadeIn("fast"); //미리보기 화면 설정 셋팅
         }
    });
     
    $(document).on("mousemove",".preview",function(e){ //마우스 이동시
        $("#preview")
            .css("top",(e.pageY - xOffset) + "px")
            .css("left",(e.pageX + yOffset) + "px");
    });
     
    $(document).on("mouseout",".preview",function(){ //마우스 아웃시
        $("#preview").remove();
    });
      
});
</script>
<style>
/* 미리보기 스타일 셋팅 */
#preview{
    z-index: 9999;
    position:absolute;
    border:0px solid #ccc;
    background:#333;
    padding:1px;
    display:none;
    color:#fff;
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
				<a href="<c:url value='/' />">Home</a>
			</li>
			<li class="active">게시판관리</li>
			<li class="active">정보수정요청</li>
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
								<option value="제목">제목</option>
								<option value="이름">이름</option>
							    <option value="전화번호">전화번호</option>
							    <option value="이메일">이메일</option>
							    <option value="등록일">등록일</option>
							</select>
						</div>
						<div class="col-xs-14">
							<input type="text" name="q" id="q" size="30" placeholder="검색어 입력" class="form-control">
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
			<button type="button" class="btn btn-danger btn-sm" onclick="delErrIds();"><i class="ace-icon fa fa-remove"></i>자료삭제</button>
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
						<option value="10"   ${searchVO["pageUnit"]=="10"?"selected":""} >10</option>
						<option value="20"   ${searchVO["pageUnit"]=="20"?"selected":""} >20</option>
						<option value="50"   ${searchVO["pageUnit"]=="50"?"selected":""} >50</option>
						<option value="100"  ${searchVO["pageUnit"]=="100"?"selected":""} >100</option>
					</select>
				</div>
			</div>
			<div class="widget-body data-tbl">
			    <table class="table table-striped table-bordered table-hover data-list">
					<colgroup>
					<col width="3%">
					<col width="7%">
					<col width="30%">
					<col width="10%">
					<col width="20%">
					<col width="15%">
					<col width="15%">
				</colgroup>
					<thead>
						<tr>
							<td></td>
							<td>번호</td>
							<td class="col-sort" data-sort="title">제목</td>
							<td>파일</td>
							<td class="col-sort" data-sort="name">이름</td>
							<td class="col-sort" data-sort="regdate">등록일</td>
							<td>관리</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${dataList}" varStatus="rowStatus">
							<tr>
					        	<td><input type="checkbox" name="check" value="${item['일련번호']}"></td>
					        	<td>${item['일련번호']}</td>
					        	<td>${item['제목']}</td>
					        	<td>
					        		<c:choose>
						        		<c:when test="${item['파일명'] ne null and item['파일명'] ne ''}">
											<img class="preview" width="25px;" alt="" data-src="<c:url value='/data/uploads/upload/requestUpdate/${item[\'파일명\']}'/>" src="<c:url value='/resources/images/sub/picture_frame.png'/>">
						        		</c:when>
						        		<c:otherwise>
						        			첨부파일 없음
						        		</c:otherwise>
					        		</c:choose>
					        	</td>
					        	<td>${item['이름']}</td>
					        	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item['등록일']}" /></td>
					        	<td>
					        		<button onclick="viewErr(${item['일련번호']})">보기</button>
					        		<button onclick="deleteErr(${item['일련번호']})">삭제</button>
					        	</td>
				        	</tr>
						</c:forEach>
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

<%-- <link href="<c:url value='/resources/yoons/all.min.css'/>" rel="stylesheet"> --%>