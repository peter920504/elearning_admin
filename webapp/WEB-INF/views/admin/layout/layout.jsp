<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title><tiles:getAsString name="title" /> | HF-Campus</title>
		
	<tiles:insertAttribute name="head"/>
	
	<link rel="stylesheet" href="<c:url value='/resources/css/vacu/common.css'/>?v=20160421" type="text/css"  media="screen">
</head>

<body class="no-skin">

	<c:if test="${adminUserVO.userType=='ROLE_시스템관리자'}">
	HF-Campus 관리시스템1
	</c:if>
	<c:if test="${adminUserVO.userType=='ROLE_일반관리자'}">
	HF-Campus 관리시스템2
	</c:if>
	<c:if test="${adminUserVO.userType=='ROLE_일반사용자'}">
	HF-Campus 관리시스템3
	</c:if>

<c:choose>
	<c:when test="${adminUserVO.userType=='ROLE_시스템관리자'}">
		<div id="navbar" class="navbar navbar-default navbar-fixed-top topbg_user1"  >
	</c:when>
	<c:when test="${adminUserVO.userType=='ROLE_일반관리자'}">
		<div id="navbar" class="navbar navbar-default navbar-fixed-top topbg_user2"  >
	</c:when>
	<c:otherwise>
		<div id="navbar" class="navbar navbar-default navbar-fixed-top topbg"  >
	</c:otherwise>
</c:choose>

		<tiles:insertAttribute name="header" ignore="true"/>
	</div>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<tiles:insertAttribute name="sidebar" ignore="true"/>
		
		<div class="main-content">
			<tiles:insertAttribute name="content" ignore="true"/>
		</div>
	</div>
	<tiles:insertAttribute name="footer" ignore="true"/>
	
	<script src="<c:url value='/resources/libs/ace/elements.scroller.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/elements.colorpicker.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/elements.fileinput.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/elements.typeahead.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/elements.wysiwyg.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/elements.spinner.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/elements.treeview.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/elements.wizard.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/elements.aside.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/ace.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/ace.ajax-content.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/ace.touch-drag.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/ace.sidebar.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/ace.sidebar-scroll-1.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/ace.submenu-hover.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/ace.widget-box.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/ace.settings.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/ace.settings-rtl.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/ace.settings-skin.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/ace.widget-on-reload.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/ace.searchbox-autocomplete.js'/>"></script>	
</body>
</html>