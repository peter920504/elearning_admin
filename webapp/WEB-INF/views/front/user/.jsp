<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ======== @Region: body ======== -->

<body class="page page-shop header-compact-sticky page-shop-grid navbar-layout-navbar-below" style="font-family: 'Noto Sans KR', sans-serif !important;">


  <!-- ======== @Region: #page-header ======== -->
  <div id="page-header">
    <div class="container clearfix">
      <h3 class="mb-0 float-md-left">
        교육컨텐츠 목록
      </h3>
      <!-- Page header breadcrumb -->
      <nav class="breadcrumb float-md-right"> <a class="breadcrumb-item" href="index.html">Home</a> <a class="breadcrumb-item" href="shop.html">교육컨텐츠목록</a> </nav>
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
                <label class="control-label mr-2">Keyword:</label>
                <input type="text" class="form-control form-control-sm mr-lg-2" placeholder="ie. Calvin Klein">
                <a href="#adv-search" data-toggle="collapse" class="text-sm">advanced search</a>
              </form>
            </div>
            <div class="col-lg-6">
              <form class="form-inline justify-content-lg-end text-sm">
                <label class="control-label mr-2">Sort By:</label>
                <select class="form-control form-control-sm">
                  <option value="#">Name (A - Z)</option>
                  <option value="#">Name (Z - A)</option>
                  <option value="#">Price (Low &gt; High)</option>
                  <option value="#" selected="">Price (High &gt; Low)</option>
                  <option value="#">Rating (Highest)</option>
                  <option value="#">Rating (Lowest)</option>
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
          
          <c:forEach var="item" items="${eduContentsList}" varStatus="rowStatus">
          <div class="col-lg-4">
              <!-- Product 2 -->
              <div class="card mb-4 product-card overlay-hover">
                <!-- Hover content -->
                <div class="overlay-hover-content overlay-op-7">
                  <a href="shop-cart.html" class="btn btn-primary btn-block text-uppercase font-weight-bold mb-3 btn-lg"><i class="fa fa-cart-plus mr-2"></i>수강신청</a>
                  <a href="shop-product.html" class="text-white text-sm">컨텐츠 상세보기</a> <a href="#" class="text-white text-sm">Add to Wishlist</a>
                </div>
                <!-- Image & price content -->
                <div class="pos-relative">
                  <img class="card-img-top img-fluid" src="<c:url value='/resources/theme/assets/img/backgrounds/computer-screens.jpg' />" alt="Card image cap">
                  <span class="badge badge-primary product-price-badge pos-absolute pos-t pos-r mt-2 mr-2 persist">무료</span>
                </div>
                <!-- Content -->
                <div class="card-body">
                  <h4 class="card-title">
                    ${item.title}
                  </h4>
                  <small class="text-muted">${item.author}</small>
                </div>
              </div>
            </div>
          </c:forEach>
          
         </div> 
          
          <%-- 
            <div class="col-lg-4">
              <!-- Product 2 -->
              <div class="card mb-4 product-card overlay-hover">
                <!-- Hover content -->
                <div class="overlay-hover-content overlay-op-7">
                  <a href="shop-cart.html" class="btn btn-primary btn-block text-uppercase font-weight-bold mb-3 btn-lg"><i class="fa fa-cart-plus mr-2"></i>수강신청</a>
                  <a href="shop-product.html" class="text-white text-sm">컨텐츠 상세보기</a> <a href="#" class="text-white text-sm">Add to Wishlist</a>
                </div>
                <!-- Image & price content -->
                <div class="pos-relative">
                  <img class="card-img-top img-fluid" src="<c:url value='/resources/theme/assets/img/backgrounds/ysvazfxdz_8-alvaro-serrano.jpg' />" alt="Card image cap">
                  <span class="badge badge-primary product-price-badge pos-absolute pos-t pos-r mt-2 mr-2 persist">무료</span>
                </div>
                <!-- Content -->
                <div class="card-body">
                  <h4 class="card-title">
                    JAVA 입문
                  </h4>
                  <small class="text-muted">홍길동</small>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <!-- Product 3 -->
              <div class="card mb-4 product-card overlay-hover">
                <!-- Hover content -->
                <div class="overlay-hover-content overlay-op-7">
                  <a href="shop-cart.html" class="btn btn-primary btn-block text-uppercase font-weight-bold mb-3 btn-lg"><i class="fa fa-video mr-2"></i>강의 들으러가기</a>
                  <a href="shop-product.html" class="text-white text-sm">컨텐츠 상세보기</a> <a href="#" class="text-white text-sm">Add to Wishlist</a>
                </div>
                 <!-- Ribbon -->
                <div class="card-ribbon card-ribbon-bottom card-ribbon-right bg-primary text-white">수강중</div>
                <!-- Image & price content -->
                <div class="pos-relative">
                  <img class="card-img-top img-fluid" src="<c:url value='/resources/theme/assets/img/backgrounds/computer-screens.jpg' />" alt="Card image cap">
                  <span class="badge badge-primary product-price-badge pos-absolute pos-t pos-r mt-2 mr-2 persist">무료</span>
                </div>
                <!-- Content -->
                <div class="card-body">
                  <h4 class="card-title">
                    라벨링 기초
                  </h4>
                  <small class="text-muted">이순신</small>
                </div>
              </div>
            </div>
            
            --%>
            
            <%-- 
            <div class="col-lg-4">
              <!-- Product 4 -->
              <div class="card mb-4 product-card overlay-hover">
                <!-- Hover content -->
                <div class="overlay-hover-content overlay-op-7">
                  <a href="shop-cart.html" class="btn btn-primary btn-block text-uppercase font-weight-bold mb-3 btn-lg"><i class="fa fa-cart-plus mr-2"></i> Add to Cart</a>
                  <a href="shop-product.html" class="text-white text-sm">View Product Details</a> <a href="#" class="text-white text-sm">Add to Wishlist</a>
                </div>
                <!-- Image & price content -->
                <div class="pos-relative">
                  <img class="card-img-top img-fluid" src="assets/img/shop/promo-kids.jpg" alt="Card image cap">
                  <span class="badge badge-primary product-price-badge pos-absolute pos-t pos-r mt-2 mr-2 persist">
                    <del class="op-5">$24.99</del>
                    / $19.99
                  </span>
                </div>
                <!-- Content -->
                <div class="card-body">
                  <small class="text-muted text-uppercase"><span class="text-primary">Kids</span> / Jumpers</small>
                  <h4 class="card-title">
                    Kids Wolly Jumper
                  </h4>
                  <p class="card-text"> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> </p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">12 in stock</small>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <!-- Product 5 -->
              <div class="card mb-4 product-card overlay-hover card-outline-danger">
                <!-- Hover content -->
                <div class="overlay-hover-content overlay-op-7">
                  <a href="shop-cart.html" class="btn btn-primary btn-block text-uppercase font-weight-bold mb-3 btn-lg"><i class="fa fa-cart-plus mr-2"></i> Add to Cart</a>
                  <a href="shop-product.html" class="text-white text-sm">View Product Details</a> <a href="#" class="text-white text-sm">Add to Wishlist</a>
                </div>
                <!-- Ribbon -->
                <div class="card-ribbon card-ribbon-bottom card-ribbon-right bg-danger text-white">Low Stock</div>
                <!-- Image & price content -->
                <div class="pos-relative">
                  <img class="card-img-top img-fluid" src="assets/img/shop/promo-kids-hoodies.jpg" alt="Card image cap">
                  <span class="badge badge-primary product-price-badge pos-absolute pos-t pos-r mt-2 mr-2 persist">$19.99</span>
                </div>
                <!-- Content -->
                <div class="card-body">
                  <small class="text-muted text-uppercase"><span class="text-primary">Kids</span> / Jumpers</small>
                  <h4 class="card-title">
                    Kids Hoodies
                  </h4>
                  <p class="card-text"> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star-o text-primary"></i> </p>
                </div>
                <div class="card-footer">
                  <small class="text-muted"><span class="text-danger">2 in stock</span></small>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <!-- Product 6 -->
              <div class="card mb-4 product-card overlay-hover">
                <!-- Hover content -->
                <div class="overlay-hover-content overlay-op-7">
                  <a href="shop-cart.html" class="btn btn-primary btn-block text-uppercase font-weight-bold mb-3 btn-lg"><i class="fa fa-cart-plus mr-2"></i> Add to Cart</a>
                  <a href="shop-product.html" class="text-white text-sm">View Product Details</a> <a href="#" class="text-white text-sm">Add to Wishlist</a>
                </div>
                <!-- Image & price content -->
                <div class="pos-relative">
                  <img class="card-img-top img-fluid" src="assets/img/shop/mens-sports.jpg" alt="Card image cap">
                  <span class="badge badge-primary product-price-badge pos-absolute pos-t pos-r mt-2 mr-2 persist">$49.99</span>
                </div>
                <!-- Content -->
                <div class="card-body">
                  <small class="text-muted text-uppercase"><span class="text-primary">Mens</span> / Sports</small>
                  <h4 class="card-title">
                    Nike Training Top
                  </h4>
                  <p class="card-text"> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star-o text-primary"></i> <i class="fa fa-star-o text-primary"></i> <i class="fa fa-star-o text-primary"></i> </p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">12988 in stock</small>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <!-- Product 7 -->
              <div class="card mb-4 product-card overlay-hover card-outline-primary">
                <!-- Hover content -->
                <div class="overlay-hover-content overlay-op-7">
                  <a href="shop-cart.html" class="btn btn-primary btn-block text-uppercase font-weight-bold mb-3 btn-lg"><i class="fa fa-cart-plus mr-2"></i> Add to Cart</a>
                  <a href="shop-product.html" class="text-white text-sm">View Product Details</a> <a href="#" class="text-white text-sm">Add to Wishlist</a>
                </div>
                <!-- Ribbon -->
                <div class="card-ribbon card-ribbon-bottom card-ribbon-right bg-primary text-white">Top Rated</div>
                <!-- Image & price content -->
                <div class="pos-relative">
                  <img class="card-img-top img-fluid" src="assets/img/shop/promo-mens-2.jpg" alt="Card image cap">
                  <span class="badge badge-primary product-price-badge pos-absolute pos-t pos-r mt-2 mr-2 persist">$149.99</span>
                </div>
                <!-- Content -->
                <div class="card-body">
                  <small class="text-muted text-uppercase"><span class="text-primary">Mens</span> / Jackets</small>
                  <h4 class="card-title">
                    Leather Jacket
                  </h4>
                  <p class="card-text"> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> </p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">12769 in stock</small>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <!-- Product 8 -->
              <div class="card mb-4 product-card overlay-hover">
                <!-- Hover content -->
                <div class="overlay-hover-content overlay-op-7">
                  <a href="shop-cart.html" class="btn btn-primary btn-block text-uppercase font-weight-bold mb-3 btn-lg"><i class="fa fa-cart-plus mr-2"></i> Add to Cart</a>
                  <a href="shop-product.html" class="text-white text-sm">View Product Details</a> <a href="#" class="text-white text-sm">Add to Wishlist</a>
                </div>
                <!-- Image & price content -->
                <div class="pos-relative">
                  <img class="card-img-top img-fluid" src="assets/img/shop/promo-womens-sports.jpg" alt="Card image cap">
                  <span class="badge badge-primary product-price-badge pos-absolute pos-t pos-r mt-2 mr-2 persist">$29.99</span>
                </div>
                <!-- Content -->
                <div class="card-body">
                  <small class="text-muted text-uppercase"><span class="text-primary">Womens</span> / Sports</small>
                  <h4 class="card-title">
                    Shoes
                  </h4>
                  <p class="card-text"> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star-o text-primary"></i> <i class="fa fa-star-o text-primary"></i> </p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">129 in stock</small>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <!-- Product 9 -->
              <div class="card mb-4 product-card overlay-hover">
                <!-- Hover content -->
                <div class="overlay-hover-content overlay-op-7">
                  <a href="shop-cart.html" class="btn btn-primary btn-block text-uppercase font-weight-bold mb-3 btn-lg"><i class="fa fa-cart-plus mr-2"></i> Add to Cart</a>
                  <a href="shop-product.html" class="text-white text-sm">View Product Details</a> <a href="#" class="text-white text-sm">Add to Wishlist</a>
                </div>
                <!-- Image & price content -->
                <div class="pos-relative">
                  <img class="card-img-top img-fluid" src="assets/img/shop/promo-womens-top.jpg" alt="Card image cap">
                  <span class="badge badge-primary product-price-badge pos-absolute pos-t pos-r mt-2 mr-2 persist">$49.99</span>
                </div>
                <!-- Content -->
                <div class="card-body">
                  <small class="text-muted text-uppercase"><span class="text-primary">Womens</span> / Tops</small>
                  <h4 class="card-title">
                    Summer Top
                  </h4>
                  <p class="card-text"> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star-o text-primary"></i> </p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">129543 in stock</small>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <!-- Product 10 -->
              <div class="card mb-4 product-card overlay-hover">
                <!-- Hover content -->
                <div class="overlay-hover-content overlay-op-7">
                  <a href="shop-cart.html" class="btn btn-primary btn-block text-uppercase font-weight-bold mb-3 btn-lg"><i class="fa fa-cart-plus mr-2"></i> Add to Cart</a>
                  <a href="shop-product.html" class="text-white text-sm">View Product Details</a> <a href="#" class="text-white text-sm">Add to Wishlist</a>
                </div>
                <!-- Image & price content -->
                <div class="pos-relative">
                  <img class="card-img-top img-fluid" src="assets/img/shop/promo-mens-shoes.jpg" alt="Card image cap">
                  <span class="badge badge-primary product-price-badge pos-absolute pos-t pos-r mt-2 mr-2 persist">$49.99</span>
                </div>
                <!-- Content -->
                <div class="card-body">
                  <small class="text-muted text-uppercase"><span class="text-primary">Mens</span> / Shoes</small>
                  <h4 class="card-title">
                    Addidas Trainers
                  </h4>
                  <p class="card-text"> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star-o text-primary"></i> <i class="fa fa-star-o text-primary"></i> <i class="fa fa-star-o text-primary"></i> </p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">129 in stock</small>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <!-- Product 11 -->
              <div class="card mb-4 product-card overlay-hover">
                <!-- Hover content -->
                <div class="overlay-hover-content overlay-op-7">
                  <p>
                    New delivery expected:
                    <br />
                    <strong>Jan 29th</strong>
                  </p>
                </div>
                <!-- Ribbon -->
                <div class="card-ribbon card-ribbon-bottom card-ribbon-right bg-danger text-white">Sold out</div>
                <!-- Image & price content -->
                <div class="pos-relative op-3">
                  <img class="card-img-top img-fluid" src="assets/img/shop/promo-mens-watches.jpg" alt="Card image cap">
                  <span class="badge badge-primary product-price-badge pos-absolute pos-t pos-r mt-2 mr-2 persist">$499.99</span>
                </div>
                <!-- Content -->
                <div class="card-body op-3">
                  <small class="text-muted text-uppercase"><span class="text-primary">Mens</span> / Watches</small>
                  <h4 class="card-title">
                    Watch
                  </h4>
                  <p class="card-text"> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star-o text-primary"></i> </p>
                </div>
                <div class="card-footer">
                  <small class="text-muted"><span class="text-danger font-weight-bold">Sold Out</span></small>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <!-- Product 12 -->
              <div class="card mb-4 product-card overlay-hover">
                <!-- Hover content -->
                <div class="overlay-hover-content overlay-op-7">
                  <a href="shop-cart.html" class="btn btn-primary btn-block text-uppercase font-weight-bold mb-3 btn-lg"><i class="fa fa-cart-plus mr-2"></i> Add to Cart</a>
                  <a href="shop-product.html" class="text-white text-sm">View Product Details</a> <a href="#" class="text-white text-sm">Add to Wishlist</a>
                </div>
                <!-- Image & price content -->
                <div class="pos-relative">
                  <img class="card-img-top img-fluid" src="assets/img/shop/promo-mens-shirts.jpg" alt="Card image cap">
                  <span class="badge badge-primary product-price-badge pos-absolute pos-t pos-r mt-2 mr-2 persist">$49.99</span>
                </div>
                <!-- Content -->
                <div class="card-body">
                  <small class="text-muted text-uppercase"><span class="text-primary">Mens</span> / Shirts</small>
                  <h4 class="card-title">
                    Shirts
                  </h4>
                  <p class="card-text"> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star-o text-primary"></i> <i class="fa fa-star-o text-primary"></i> </p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">12779 in stock</small>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <!-- Product 13 -->
              <div class="card mb-4 product-card overlay-hover">
                <!-- Hover content -->
                <div class="overlay-hover-content overlay-op-7">
                  <a href="shop-cart.html" class="btn btn-primary btn-block text-uppercase font-weight-bold mb-3 btn-lg"><i class="fa fa-cart-plus mr-2"></i> Add to Cart</a>
                  <a href="shop-product.html" class="text-white text-sm">View Product Details</a> <a href="#" class="text-white text-sm">Add to Wishlist</a>
                </div>
                <!-- Image & price content -->
                <div class="pos-relative">
                  <img class="card-img-top img-fluid" src="assets/img/shop/promo-womens-hat.jpg" alt="Card image cap">
                  <span class="badge badge-primary product-price-badge pos-absolute pos-t pos-r mt-2 mr-2 persist">$49.99</span>
                </div>
                <!-- Content -->
                <div class="card-body">
                  <small class="text-muted text-uppercase"><span class="text-primary">Womens</span> / Extras</small>
                  <h4 class="card-title">
                    Hat
                  </h4>
                  <p class="card-text"> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star text-primary"></i> <i class="fa fa-star-o text-primary"></i> </p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">129 in stock</small>
                </div>
              </div>
            </div>
          </div>
		 --%>
           
           <%-- 
          <!-- Pagination -->
          <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span> </a>
              </li>
              <li class="page-item active"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span> </a>
              </li>
            </ul>
          </nav>
          --%>
          ${RenderPagination}
        </div>
        
        <%--
        <!-- Products sidebar -->
        <jsp:include page="contents_sideNav.jsp" />
         --%>
         
        <!-- Products sidebar -->
        <div class="col-lg-3 order-lg-1">

          <!-- Sections Menu-->
          <ul class="nav nav-section-menu mb-4 py-3"">
            <li class="nav-header">EduContents</li>
            <li><a href="#" class="nav-link text-slab" style="font-family: 'Noto Sans KR', sans-serif !important;">전체</a></li>
            <c:forEach var="item" items="${headerCate}" varStatus="rowStatus">
            	<c:if test="${item.level eq 1}">
		            <li>
		            	<a href="#${item.title}" data-toggle="collapse" class="nav-link text-slab" style="font-family: 'Noto Sans KR', sans-serif !important; "> ${item.title} <i class="fa fa-angle-right"></i> </a>
		            	  <ul class="nav nav-section-menu collapse" id="${item.title}" >
		            	  	<c:forEach var="cateLv2" items="${headerCate}" varStatus="rowStatus">
			            	  	<c:if test="${cateLv2.level eq 2 && cateLv2.pSeq eq item.seq}">
				                	<li style="font-family: 'Noto Sans KR', sans-serif !important;">
				                		<a href="#" class="nav-link">${cateLv2.title}</a>
				                	</li>
				                </c:if>
				            </c:forEach>
			              </ul>
		            </li>
	            </c:if>
            </c:forEach>
            <!-- 
            <li>
              <a href="#mens" data-toggle="collapse" class="nav-link text-uppercase text-slab first active">
                Mens
                <small class="d-inline-block text-xs text-lowercase">(active)</small>
                <i class="fa fa-angle-right"></i>
              </a>
              <ul class="nav nav-section-menu collapse show" id="mens">
                <li><a href="#" class="nav-link">Shoes</a></li>
                <li><a href="#" class="nav-link">Shirts</a></li>
                <li><a href="#" class="nav-link">Trousers</a></li>
                <li><a href="#" class="nav-link">Suits</a></li>
                <li><a href="#" class="nav-link">Jackets</a></li>
                <li><a href="#" class="nav-link">Sportswear</a></li>
                <li><a href="#" class="nav-link">Shorts</a></li>
                <li><a href="#" class="nav-link">Swimwear</a></li>
                <li><a href="#" class="nav-link">T-shirts</a></li>
              </ul>
            </li>
            <li>
              <a href="#womens" data-toggle="collapse" class="nav-link text-uppercase text-slab"> Womens <i class="fa fa-angle-right"></i> </a>
              <ul class="nav nav-section-menu collapse" id="womens">
                <li><a href="#" class="nav-link">Dresses</a></li>
                <li><a href="#" class="nav-link">Jeans</a></li>
                <li><a href="#" class="nav-link">Skirts</a></li>
                <li><a href="#" class="nav-link">Suits</a></li>
                <li><a href="#" class="nav-link">Jackets</a></li>
                <li><a href="#" class="nav-link">Sportswear</a></li>
                <li><a href="#" class="nav-link">Shorts</a></li>
                <li><a href="#" class="nav-link">Swimwear</a></li>
                <li><a href="#" class="nav-link">T-shirts</a></li>
              </ul>
            </li>
          </ul>
          
          <div class="p-3 overlay overlay-op-5 rounded flex-valign mb-4" data-bg-img="assets/img/shop/promo-truck.jpg" data-css='{"background-position":"center bottom"}' data-url="shop-product.html">
            <h4 class="text-white mb-0">
              Free Shipping
            </h4>
            <p class="text-white mb-0">On all orders over $100</p>
            <hr class="hr-lg my-2 w-20 mx-auto hr-primary" />
          </div>
			 -->
        </div> <!-- side end -->
      </div>
    </div>
  </div>
</body>

