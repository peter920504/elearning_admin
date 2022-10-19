<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<!-- ======== @Region: body ======== -->

<body class="page page-index navbar-layout-default">

  <!-- @plugin: page loading indicator, delete to remove loader -->
<!--   <div class="page-loader" data-toggle="page-loader"></div> -->

  <a id="#top" href="#content" class="sr-only">Skip to content</a>

  <!-- ======== @Region: #header ======== -->
  <tiles:insertAttribute name="head"/>
  <tiles:insertAttribute name="header"/>
  <!-- header end -->


  <!-- ======== @Region: #content ======== -->
  <tiles:insertAttribute name="content"/>

  <!-- ======== @Region: #footer ======== -->
  <tiles:insertAttribute name="footer"/>


  <!--jQuery 3.3.1 via CDN -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <!-- Popper 1.16.0 via CDN, needed for Bootstrap Tooltips & Popovers -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

  <!-- Bootstrap v4.5.0 JS via CDN -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


  <!-- JS plugins required on all pages NOTE: Additional non-required plugins are loaded ondemand as of AppStrap 2.5 To disable this and load plugin assets manually simple add data-plugins-manual=true to the body tag -->

  <!--Custom scripts & AppStrap API integration -->
  <script src="<c:url value='/resources/theme/assets/js/custom-script.js' />"></script>
  <!--AppStrap scripts mainly used to trigger libraries/plugins -->
  <script src="<c:url value='/resources/theme/assets/js/script.min.js' />"></script>
</body>

</html>