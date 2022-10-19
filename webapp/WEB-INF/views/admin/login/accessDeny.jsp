<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
</style>
<script type="text/javascript">
</script>

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

		<div class="row">
			<div class="col-xs-48">
				<div class="error-container">
					<div class="well">

						<h3 class="lighter smaller">
							<i class="ace-icon fa fa-random"></i>
							권한이 없습니다..
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
 