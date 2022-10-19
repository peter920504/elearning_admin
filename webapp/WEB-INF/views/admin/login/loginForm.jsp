<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="<c:url value='/resources/libs/jquery-validation-1.11.1/jquery.validate.js'/>"></script>
<script src="<c:url value='/resources/libs/jquery-validation-1.11.1/messages_ko.js'/>"></script>
<script>

$(document).ready(function() {
	// Validator 
	
	$('#loginForm').validate({
		rules: {
			j_username: 'required',
			j_password: 'required',
		},
		 errorPlacement: function(error,element) {
			 return true;
		}
	});
	
	$("input[name='j_username']").focus();
	
});

</script>

<div class="login_wrap">
	<div class="login_wrap">
		<div id="loginBox" style="margin-top: 120px;" class="col-xs-offset-16 col-xs-16">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title"> <i class="glyphicon glyphicon-exclamation-sign"></i> 로그인
					</div>
				</div>
				<div style="padding-top: 30px" class="panel-body">
					<form id="loginForm" class="form-horizontal" name="loginForm" action="<c:url value='/login'/>"  method="POST" >
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div style="height: 60px"> 
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
								<input type="text" class="form-control" id="username" name="username" value="" placeholder="아이디">
								<label for="username" class="error"></label>
							</div>
							<div>
								<label for="j_username" class="error"></label>
							</div>
						</div>
						<div style="height: 60px">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
								<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
								<label for="password" class="error"></label>
							</div>
							<div>
								<label for="j_password" class="error"></label>
							</div>
						</div>
						<div class="form-group">
							<div class="form-controls col-xs-offset-4 col-xs-24 checkbox">
								<input type="checkbox" id="login-remember" name="_spring_security_remember_me" value="1">로그인 상태 유지
								<label for="login-remember" class="error"></label>
							</div>
						</div>
						<div class="form-group">
							<div class="form-controls col-xs-offset-20">
								<button type="submit" class="btn btn-primary " value="로그인"><i class="icon-hand-right"></i>&nbsp;로그인</button>						
							</div>
						</div>
						<div  class="form-group">
							<div class="error_info">
							<c:if test="${not empty fail}">
								로그인 정보가 올바르지 않습니다. 다시 로그인해 주세요!
							</c:if>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>