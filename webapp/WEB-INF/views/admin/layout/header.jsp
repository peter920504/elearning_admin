<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<script type="text/javascript">
		try{ace.settings.check('navbar' , 'fixed')}catch(e){}
	</script>

	<div class="navbar-container" id="navbar-container" >
		<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
			<span class="sr-only">Toggle sidebar</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<div class="navbar-header pull-left" >
			<a href="<c:url value='/admin'/>" class="navbar-brand">
				<small>
					<img src="<c:url value='/resources/images/common/logo_hf.png'/>" alt="미디어그룹사람과숲" style="width: 20px; height: 21px;">
					e-Learning 관리 시스템
				</small>
			</a>
		</div>
		<div class="navbar-buttons navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav">
				<li class="light-blue"  >
				
					<c:choose>
						<c:when test="${adminUserVO.userType=='ROLE_시스템관리자'}">
		 					<a data-toggle="dropdown" href="#" class="dropdown-toggle"  style="background-color:#5272c3"> 
						</c:when>
						<c:when test="${adminUserVO.userType=='ROLE_일반관리자'}">
		 					<a data-toggle="dropdown" href="#" class="dropdown-toggle"  style="background-color:#6ec482"> 
						</c:when>
						<c:otherwise>
		 					<a data-toggle="dropdown" href="#" class="dropdown-toggle" > 
						</c:otherwise>
					</c:choose>
						<span class="user-info" >
							<small>안녕하세요!</small>
							"${adminUserVO.userName}"님
						</span>
						<i class="ace-icon fa fa-caret-down"></i>
					</a>
					<form id="logoutForm" name="logoutForm" action="<c:url value='/admin/logout'/>" method="POST">
    				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    				</form>
					<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
						<li class="divider"></li>
 						<li>
							<a href="#" onclick="document.logoutForm.submit();">
								<i class="ace-icon fa fa-power-off"></i>
								로그아웃
							</a>
						</li>
					</ul>
					
				</li>
			</ul>
		</div>
	</div>
