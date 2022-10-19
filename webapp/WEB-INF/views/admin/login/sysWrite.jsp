<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">

function formSubmit(frm) {
	alert('test');
	return true;
}

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
			<li class="active">관리계정(sysadm)등록</li>
		</ul>
	</div>

	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					<span>sysadm 등록</span>
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form:form modelAttribute="userVO" class="form-horizontal" method="post" action="<c:url value='/admin/syswrite' />" onsubmit="return formSubmit(this);" >
					<div class="form-group">
						<label class="control-label col-xs-10">(*)아이디</label>
						<div class="col-xs-20">
							<form:input path="사용자ID" cssClass="form-control" placeholder="사용자ID" cssErrorClass="form-control input-validation-error" readonly="true" value="sysadm"/>
							<form:errors path="사용자ID" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">(*)이름</label>
						<div class="col-xs-20">
							<form:input path="이름" cssClass="form-control" placeholder="이름" cssErrorClass="form-control input-validation-error" />
							<form:errors path="이름" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">(*)비밀번호</label>
						<div class="col-xs-20">
							<form:input path="비밀번호" cssClass="form-control" placeholder="비밀번호" cssErrorClass="form-control input-validation-error" />
							<form:errors path="비밀번호" cssClass="field-validation-error" element="div" />
						</div>
						<div class="col-xs-50">
							※ sysadm 계정은 자동 생성되는 계정으로 패스워드를 설정하여 사용할 수 있습니다.
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">(*) 부서</label>
						<div class="col-xs-20">
							<form:input path="부서" cssClass="form-control" placeholder="부서" cssErrorClass="form-control input-validation-error" />
							<form:errors path="부서" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">(*) 연락처</label>
						<div class="col-xs-20">
							<form:input path="연락처" cssClass="form-control" placeholder="연락처" cssErrorClass="form-control input-validation-error" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">(*)접속권한</label>
						<div class="col-xs-20">
							<form:select path="접속권한" cssClass="form-control" cssErrorClass="form-control input-validation-error">
								<form:option value="ROLE_시스템관리자">시스템관리자</form:option>
							</form:select>
							<form:errors path="접속권한" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					
					<form:errors path="" cssClass="alert alert-danger" element="div"  />
					
					<c:if test="${not empty write_error_message}">
						<div class="alert alert-danger">
							${write_error_message}
						</div>
					</c:if>
					<c:if test="${not empty write_ok_message}">
						<div class="alert alert-success">
							${write_ok_message} <br>
						</div>
					</c:if>

					<div class="form-group">
						<div class="col-xs-offset-50">
							<button type="submit" class="btn btn-success btn-sm" onclick=";">저장</button>
							<button type="reset" class="btn btn-success btn-sm" onclick=";">취소</button>
						</div>
					</div>
				</form:form>
					

				</div>
						
			</div>
		</div>
 
	</div><!-- page-content -->
</div><!-- main-content-inner -->
