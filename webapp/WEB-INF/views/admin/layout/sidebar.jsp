<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
$(document).ready(function() {
	$(".nav.nav-list  li").has("li.active").addClass("open");

});
</script>

<div id="sidebar" class="sidebar responsive sidebar-fixed">
	<script type="text/javascript">
		try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
	</script>
		
	<ul class="nav nav-list">
	
<%-- 		<c:if test="${adminUserVO.userType=='ROLE_시스템관리자'}"> --%>
			<li class="">
				<a href="#" class="dropdown-toggle"><i class="menu-icon fa fa-user"></i><span class="menu-text">관리자계정</span><b class="arrow fa fa-angle-down"></b></a><b class="arrow"></b>
				<ul class="submenu">
					<li class="${fnItkc:contains(requestURI, '/admin/managerList')?'active':''}"><a href="<c:url value='/admin/managerList'/>"><i class="menu-icon fa fa-caret-right"></i>계정목록</a><b class="arrow"></b></li>
					<li class="${fnItkc:contains(requestURI, '/admin/managerLogList')?'active':''}"><a href="<c:url value='/admin/managerLogList'/>"><i class="menu-icon fa fa-caret-right"></i>관리자 로그 목록</a><b class="arrow"></b></li>
				</ul>
			</li>
<%-- 		</c:if> --%>
			
<%-- 		<c:if test="${adminUserVO.userType=='ROLE_시스템관리자'}"> --%>
			<li class="">
				<a href="#" class="dropdown-toggle"><i class="menu-icon fa fa-user"></i><span class="menu-text" style="font-size : 6.5pt" >고객 소통 관리</span><b class="arrow fa fa-angle-down"></b></a><b class="arrow"></b>
				<ul class="submenu">
					<li class="${fnItkc:contains(requestURI, '/admin/noticeList')?'active':''}"><a href="<c:url value='/admin/noticeList'/>"><i class="menu-icon fa fa-caret-right"></i>공지사항</a><b class="arrow"></b></li>
					<li class="${fnItkc:contains(requestURI, '/admin/questionList')?'active':''}"><a href="<c:url value='/admin/questionList'/>"><i class="menu-icon fa fa-caret-right"></i>1:1 문의</a><b class="arrow"></b></li>
					<li class="${fnItkc:contains(requestURI, '/admin/faqList')?'active':''}"><a href="<c:url value='/admin/faqList'/>"><i class="menu-icon fa fa-caret-right"></i>FAQ</a><b class="arrow"></b></li>
					<li class="${fnItkc:contains(requestURI, '/admin/commentList')?'active':''}"><a href="<c:url value='/admin/commentList'/>"><i class="menu-icon fa fa-caret-right"></i>후기</a><b class="arrow"></b></li>
				</ul>
			</li>
<%-- 		</c:if> --%>
			
<%-- 		<c:if test="${adminUserVO.userType=='ROLE_시스템관리자'}"> --%>
			<li class="">
				<a href="#" class="dropdown-toggle"><i class="menu-icon fa fa-user"></i><span class="menu-text">사용자 관리</span><b class="arrow fa fa-angle-down"></b></a><b class="arrow"></b>
				<ul class="submenu">
					<li class="${fnItkc:contains(requestURI, '/admin/userList')?'active':''}"><a href="<c:url value='/admin/userList'/>"><i class="menu-icon fa fa-caret-right"></i>사용자 목록 관리</a><b class="arrow"></b></li>
					<li class="${fnItkc:contains(requestURI, '/admin/userLogList')?'active':''}"><a href="<c:url value='/admin/userLogList'/>"><i class="menu-icon fa fa-caret-right"></i>사용자 로그 관리</a><b class="arrow"></b></li>
					<li class="${fnItkc:contains(requestURI, '/admin/boardLikeList')?'active':''}"><a href="<c:url value='/admin/boardLikeList'/>"><i class="menu-icon fa fa-caret-right"></i>좋아요 목록 관리</a><b class="arrow"></b></li>
					<li class="${fnItkc:contains(requestURI, '/admin/userCodeList')?'active':''}"><a href="<c:url value='/admin/userCodeList'/>"><i class="menu-icon fa fa-caret-right"></i>사용자 유형코드 관리</a><b class="arrow"></b></li>
				</ul>
			</li>
<%-- 		</c:if> --%>
			
<%-- 		<c:if test="${adminUserVO.userType=='ROLE_시스템관리자'}"> --%>			
			<li class="">
				<a href="#" class="dropdown-toggle"><i class="menu-icon fa fa-book"></i><span class="menu-text">교육컨텐츠</span><b class="arrow fa fa-angle-down"></b></a><b class="arrow"></b>
				<ul class="submenu">
					<li class="${fnItkc:contains(requestURI, '/admin/eduContentsList')?'active':''}"><a href="<c:url value='/admin/eduContentsList'/>"><i class="menu-icon fa fa-caret-right"></i>컨텐츠목록</a><b class="arrow"></b></li>
					<li class="${fnItkc:contains(requestURI, '/admin/curriculumList')?'active':''}"><a href="<c:url value='/admin/curriculumList'/>"><i class="menu-icon fa fa-caret-right"></i>교육과정목록</a><b class="arrow"></b></li>
				</ul>
			</li>
<%-- 		</c:if> --%>
			
<%-- 		<c:if test="${adminUserVO.userType=='ROLE_시스템관리자'}"> --%>	
			<li class="">
				<a href="#" class="dropdown-toggle"><i class="menu-icon fa fa-user"></i><span class="menu-text">카테고리</span><b class="arrow fa fa-angle-down"></b></a><b class="arrow"></b>
				<ul class="submenu">
					<li class="${fnItkc:contains(requestURI, '/admin/categoryList')?'active':''}"><a href="<c:url value='/admin/categoryList'/>"><i class="menu-icon fa fa-caret-right"></i>카테고리 목록</a><b class="arrow"></b></li>
				</ul>	
			</li>
<%-- 		</c:if> --%>
			
<%-- 		<c:if test="${adminUserVO.userType=='ROLE_시스템관리자'}"> --%>	
			<li class="">
				<a href="#" class="dropdown-toggle"><i class="menu-icon fa fa-user"></i><span class="menu-text">진도관리</span><b class="arrow fa fa-angle-down"></b></a><b class="arrow"></b>
				<ul class="submenu">
					<li class="${fnItkc:contains(requestURI, '/admin/progressList')?'active':''}"><a href="<c:url value='/admin/progressList'/>"><i class="menu-icon fa fa-caret-right"></i>진도 목록</a><b class="arrow"></b></li>
				</ul>	
			</li>
<%-- 		</c:if> --%>
		
	</ul>
	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>
	<script type="text/javascript">
		try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
	</script>

</div>

