<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.card-img {
	height: 170px;
}

.card-img > img {
	position: absolute;
	width: 100%;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#content {
	min-height: calc(100vh - 272px);
}

.emptyList {
	text-align: center;
	margin-top: 50px
}

.newP {
	color: #858a8d;
	font-size: 15px;
}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#pageUnit").val("${searchVO.pageUnit}");
	$("#q").val("${searchVO.q}");
});

</script>
<script src="<c:url value='/resources/js/front/common.js'/>"></script>
<!-- ======== @Region: body ======== -->

<body class="page page-shop header-compact-sticky page-shop-grid navbar-layout-navbar-below" style="font-family: 'Noto Sans KR', sans-serif !important;">
  <!-- ======== @Region: #page-header ======== -->
  <div id="page-header">
    <div class="container clearfix">
      <h3 class="mb-0 float-md-left">
        좋아요 한 강의
      </h3>
      <!-- Page header breadcrumb -->
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
                <input type="text" name="q" class="form-control form-control-sm mr-lg-2" placeholder="JAVA, 라벨링 등">
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
                <select name="pageUnit" id="pageUnit" onchange="changeFirstIndex('pageUnit', this.value)" class="form-control form-control-sm">
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
          <div class="row">
          
          <c:forEach var="item" items="${likeContentsList}" varStatus="rowStatus">
          <div class="col-lg-4">
              <!-- Product 2 -->
              <div class="card mb-4 product-card overlay-hover">
                <!-- Hover content -->
                <div class="overlay-hover-content overlay-op-7">
	                	<c:choose>
			                <c:when test = "${!empty myContentsList}">
				               	<c:set var="in_course" value="false"/>
				               	<%-- <c:set var="last_flag" value="false"/> --%>
					                <c:forEach var="myContent" items="${myContentsList}" varStatus="rowStatus">
				                	<c:if test="${in_course ne true}">
						               <c:choose>
							                <c:when test="${item.seq eq myContent.contentsSeq}">
						                  		<a href="<c:url value='/edu/myEduContent?seq=${item.seq}'/>" class="btn btn-primary btn-block text-uppercase font-weight-bold mb-3 btn-lg">강의 들으러가기</a>
						                  		<c:set var="in_course" value="true"/>
						                  	</c:when>
						                  	<c:when test="${rowStatus.last}">
						                  		<a href="javascript:insertMyCon(${item.seq})" class="btn btn-primary btn-block text-uppercase font-weight-bold mb-3 btn-lg"><i class="fa fa-cart-plus mr-2"></i>수강신청</a>
						                  	</c:when>
					                  	</c:choose> 
			                  		</c:if>
					                </c:forEach>
			                </c:when>
			                <c:otherwise>
			                	<a href="javascript:insertMyCon(${item.seq})" class="btn btn-primary btn-block text-uppercase font-weight-bold mb-3 btn-lg"><i class="fa fa-cart-plus mr-2"></i>수강신청</a>
			                </c:otherwise>
		                </c:choose>
                	<a href="<c:url value='/edu/webEduContent?seq=${item.seq}'/>" class="text-white text-sm">컨텐츠 상세보기</a> 
                	<a href="javascript:delWishList('${item.seq}')" class="text-white text-sm">좋아요 취소하기</a>
                </div>
                
                <div id="${item.seq}-ribbon-div">
					<c:if test = "${not empty myContentsList}">
		                <c:forEach var="myContent" items="${myContentsList}" varStatus="rowStatus">
		                	<c:if test="${item.seq eq myContent.contentsSeq}">
				                 <!-- Ribbon -->
				                <div class="card-ribbon card-ribbon-bottom card-ribbon-right bg-primary text-white">수강중</div>
			                </c:if>
		                </c:forEach>
	                </c:if>
                </div>
                
                <!-- Image & price content -->
                <div class="pos-relative card-img">
                	<c:if test="${item.filePath ne null}">
                  		<img class="card-img-top img-fluid" src="<c:url value='${item.filePath}'/>" style="background-position" alt="Card image cap">
                  	</c:if>
                  	<c:if test="${item.filePath eq null}">
                  		<img class="card-img-top img-fluid" src="<c:url value='/resources/theme/assets/img/backgrounds/computer-screens.jpg' />" alt="Card image cap">
                  	</c:if>
                  <span class="badge badge-primary product-price-badge pos-absolute pos-t pos-r mt-2 mr-2 persist">무료</span>
                </div>
                <!-- Content -->
                <div class="card-body">
                  <h4 class="card-title" style="height: 50px;">
                    ${item.title}
                  </h4>
                  <small class="text-muted">${item.author}</small>
                </div>
              </div>
            </div>
          </c:forEach>
         </div> 
         
         <!-- Pagination -->
          <nav aria-label="Page navigation">
          ${RenderPagination}
          </nav>
          
           <c:if test="${empty likeContentsList}">
         	<div class="emptyList">
         		<h5>좋아요한 강의가 없습니다.</h5>
         		<p class="newP">새로운 강의를 찾아보세요!</p>
         		<a class="courses-list__link-to-courses" href="<c:url value='/edu/webEduContentsList'/>">
   					<button class="btn btn-secondary btn-lg btn-teal">강의 찾기</button>
        		</a>
         	</div>
         </c:if>
        </div>
         
        <!-- Products sidebar -->
        <div class="col-lg-3 order-lg-1">

          <!-- Sections Menu-->
          <ul class="nav nav-section-menu mb-4 py-3">
            <li class="nav-header">안녕하세요. ${sessionId.nickName}님!</li>
            <li><a href="<c:url value='/account/my-courses'/>" class="nav-link" style="font-family: 'Noto Sans KR', sans-serif !important;">내 강의 보기</a></li>
            <li><a href="#" class="nav-link" style="font-family: 'Noto Sans KR', sans-serif !important;">좋아요 한 강의</a></li>
            <li><a href="<c:url value='/account/cart'/>" class="nav-link" style="font-family: 'Noto Sans KR', sans-serif !important;">장바구니</a></li>
            <li><a href="<c:url value='/account/profile'/>" class="nav-link" style="font-family: 'Noto Sans KR', sans-serif !important;">프로필</a></li>
          </ul> 
        </div> <!-- side end -->
      </div>
    </div>
  </div>
</body>

