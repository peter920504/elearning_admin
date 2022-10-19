<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${data['ccl'] ne null}">
${data['ccl']}
</c:if>
<a href="#self" class="btn_social social-menu" title="공유하기">공유하기</a>
<div class="social_icon">
    <a href="#self" class="sns" id="facebook" title="페이스북"><img src="<c:url value='/resources/images/front/sub/icon_fb.png'/>" alt="페이스북"/></a>
    <a href="#self" class="sns" id="twitter" title="트위터"><img src="<c:url value='/resources/images/front/sub/icon_tw.png'/>" alt="트위터"/></a>
    <a href="#self" class="sns" id="kakaotalk" title="카카오톡"><img src="<c:url value='/resources/images/front/sub/icon_kk.png'/>" alt="카카오톡"/></a>
    <a href="#self" class="copy-url" title="URL 복사"><img src="<c:url value='/resources/images/front/sub/icon_url.png'/>" alt="URL"/></a>
</div>
<a href="#self" class="btn_print social-menu" data-target-class="content" title="프린트">프린트</a>