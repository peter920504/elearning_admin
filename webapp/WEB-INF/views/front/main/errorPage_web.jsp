<!DOCTYPE html>
<html lang="en">

<head>
  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <title>Homepage (default) | AppStrap Bootstrap Theme by Themelize.me</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />

  <!-- @todo: fill with your company info or remove -->
  <meta name="description" content="">
  <meta name="author" content="Themelize.me">

  <!-- Bootstrap v4.5.0 CSS via CDN -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

  <!-- Plugins required on all pages NOTE: Additional non-required plugins are loaded ondemand as of AppStrap 2.5 -->

  <!-- Theme style -->
  <link href="<c:url value='/resources/theme/assets/css/theme-style.min.css' />" rel="stylesheet">
  <link href="<c:url value='/resources/theme/assets/css/theme-style.min.css' />" rel="stylesheet">

  <!--Your custom colour override-->
  <link href="#" id="colour-scheme" rel="stylesheet">

  <!-- Your custom override -->
  <link href="<c:url value='/resources/theme/assets/css/custom-style.css' />" rel="stylesheet">



  <!-- Optional: ICON SETS -->
  <!-- Iconset: Font Awesome 5.12.0 via CDN -->
  <link href="https://use.fontawesome.com/releases/v5.12.0/css/all.css" rel="stylesheet">
  <!-- Iconset: flag icons - http://lipis.github.io/flag-icon-css/ -->
  <link href="<c:url value='/resources/theme/assets/plugins/flag-icon-css/css/flag-icon.min.css' />" rel="stylesheet">
  <!-- Iconset: ionicons - http://ionicons.com/ -->
  <link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
  <!-- Iconset: Linearicons - https://linearicons.com/free -->
  <link href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css" rel="stylesheet">
  <!-- Iconset: Lineawesome - https://icons8.com/articles/line-awesome -->
  <link href="https://maxcdn.icons8.com/fonts/line-awesome/1.1/css/line-awesome.min.css" rel="stylesheet">


  <!-- Le fav and touch icons - @todo: fill with your icons or remove, try https://realfavicongenerator.net -->
  <link rel="apple-touch-icon" sizes="180x180" href="<c:url value='/resources/theme/assets/favicons/apple-touch-icon.png' />">
  <link rel="icon" type="image/png" sizes="32x32" href="<c:url value='/resources/theme/assets/favicons/favicon-32x32.png' />">
  <link rel="icon" type="image/png" sizes="16x16" href="<c:url value='/resources/theme/assets/favicons/favicon-16x16.png' />">
  <link rel="manifest" href="<c:url value='/resources/theme/assets/favicons/manifest.json' />">
  <link rel="shortcut icon" href="<c:url value='/resources/theme/assets/favicons/favicon.ico' />">
  <meta name="msapplication-config" content="<c:url value='/resources/theme/assets/favicons/browserconfig.xml' />">
  <meta name="theme-color" content="#ffffff">


  <!-- Google fonts -->
  <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Rambla:400,700' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Calligraffitti' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,700' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Roboto:100,400,700' rel='stylesheet' type='text/css'>

  <!--Plugin: Retina.js (high def image replacement) - @see: http://retinajs.com/-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/retina.js/1.3.0/retina.min.js"></script>
  
  <script type="text/javascript" src="<c:url value='/resources/theme/assets/plugins/slider-revolution/revolution/js/extensions/revolution.extension.video.min.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/theme/assets/plugins/slider-revolution/revolution/js/extensions/revolution.extension.slideanims.min.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/theme/assets/plugins/slider-revolution/revolution/js/extensions/revolution.extension.actions.min.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/theme/assets/plugins/slider-revolution/revolution/js/extensions/revolution.extension.layeranimation.min.js' />"></script>
  <script type="text/javascript" src="<c:url value='/resources/theme/assets/plugins/slider-revolution/revolution/js/extensions/revolution.extension.navigation.min.js' />"></script>
</head>

<!-- ======== @Region: body ======== -->

<body class="page page-page-404 navbar-layout-default page-centred">
  <a href="#content" id="top" class="sr-only">Skip to content</a>

<!-- ======== @Region: #header ======== -->
  <div id="header">

    <div data-toggle="sticky">

  		
      <!--Header search region - hidden by default -->
      <div class="header-search collapse" id="search">
        <form class="search-form container">
          <input type="text" name="search" class="form-control search" value="" placeholder="Search">
          <button type="button" class="btn btn-link"><span class="sr-only">Search </span><i class="fa fa-search fa-flip-horizontal search-icon"></i></button>
          <button type="button" class="btn btn-link close-btn" data-toggle="search-form-close"><span class="sr-only">Close </span><i class="fa fa-times search-icon"></i></button>
        </form>
      </div>

      <!--Header & Branding region-->
      <div class="header">
        <!-- all direct children of the .header-inner element will be vertically aligned with each other you can override all the behaviours using the flexbox utilities (flexbox.html) All elements with .header-brand & .header-block-flex wrappers will automatically be aligned inline & vertically using flexbox, this can be overridden using the flexbox utilities (flexbox.htm) Use .header-block to stack elements within on small screen & "float" on larger screens use .order-first or/and .order-last classes to make an element show first or last within .header-inner or .headr-block elements -->
        <div class="header-inner container">
          <!--branding/logo -->
          <div class="header-brand">
            <a class="header-brand-text" href="<c:url value='/'/>" title="Home">
              <h1 class="h2">
                HF<span class="header-brand-text-alt">-Campus</span>
              </h1>
            </a>
            <div class="header-divider d-none d-lg-block"></div>
          </div>
          
          <!-- other header content -->
          <div class="header-block order-12" style="margin-left: auto;">

            <!-- Search Input 추가 -->
            <div class="input-group float-right order-11" style="font-family: 'Noto Sans KR', sans-serif;">
	            <input type="text" class="form-control" placeholder="Search for...">
	            <div class="input-group-append">
	              <button class="btn btn-outline-primary" type="button"><i class="fa fa-search fa-flip-horizontal search-icon"></i></button>
	            </div>
	            <!-- 로그인, 회원가입 버튼 추가 -->
	            <c:if test="${sessionId == null}">
        			<a class="btn btn-primary btn-lg ml-4" href="<c:url value='/account/login'/>" role="button"">로그인</a>
<!--         			<a class="btn btn-secondary btn-lg btn-teal btn-invert" href="#" role="button" style="margin-left: 10px;" aria-pressed="true">회원가입</a> -->
          		</c:if>
          		<c:if test="${sessionId != null}">
        			<div class="btn-group" style="margin-left: 30px;">
        				<button type="button" class="btn btn-secondary btn-lg btn-teal" onclick="location.href='<c:url value='/account/profile'/>'">${sessionId.nickName}님</button>
        				<button type="button" class="btn btn-secondary btn-lg btn-teal dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="sr-only">Toggle Dropdown</span></button>
        					<div class="dropdown-menu" style="">
              					<a class="dropdown-item" href="<c:url value='/account/my-courses'/>">내 강의보기</a> <a class="dropdown-item" href="<c:url value='/account/likes'/>">좋아요</a> <a class="dropdown-item" href="<c:url value='/account/cart'/>">장바구니</a> <a class="dropdown-item" href="<c:url value='/account/profile'/>">프로필</a>
              					<div class="dropdown-divider"></div>
              					<c:if test="${sessionId.isSocial == 'N'}">
              						<a class="dropdown-item" href="<c:url value='/account/logout'/>">로그아웃</a>
              					</c:if>
              					<c:if test="${sessionId.isSocial == 'Y'}">
              						<a class="dropdown-item" href="javascript:void(0);" onclick="logoutKakao()">로그아웃</a>
              					</c:if>
            				</div>
        			</div>
          		</c:if>
          	</div>
          	

            <!-- mobile collapse menu button - data-toggle="collapse" = default BS menu - data-toggle="off-canvas" = Off-cavnas Menu - data-toggle="overlay" = Overlay Menu -->
            <a href="#top" class="btn btn-link btn-icon header-btn float-right d-lg-none" data-toggle="off-canvas" data-target=".navbar-main" data-settings='{"cloneTarget":true, "targetClassExtras": "navbar-offcanvas"}'> <i class="fa fa-bars"></i> </a>
          </div>
           <!-- other header content end -->

          <div class="navbar navbar-expand-md navbar-static-top" style="font-family: 'Noto Sans KR', sans-serif;">
            <!--everything within this div is collapsed on mobile-->
            <div class="navbar-main collapse">
              <!--main navigation-->
              <ul class="nav navbar-nav navbar-nav-stretch float-lg-right dropdown-effect-fade">

                <!-- Pages -->
                <li class="nav-item dropdown">
                  <a href="#" class="nav-link dropdown-toggle" id="pages-drop" data-toggle="dropdown" data-hover="dropdown" style="font-size: 15px;">컨텐츠</a>
                  
                   
                  <div class="dropdown-menu">
                  	<a href="<c:url value = '/edu/webEduContentsList' />" class="dropdown-item">전체</a>
	                  <c:forEach var="item" items="${headerCate}" varStatus="rowStatus">
	                  	<c:if test="${item.level eq 1}">
	                  		<a href="<c:url value='/edu/webEduContentsList?sc1=${item.title}'/>" class="dropdown-item">${item.title}</a>
	                  	</c:if>
	                  </c:forEach>
                  </div>
                  
                </li>

                <!-- Features -->
                <li class="nav-item dropdown">
                  <a href="#" class="nav-link dropdown-toggle" id="more-drop" data-toggle="dropdown" data-hover="dropdown" style="font-size: 15px;">커뮤니티</a>
                  <!-- Dropdown Menu -->
                  <div class="dropdown-menu">
                    <div class="dropdown dropdown-submenu dropdown-menu-left">
                      <a href="<c:url value='/notice/webNoticeList'/>" class="dropdown-item" >공지사항</a>
                    </div>
                    <div class="dropdown dropdown-submenu dropdown-menu-left">
                      <a href="<c:url value='/qna/webQnaList'/>" class="dropdown-item">1:1 문의</a>
                    </div>
                    <div class="dropdown dropdown-submenu dropdown-menu-left">
                      <a href="<c:url value='/faq/webFaqList'/>" class="dropdown-item ">FAQ</a>
                    </div>
                  </div>
                </li>

              </ul>
            </div>
            <!--/.navbar-collapse -->
          </div>
        </div>
      </div>
    </div>
  </div> <!-- header end -->


  <!-- ======== @Region: #content ======== -->
  <div id="content" class="py-10" style="font-family: 'Noto Sans KR', sans-serif;">
    <div class="container">
      <div class="row">
        <div class="col-md-8" style="margin: auto;">
          <div class="w-90 mx-auto">
            <h2 class="error-code text-xs-x5 text-md-x7 op-9 mb-4">
              Oops, <i class="fa fa-frown text-primary text-xs-x6 text-md-x6"></i>
            </h2>
            <h2 class="error-message text-xs-x2 text-md-x2">
              일시적으로 서버연결이 불안정합니다.
            </h2>
            <p class="error-details text-xs-x1"> 불편을 끼쳐드려 죄송합니다. 잠시 후 다시 시도해주세요. </p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- ======== @Region: #footer ======== -->
<footer id="footer" class="p-0" style="font-family: 'Noto Sans KR', sans-serif;">
    <div class="container pt-6 pb-5">
      <div class="row">
        <div class="col-md-4">
          <!--@todo: replace with company contact details-->
          <h4 class="text-uppercase text-white">
            Contact Us
          </h4>
          <address>
            <ul class="list-unstyled">
              <li>
                <abbr title="Phone"><i class="fa fa-phone fa-fw"></i></abbr>
                010-0000-0000
              </li>
              <li>
                <abbr title="Email"><i class="fa fa-envelope fa-fw"></i></abbr>
                HFCampus@humanf.co.kr
              </li>
              <li>
                <abbr title="Address"><i class="fa fa-home fa-fw"></i></abbr>
                서울특별시 서초구 방배천로 155
              </li>
            </ul>
          </address>
        </div>

      </div>

    </div>
    <hr class="my-0 hr-blank op-2" />
    <div class="bg-inverse-dark text-sm py-3">
      <div class="container">
      <!-- 
        <div class="row">
          <div class="col-md-6">
            <p class="mb-0">Site template by <a href="appstraptheme.com" class="footer-link">AppStrap</a> | Copyright 2020 &copy; AppStrap</p>
          </div>
          <div class="col-md-6">
            <ul class="list-inline footer-links float-md-right mb-0">
              <li class="list-inline-item"><a href="#">Terms</a></li>
              <li class="list-inline-item"><a href="#">Privacy</a></li>
              <li class="list-inline-item"><a href="#">Contact Us</a></li>
            </ul>
          </div>
        </div>
         -->
        <a href="#top" class="btn btn-icon btn-dark pos-fixed pos-b pos-r mr-3 mb-3 scroll-state-hidden" title="Back to top" data-scroll="scroll-state"><i class="fa fa-chevron-up"></i></a>
      </div>
    </div>
  </footer>



  <!--jQuery 3.3.1 via CDN -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <!-- Popper 1.16.0 via CDN, needed for Bootstrap Tooltips & Popovers -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

  <!-- Bootstrap v4.5.0 JS via CDN -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


  <!-- JS plugins required on all pages NOTE: Additional non-required plugins are loaded ondemand as of AppStrap 2.5 To disable this and load plugin assets manually simple add data-plugins-manual=true to the body tag -->

  <!--Custom scripts & AppStrap API integration -->
  <script src="assets/js/custom-script.js"></script>
  <!--AppStrap scripts mainly used to trigger libraries/plugins -->
  <script src="assets/js/script.min.js"></script>
</body>

</html>