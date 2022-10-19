<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="main-content-inner">
	<div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
		<script type="text/javascript">
			try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
		</script>

		<ul class="breadcrumb">
			<li>
				<i class="ace-icon fa fa-home home-icon"></i>
				<a href="<c:url value='/admin' />">Home</a>
			</li>
		</ul>
	</div>

	<div class="page-content">

		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					사용자정보 
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
					<div class="row">
						<label class="col-xs-5 text-right">아이디</label>
						<div class="col-xs-3"></div>
						<div class="col-xs-40">${adminUserVO.userId}</div>
					</div>
					<div class="row">
						<label class="col-xs-5 text-right">이름</label>
						<div class="col-xs-3"></div>
						<div class="col-xs-40">${adminUserVO.userName}</div>
					</div>
					<div class="row">
						<label class="col-xs-5 text-right">접속권한</label>
						<div class="col-xs-3"></div>
						<div class="col-xs-40">${fn:replace(adminUserVO.userType, 'ROLE_', '')}</div>
					</div>
					<%--
					<sec:authentication property="principal.authorities"/>
					--%>
					<%--
					<div class="row">
						<label class="col-xs-5 text-right">소개</label>
						<div class="col-xs-3"></div>
						<div class="col-xs-40">${adminUserVO.remark}</div>
					</div>							
					<div class="row">
						<label class="col-xs-5 text-right">작업권한</label>
						<div class="col-xs-3"></div>
						<div class="col-xs-40">${adminUserVO.role}</div>
					</div>
					--%>
				</div>
			</div><!-- widget-body -->
		</div><!-- widget-box -->
		
	</div><!-- page-content -->
</div><!-- main-content-inner -->

${fn:replace(string1, 'first', 'second')}