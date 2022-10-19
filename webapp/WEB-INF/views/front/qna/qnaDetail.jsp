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
             <h4><a href="<c:url value="./webQnaList"/>"><i class="fas fa-angle-left"></i>  1:1 문의 </a></h4>
            </div>
            <div class="col-lg-6">
            </div>
            <div class="col-lg-12 collapse" id="adv-search">
              <!-- Advanced search form -->
              <form class="mt-3 bg-light p-3 rounded mb-4 text-sm">
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <label>Category</label>
                    <select class="form-control">
                      <option value="#">Mens</option>
                      <option value="#">Womens</option>
                      <option value="#">Childrens</option>
                      <option value="#">Baby</option>
                    </select>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label>Brand</label>
                    <select class="form-control">
                      <option value="#">Brand 1</option>
                      <option value="#">Brand 2</option>
                      <option value="#">Brand 3</option>
                      <option value="#">Brand 4</option>
                    </select>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label>Price</label>
                    <div class="row">
                      <div class="input-group col-md-6">
                        <span class="input-group-prepend">$</span>
                        <input type="text" class="form-control" placeholder="from">
                      </div>
                      <div class="input-group col-md-6">
                        <span class="input-group-prepend">$</span>
                        <input type="text" class="form-control" placeholder="to">
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label>Size</label>
                    <select class="form-control">
                      <option value="#">Small</option>
                      <option value="#">Medium</option>
                      <option value="#">Large</option>
                      <option value="#">Extra Large</option>
                    </select>
                  </div>
                  <div class="col-md-12">
                    <button type="submit" class="btn btn-primary"> <i class="fa fa-search"></i> Search </button>
                  </div>
                </div>
              </form>
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
							<h4>${question.title }</h4>
							<div>${question.writerName }  <span class="comment-wdate">${question.wDate }</span></div>
						</td>
					</tr>
					<c:if test="${question.fileName ne null}">
					<tr>
						<td colspan="2">
							<div><i class="fas fa-folder-open"></i></div>
							<div>${question.fileName }</div>
						</td>
					</tr>
					</c:if>
					<tr>
						<td colspan="2">
							<div>${question.contents }</div>  
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:right;">
							<button type="button" class="mb-2 btn btn-outline-teal" onclick="location.href='<c:url value="./webQnaList"/>'">List</button>
						</td>
					</tr>
					<!-- 현재 질문에 대한 답변이 있는 경우 표시 -->
					<c:if test="${replay ne null and question.depth eq '0'}">
					<tr>
						<td align="center">
							<span class=""><i class="fas fa-level-up-alt fa-rotate-90 "></i>&nbsp;&nbsp; 답변</span>
						</td>
						<td><a href="<c:url value="./webQnaDetail?seq=${replay.seq}"/>">${replay.title }</a></td>
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