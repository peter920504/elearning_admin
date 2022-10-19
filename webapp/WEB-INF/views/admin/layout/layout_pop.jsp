<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<title><tiles:getAsString name="title" /> | HF-Campus</title>

	<tiles:insertAttribute name="head"/>

	<link rel="stylesheet" href="<c:url value='/resources/css/vacu/common.css'/>?v=20150421" type="text/css"  media="screen">
 
</head>

<body class="pop_wrap" id="page-top">
	<tiles:insertAttribute name="content" ignore="true"/>
	
	<script src="<c:url value='/resources/libs/ace/ace.js'/>"></script>
	<script src="<c:url value='/resources/libs/ace/ace.widget-box.js'/>"></script>
</body>
</html>