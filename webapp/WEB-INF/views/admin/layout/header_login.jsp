<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:if test="${fn:indexOf(requestURI, '/about')>=0 || fn:indexOf(requestURI, '/contact')>=0}">
<div class="clearfix" style="margin:2px 20px">
	<div class="pull-right">
		<button type="button" onclick="javascript:location.href='<c:url value="/"/>';">로그인</button>
	</div>		
</div>
</c:if>

<header class="header-wrapper">
	<div class="navbar" style="margin:0"> 
			<a href="<c:url value='/admin/login'/>" class="navbar-brand">
				<small>
					<b> HF-Campus 관리시스템</b>
				</small>
			</a>
		</div>
</header>

