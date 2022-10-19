<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<script type="text/javascript">
	<c:if test="${not empty write_alert_message}">
		//parent.opener.location.reload(true);
		alert('${write_alert_message}');
	</c:if>

	function checkForm(){
		var password = $("#password").val();
		var newPassword = $("#newPassword").val();
		var newPasswordConfirm = $("#newPasswordConfirm").val();
		console.log("checkForm")
		if(password.length == 0 || password == ""){
			alert("기존 비밀번호를 입력하세요.");
			return false;
		}else if(newPassword == "" || newPasswordConfirm == ""){
			alert("새 비밀번호를 입력하세요.");
			return false;
		}else if(newPassword != newPasswordConfirm){
			alert("새 비밀번호가 일치하지 않습니다.");
			return false;
		}else{
			return true;
		}
	}
	
	function checkSpaceBar(){
		var kcode = event.keyCode;
		var password = $("#password").val();

		if(kcode == 32) {
			console.log("공백 x")
			alert("비밀번호에 공백을 입력할 수 없습니다.");
			event.returnValue = false;
		}
		password = password.replace(/ /gi, "");
	}
</script>
  
<style type="text/css">
	.form-description{
		margin-top:20px;
		margin-left:20px;
		margin-bottom:20px;
	}
	.password-group{
		margin-left:20px;
	}
</style>

<div class="main-content">
	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					비밀번호 변경 
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form:form id="regForm" modelAttribute="managerVO" class="form-horizontal" onsubmit="return checkForm();">
					<form:hidden path="seq" />
					
					<div class="form-group">
						<label class="form-description">
							- 안전한 새 비밀번호로 내 정보를 보호하세요<br>
						</label>
						
					</div>
					<div class="password-group">
						<div class="form-group">
							<label class="control-label col-xs-7">기존 비밀번호</label>
							<div class="col-xs-20">
								<form:input type="password" path="password" onkeydown="checkSpaceBar()" autocomplete="off"  cssClass="form-control" cssErrorClass="form-control input-validation-error" />
								<%-- <form:hidden path="password"  /> --%>
								<form:errors path="password" cssClass="field-validation-error" element="div" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-7">새 비밀번호</label>
							<div class="col-xs-20">
								<form:input type="password" path="newPassword" onkeydown="checkSpaceBar()" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
								<form:errors path="newPassword" cssClass="field-validation-error" element="div" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-7">새 비밀번호 확인</label>
							<div class="col-xs-20">
								<form:input type="password" path="newPasswordConfirm" onkeydown="checkSpaceBar()" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
								<form:errors path="newPasswordConfirm" cssClass="field-validation-error" element="div" />
							</div>
						</div>
					</div>		
					<div class="form-group" style="margin-top:10px;">
						<div class="pull-right">
							<button type="submit"  class="btn btn-primary btn-sm" ><i class="ace-icon glyphicon glyphicon-ok"></i>확인</button>
<!-- 							<button type="submit"  class="btn btn-primary btn-sm" onclick="window.close();"><i class="ace-icon glyphicon glyphicon-ok"></i>적용</button> -->
							<button type="button" class="btn btn-info btn-sm" onclick="window.close()"><i class="ace-icon glyphicon glyphicon-remove"></i>취소</button>
						</div>
					</div>				
				</form:form>
				</div>
			</div>
		</div>
				
	</div><!-- page-content -->
</div><!-- main-content -->
    