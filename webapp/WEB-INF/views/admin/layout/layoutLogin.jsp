<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title><tiles:getAsString name="title" /> - 국립극단 관리시스템 </title>
	<meta name="title" content="">
	<meta name="keyword" content="">
	<tiles:insertAttribute name="head"/>
</head>

<body>
<div id="wrap">
	<tiles:insertAttribute name="header_login" ignore="true"/>
	<tiles:insertAttribute name="content" ignore="true"/>
	<tiles:insertAttribute name="footer" ignore="true"/>
</div>
</body>
</html>