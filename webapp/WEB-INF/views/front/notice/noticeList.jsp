<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body class="page page-shop header-compact-sticky page-shop-grid navbar-layout-navbar-below" style="font-family: 'Noto Sans KR', sans-serif !important;">
<style>
	th, td{
		vertical-align: middle;
		text-align: center;
	}
	.row-table{
	 	padding: 0px 15px 0px 15px;
	}
	.badge-margin{
		margin : 0px;
		padding: 6px 20px;
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
              <form class="form-inline justify-content-lg-start text-sm">
                <label class="control-label mr-2">Search:</label>
                <input type="text" name="q" class="form-control form-control-sm mr-lg-2" placeholder="">
                <!-- <a href="#adv-search" data-toggle="collapse" class="text-sm">advanced search</a> -->
              </form>
            </div>
            <div class="col-lg-6">
              <form class="form-inline justify-content-lg-end text-sm">
                <label class="control-label mr-2">Sort By:</label>
                <select name="sortField" class="form-control form-control-sm">
                  <option value="seq">전체</option>
                  <option value="title">이름순</option>
                  <option value="difficulty">난이도</option>
                </select>
                <label class="control-label mr-2 ml-lg-3">Show:</label>
                <select name="pageUnit" id="pageUnit" onchange="changeFirstIndex('pageUnit', this.value);" class="form-control form-control-sm">
                  <option value="15">15</option>
                  <option value="30">30</option>
                  <option value="45">45</option>
                  <option value="60">60</option>
                </select>
              </form>
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
          <hr class="my-4" />
          <div class="row row-table">
	          <table class="table mb-0">
				<colgroup>
					<col style="width:8%">
					<col style="width:45%">
					<col style="width:14%">
					<col style="width:14%">
					<col style="width:10%">
				</colgroup>
				
				<tbody>
					<tr>
						<th>공지</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="item" items="${noticeList }" varStatus="rowStatus" >
					<tr>
						<c:choose>
							<c:when test="${item.topYN == 1 }">
								<td>
								<span class="badge badge-primary badge-margin"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><b>${searchVO.firstIndex + rowStatus.count}</b></font></font></span>
							</c:when>
							<c:otherwise><td><span class="text-gray">${searchVO.firstIndex + rowStatus.count}</span></td></c:otherwise>
						</c:choose>
							<td style="text-align: left"><a href="<c:url value="./webNoticeDetail?seq=${item.seq}"/>">${item.title }</a></td>
							<td>${item.managerName }</td>
							<td>${item.regDate }</td>
							<td>${item.viewCount }</td>
					</tr>
					</c:forEach>
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
