
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 카카오 로그인 -->
<script type="text/javascript"
	src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script type="text/javascript">

function logoutKakao() {
	Kakao.init('83d03171429b0e47f31f2629036a69c5'); // 초기화
    Kakao.isInitialized();
	if (!Kakao.Auth.getAccessToken()) {
	  console.log('Not logged in.');
	  return;
	} else {
		//서버에 있는 access_token 만료
		Kakao.Auth.logout(function() {
			console.log('카카오 토큰값: '+ Kakao.Auth.getAccessToken());
		});
		
		//유저 로그아웃시키기
	    location.href = "<c:url value='/account/logout'/>";
	}
}
</script>

<style>
.notification-container {
	border-radius: 0 0 10px 10px;
	padding: 15px 20px;
	position: absolute;
	/* bottom: -50px; */
	transition: transform 1.5s ease-in-out;
	width: 30%;
	opacity: 3;
	z-index: 999999;
	right: 30% !important;
	top: -190px;
}

.notification-container.show {
	transform: translateY(190px);
}
</style>

<!-- ======== @Region: #header ======== -->
<div id="header">

	<div data-toggle="sticky">

		<div class="alert alert-success notification-container"
			id="notification-container" role="alert">
			<strong>Success:</strong> 수강신청이 완료되었습니다.
		</div>

		<div class="alert alert-success notification-container"
			id="notification-container2" role="alert">
			<strong>Success:</strong> 회원정보수정이 완료되었습니다.
		</div>

		<div class="alert alert-success notification-container"
			id="notification-container3" role="alert">
			<strong>Success:</strong> 좋아요 한 강의에 추가되었습니다.
		</div>

		<div class="alert alert-success notification-container"
			id="notification-container4" role="alert">
			<strong>Success:</strong> 좋아요 목록에서 삭제되었습니다.
		</div>

		<div class="alert alert-success notification-container"
			id="notification-container5" role="alert">
			<strong>Success:</strong> 장바구니에 추가되었습니다.
		</div>

		<!--Header search region - hidden by default -->
		<div class="header-search collapse" id="search">
			<form class="search-form container">
				<input type="text" name="search" class="form-control search"
					value="" placeholder="Search">
				<button type="button" class="btn btn-link">
					<span class="sr-only">Search </span><i
						class="fa fa-search fa-flip-horizontal search-icon"></i>
				</button>
				<button type="button" class="btn btn-link close-btn"
					data-toggle="search-form-close">
					<span class="sr-only">Close </span><i
						class="fa fa-times search-icon"></i>
				</button>
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
					<div class="input-group float-right order-11"
						style="font-family: 'Noto Sans KR', sans-serif;">
						<input type="text" class="form-control"
							placeholder="Search for...">
						<div class="input-group-append">
							<button class="btn btn-outline-primary" type="button">
								<i class="fa fa-search fa-flip-horizontal search-icon"></i>
							</button>
						</div>
						<!-- 로그인, 회원가입 버튼 추가 -->
						<c:if test="${sessionId == null}">
							<a class="btn btn-primary btn-lg ml-4"
								href="<c:url value='/account/login'/>" role="button">로그인</a>
							<!--         			<a class="btn btn-secondary btn-lg btn-teal btn-invert" href="#" role="button" style="margin-left: 10px;" aria-pressed="true">회원가입</a> -->
						</c:if>
						<c:if test="${sessionId != null}">
							<div class="btn-group" style="margin-left: 30px;">
								<button type="button" class="btn btn-secondary btn-lg btn-teal"
									onclick="location.href='<c:url value='/account/profile'/>'">${sessionId.nickName}님</button>
								<button type="button"
									class="btn btn-secondary btn-lg btn-teal dropdown-toggle dropdown-toggle-split"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									<span class="sr-only">Toggle Dropdown</span>
								</button>
								<div class="dropdown-menu" style="">
									<a class="dropdown-item"
										href="<c:url value='/account/my-courses'/>">내 강의보기</a> <a
										class="dropdown-item" href="<c:url value='/account/likes'/>">좋아요</a>
									<a class="dropdown-item" href="<c:url value='/account/cart'/>">장바구니</a>
									<a class="dropdown-item"
										href="<c:url value='/account/profile'/>">프로필</a>
									<div class="dropdown-divider"></div>
									<c:if test="${sessionId.isSocial == 'N'}">
										<a class="dropdown-item"
											href="<c:url value='/account/logout'/>">로그아웃</a>
									</c:if>
									<c:if test="${sessionId.isSocial == 'Y'}">
										<a class="dropdown-item" href="javascript:void(0);"
											onclick="logoutKakao()">로그아웃</a>
									</c:if>
								</div>
							</div>
						</c:if>
					</div>


					<!-- mobile collapse menu button - data-toggle="collapse" = default BS menu - data-toggle="off-canvas" = Off-cavnas Menu - data-toggle="overlay" = Overlay Menu -->
					<a href="#top"
						class="btn btn-link btn-icon header-btn float-right d-lg-none"
						data-toggle="off-canvas" data-target=".navbar-main"
						data-settings='{"cloneTarget":true, "targetClassExtras": "navbar-offcanvas"}'>
						<i class="fa fa-bars"></i>
					</a>
				</div>
				<!-- other header content end -->

				<div class="navbar navbar-expand-md navbar-static-top"
					style="font-family: 'Noto Sans KR', sans-serif;">
					<!--everything within this div is collapsed on mobile-->
					<div class="navbar-main collapse">
						<!--main navigation-->
						<ul
							class="nav navbar-nav navbar-nav-stretch float-lg-right dropdown-effect-fade">

							<!-- Pages -->
							<li class="nav-item dropdown"><a href="#"
								class="nav-link dropdown-toggle" id="pages-drop"
								data-toggle="dropdown" data-hover="dropdown"
								style="font-size: 15px;">컨텐츠</a>


								<div class="dropdown-menu">
									<a href="<c:url value='/edu/webEduContentsList'/>"
										class="dropdown-item">전체</a>
									<c:forEach var="item" items="${headerCate}"
										varStatus="rowStatus">
										<c:if test="${item.level eq 1}">
											<a
												href="<c:url value='/edu/webEduContentsList?sc1=${item.title}'/>"
												class="dropdown-item">${item.title}</a>
										</c:if>
									</c:forEach>
								</div></li>

							<!-- Features -->
							<li class="nav-item dropdown"><a href="#"
								class="nav-link dropdown-toggle" id="more-drop"
								data-toggle="dropdown" data-hover="dropdown"
								style="font-size: 15px;">커뮤니티</a> <!-- Dropdown Menu -->
								<div class="dropdown-menu">
									<div class="dropdown dropdown-submenu dropdown-menu-left">
										<a href="<c:url value='/notice/webNoticeList'/>"
											class="dropdown-item">공지사항</a>
									</div>
									<div class="dropdown dropdown-submenu dropdown-menu-left">
										<a href="<c:url value='/qna/webQnaList'/>"
											class="dropdown-item">1:1 문의</a>
									</div>
									<div class="dropdown dropdown-submenu dropdown-menu-left">
										<a href="<c:url value='/faq/webFaqList'/>"
											class="dropdown-item ">FAQ</a>
									</div>
								</div></li>

						</ul>
					</div>
					<!--/.navbar-collapse -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- header end -->
