<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="../layout/head.jsp" />
</head>
<body class="no-skin">

	<div id="navbar" class="navbar navbar-default navbar-fixed-top">
		<jsp:include page="../layout/header.jsp" />
	</div>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<jsp:include page="../layout/sidebar.jsp" />

		<div class="main-content">
			<div class="main-content-inner">
				<div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
					<script type="text/javascript">
						try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
					</script>

					<ul class="breadcrumb">
						<li>
							<i class="ace-icon fa fa-home home-icon"></i>
							<a href="<c:url value='/' />">Home</a>
						</li>
					</ul>
				</div>
				<div class="page-content">

					<div class="row">
						<div class="col-xs-48">
							<div class="error-container">
								<div class="well">

									<h3 class="lighter smaller">
										<i class="ace-icon fa fa-random"></i>
										요청하신 자료가 없습니다.
									</h3>
									<div class="space"></div>
									<div>
										<h4 class="lighter smaller"></h4>
										<ul class="list-unstyled spaced inline bigger-110 margin-15">
											<li>
												<i class="ace-icon fa fa-hand-o-right blue"></i>
												요청하신 기능에 대한 권한이 충분한지 확인해주십시오
											</li>
											<li>
												<i class="ace-icon fa fa-hand-o-right blue"></i>
												관리자에게 연락하여 주십시오
											</li>
										</ul>
									</div>
									<hr>
									<div class="space"></div>

									<div class="center">
										<a href="javascript:history.back()" class="btn btn-grey">
											<i class="ace-icon fa fa-arrow-left"></i>
											뒤로
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../layout/footer.jsp" />
	</div>
	<%-- ace scripts 	--%>

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
