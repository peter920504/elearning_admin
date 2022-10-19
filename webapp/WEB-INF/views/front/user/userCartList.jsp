<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
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
<!-- ======== @Region: body ======== -->

<body class="page page-shop header-compact-sticky page-shop-grid navbar-layout-navbar-below" style="font-family: 'Noto Sans KR', sans-serif !important;">

<!-- ======== @Region: #page-header ======== -->
  <div id="page-header">
    <div class="container clearfix">
      <h3 class="mb-0 float-md-left">
        	수강바구니
      </h3>
      <!-- Page header breadcrumb -->
    </div>
  </div>

  <!-- ======== @Region: #content ======== -->
  <div id="content" class="py-6">
    <div class="container">
      <!-- Shopping cart -->
      <div class="cart-content">
      <c:choose>
      <c:when test="${empty cartContentsList}">
      	<div class="emptyList">
         	<h5>담긴 강의가 없습니다.</h5>
         	<p class="newP">새로운 강의를 찾아보세요!</p>
         	<a class="courses-list__link-to-courses" href="<c:url value='/edu/webEduContentsList'/>">
   				<button class="btn btn-secondary btn-lg btn-teal">강의 찾기</button>
        	</a>
         </div>
      </c:when>
      <c:otherwise>
        <!--Shopping cart items-->
        <table class="table table-responsive mb-0 cart-table">
          <thead>
            <tr>
              <th class="w-5"></th> <!-- 체크박스 넣기 -->
              <th class="w-15"></th> <!-- 이미지 -->
              <th class="w-20">강의</th>
              <th class="w-5"></th>
              <th class="w-35"></th>
              <th class="w-5 text-md-right"></th>
            </tr>
          </thead>
          <tbody>
          <c:forEach var="item" items="${cartContentsList}" varStatus="rowStatus">
            <!-- Cart item 1 -->
            <tr>
              <td class="text-center align-middle">
              	<input type="checkbox" value="">
              </td>
              <td class="text-center">
                <a href="#">
                <c:if test="${item.filePath ne null}">
                	<a href="<c:url value='/edu/webEduContent?seq=${item.seq}'/>">
                  		<img class="cart-img img-fluid" src="<c:url value='${item.filePath}'/>" alt="Product">
                	</a>
                </c:if>
                <c:if test="${item.filePath eq null}">
                	<a href="<c:url value='/edu/webEduContent?seq=${item.seq}'/>">
                		<img class="cart-img img-fluid" src="<c:url value='/resources/theme/assets/img/backgrounds/computer-screens.jpg'/>" alt="Product">
                	</a>
                </c:if>
              </td>
              <td> <span class="font-weight-bold">${item.title}</span> </td>
              <td class="text-center align-middle">
                <a href="#" class="close cart-remove"> <i class="fa fa-times"></i> </a>
              </td>
               <td>
                <div class="input-group input-group-quantity" data-toggle="quantity">
                  <span class="input-group-prepend">
<!--                     <input type="button" value="-" class="btn btn-secondary quantity-down" field="quantity" /> -->
                  </span>
<!--                   <input type="text" name="quantity" value="2" class="quantity form-control" /> -->
                  <span class="input-group-append">
<!--                     <input type="button" value="+" class="btn btn-secondary quantity-up" field="quantity" /> -->
                  </span>
                </div>
              </td>
              <td> <span class="text-center font-weight-bold">${item.serviceType}</span> </td>
<!--               <td> -->
<!--                 <div class="input-group input-group-quantity" data-toggle="quantity"> -->
                	   
<!--                   <span class="input-group-prepend"> -->
<!--                     <input type="button" value="-" class="btn btn-secondary quantity-down" field="quantity" /> -->
<!--                   </span> -->
<!--                   <input type="text" name="quantity" value="2" class="quantity form-control" /> -->
<!--                   <span class="input-group-append"> -->
<!--                     <input type="button" value="+" class="btn btn-secondary quantity-up" field="quantity" /> -->
<!--                   </span> -->
<!--                 </div> -->
<!--               </td> -->
<!--               <td class="text-md-right"><span class="font-weight-bold">무료</span></td> -->
            </tr>
            </c:forEach>
<!--               <td> -->
<!--                 <div class="input-group input-group-quantity" data-toggle="quantity"> -->
                	   
<!--                   <span class="input-group-prepend"> -->
<!--                     <input type="button" value="-" class="btn btn-secondary quantity-down" field="quantity" /> -->
<!--                   </span> -->
<!--                   <input type="text" name="quantity" value="2" class="quantity form-control" /> -->
<!--                   <span class="input-group-append"> -->
<!--                     <input type="button" value="+" class="btn btn-secondary quantity-up" field="quantity" /> -->
<!--                   </span> -->
<!--                 </div> -->
<!--               </td> -->
<!--               <td class="text-md-right"><span class="font-weight-bold">무료</span></td> -->
          </tbody>
        </table>
        </c:otherwise>
        </c:choose>
        <!--End of Shopping cart items-->
        <hr class="my-4 hr-lg" />
        <div class="cart-content-footer">
          <div class="row">
            <div class="col-md-4">
<!--               <h6 class="text-muted mb-3"> -->
<!--                 All prices are including VAT -->
<!--               </h6> -->
              <!-- Discount form -->
<!--               <form action="#" role="form"> -->
<!--                 <div class="input-group"> -->
<!--                   <label class="sr-only" for="discount">Discount code</label> -->
<!--                   <input type="tel" class="form-control" id="discount" placeholder="Discount code"> -->
<!--                   <span class="input-group-append"> -->
<!--                     <button class="btn btn-dark" type="button">Go</button> -->
<!--                   </span> -->
<!--                 </div> -->
<!--               </form> -->
            </div>
            <div class="col-md-8 text-md-right mt-3 mt-md-0">
              <div class="cart-content-totals">
                <h4 class="font-weight-light">
                  선택상품 금액: 0원
                </h4>
                <h4 class="font-weight-light">
                                         할인금액 (0%): <span class="text-danger">0</span>
                </h4>
                <hr class="my-3 w-50 ml-0 ml-md-auto mr-md-0" />
                <h3>
                                         총 결제금액: <span class="text-primary">0원</span>
                </h3>
                <hr class="my-3 w-50 ml-0 ml-md-auto mr-md-0" />
              </div>
              <!-- Proceed to checkout -->
              <a href="<c:url value='/edu/webEduContentsList'/>" class="btn btn-outline-primary btn-rounded btn-lg">강의목록으로</a> <a href="shop-checkout.html" class="btn btn-primary btn-rounded btn-lg">결제하기</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

