<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body class="page page-shop header-compact-sticky page-shop-grid navbar-layout-navbar-below" style="font-family: 'Noto Sans KR', sans-serif !important;">

<style>
	.col-lg-6 h4{
		margin-bottom: 20px;
	}
	.row-table{
	 	padding: 0px 15px 0px 15px;
	}
	.table tbody tr:nth-child(1) td h4 {
		margin : 10px 0px 15px 0px;
	}
	.table tbody tr:nth-child(2) td div {
		float: left;
		margin-right : 10px;
	}
	.table tbody tr:nth-child(3) td {
		padding-top: 25px;
	}
	.table tbody tr:nth-child(5) td div{
		float: left;
	}
	.comment-wdate{
		margin-left : 17px;
		color : gray;
	}
</style>
<script>
	function fileDownload(){
		/* $.ajax({
	        method:"GET",
	        url : "./fileDownload?fileName=${notice.originFileName}",
	        success : function(data) {
				console.log("성공!");
	            //window.location =`fileDownLoad.do?FileName=${encFileName}`;
	        },
	        error:function(request,status){
	            alert("오류가 발생했습니다.");
	        }
	    }); */
		location.href = "./fileDownload?fileName=${notice.originFileName}";
	}
</script>

	 <!-- ======== @Region: #page-header ======== -->
  <div id="page-header">
    <div class="container clearfix">
      <h3 class="mb-0 float-md-left">
      	 커뮤니티
      </h3>
      <!-- Page header breadcrumb -->
      <nav class="breadcrumb float-md-right"> <a class="breadcrumb-item" href="<c:url value='/'/>">Home</a> <a class="breadcrumb-item" href="<c:url value='/notice/webNoticeList'/>">커뮤니티</a> </nav>
    </div>
  </div>
  
    <!-- ======== @Region: #content ======== -->
  <div id="content" class="py-3 py-lg-6">
    <div class="container">
      <div class="row">
        <!-- Products grid -->
        <div class="col-lg-9 order-lg-2">
          <!-- Products filters -->
          <div class="row">
            <div class="col-lg-6 mb-3 mb-lg-0">
             <h4><a href="<c:url value="./webNoticeList"/>"><i class="fas fa-angle-left"></i>  공지사항</a></h4>
            </div>
          </div>
          <div class="row row-table">
	          <table class="table mb-0">
	          <colgroup>
					<col style="width:20%">
					<col style="width:80%">
				</colgroup>
				<tbody>
					<tr>
						<td colspan="2">
							<h4>${notice.title }</h4>
							<div>${notice.managerName }  <span class="comment-wdate">${notice.regDate }</span>
								<div style="float:right">조회수 : ${notice.viewCount }</div>
							</div>
						</td>
					</tr>
					<c:if test="${notice.originFileName ne null}">
					<tr>
						<td colspan="2">
							<a href="#" onclick="fileDownload()" style="color: inherit">
								<i class="fas fa-folder-open"></i>
								${notice.originFileName }
							</a>
						</td>
					</tr>
					</c:if>
					<tr>
						<td colspan="2">
							<%-- <div>${notice.contents }</div> --%>
							서비스를 이용해 주시는 이용자 여러분께 감사드리며, 새로운 개인정보처리방침 적용에 관한 안내 말씀 드립니다. <br>
							새롭게 변경될 개인정보처리방침 내용을 확인하시고 서비스 이용에 참고하시기 바랍니다.<br><br>
							
							1. 변경 전 후 보기<br><br>
							
							    &nbsp;&nbsp;(1) 변경 전 개인정보처리방침 (보기)<br>
							
							    &nbsp;&nbsp;(2) 변경 후 개인정보처리방침 (보기)<br><br>
							
							2. 시행일 : 2022년 1월 24일 
							
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:right;">
							<button type="button" class="mb-2 btn btn-outline-teal" onclick="location.href='<c:url value="./webNoticeList"/>'">List</button>
						</td>
					</tr>
					<c:if test="${notice.preTitle != null or notice.preNo ne 0}">
					<tr>
						<td>
								<i class="fas fa-angle-up"></i>&nbsp;&nbsp;prev
						</td>
						<td><a href="<c:url value="./webNoticeDetail?seq=${notice.seq-1}"/>">${notice.preTitle }</a></td>
					</tr>
					</c:if>
					<c:if test="${notice.nextTitle != null or notice.nextNo != 0}">
					<tr>
						<td>
								<i class="fas fa-angle-down"></i>&nbsp;&nbsp;next
						</td>
						<td><a href="<c:url value="./webNoticeDetail?seq=${notice.seq+1}"/>">${notice.nextTitle }</a></td>
					</tr>
					</c:if>
				</tbody>
			</table>
         </div> 
          
          <!-- Pagination -->
          <nav aria-label="Page navigation">
          	${RenderPagination}
          </nav>
        </div>
        
         
        <!-- Products sidebar -->
        <div class="col-lg-3 order-lg-1">

          <!-- Sections Menu-->
          <ul class="nav nav-section-menu mb-4 py-3">
            <li class="nav-header">COMMUNITY</li>
            <li><a href="<c:url value='/notice/webNoticeList'/>" class="nav-link text-slab" style="font-family: 'Noto Sans KR', sans-serif !important;">공지사항</a></li>
            <li><a href="<c:url value='/qna/webQnaList'/>" class="nav-link text-slab" style="font-family: 'Noto Sans KR', sans-serif !important;">1:1 문의</a></li>
            <li><a href="<c:url value='/faq/webFaqList'/>" class="nav-link text-slab" style="font-family: 'Noto Sans KR', sans-serif !important;">FAQ</a></li>
        </div> 
        <!-- side end -->
      </div>
    </div>
  </div>
</body>