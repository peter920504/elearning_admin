<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<script type="text/javascript">
	<c:if test="${not empty write_alert_message}">
		//parent.opener.location.reload(true);
		alert('${write_alert_message}');
	</c:if>

	function checkForm(){
		var password = $("#password").val();
		var actionDesc = $("actionDesc").val();
		
		if(password == ""){
			alert("비밀번호를 입력하세요.");
			return false;
		}else if(actionDesc == ""){
			alert("계정을 비활성화 하려는 이유를 입력하세요.")
			return false;
		}
		return true;
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
	.form-control-deact {
	  display: block;
	  width: 120%;
	  height: 120px;
	  padding: 6px 12px;
	  font-size: 14px;
	  line-height: 1.42857143;
	  resize: none;
	  color: #555555;
	  background-color: #ffffff;
	  background-image: none;
	  border: 1px solid #cccccc;
	  border-radius: 1px;
	  word-wrap: break-word;
	  word-break: break-word;
	  white-space: pre-wrap;
	  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	  -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
	  -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	  transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	}
</style>

<div class="main-content">
	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					${managerVO.activateYN == 'Y' ? "계정 비활성화" : "비활성화 해제"}
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form:form id="regForm" modelAttribute="managerVO" class="form-horizontal" onsubmit="return checkForm();">
					<form:hidden path="seq" />
					<form:hidden path="activateYN" />
					
					<div class="form-group">
						<label class="form-description">
							
						</label>
						
					</div>
					<div class="password-group">
						<%-- <div class="form-group">
							<label class="control-label col-xs-11">비밀번호를 입력하세요.</label>
							<div class="col-xs-20">
								<form:input path="password" type="password" autocomplete="off" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
								<form:hidden path="password"  />
								<form:errors path="password" cssClass="field-validation-error" element="div" />
							</div>
						</div> --%>
						<c:if test="${managerVO.activateYN eq 'Y' }">
						<div class="form-group">
							<label class="control-label col-xs-11">계정을 비활성화하려는 이유가 무엇인가요?</label>
							<div class="col-xs-20">
								<form:textarea path="actionDesc" cols="40" rows="10" maxlength="500" cssClass="form-control-deact"></form:textarea>
								<form:errors path="actionDesc" cssClass="field-validation-error" element="div" />
							</div>
						</div>
						</c:if>
					</div>		
					
					<div class="form-group" style="margin-top:10px;">
						<div class="pull-right">
							<button type="submit"  class="btn btn-primary btn-sm" ><i class="ace-icon glyphicon glyphicon-ok"></i>확인</button>
<!-- 							<button type="submit"  class="btn btn-primary btn-sm" onclick="window.close();"><i class="ace-icon glyphicon glyphicon-ok"></i>적용</button> -->
							<button type="button" class="btn btn-info btn-sm" onclick="location.href='./managerWrite?seq=${managerVO.seq}'"><i class="ace-icon glyphicon glyphicon-remove"></i>취소</button>
						</div>
					</div>				
				</form:form>
				</div>
			</div>
		</div>
				
	</div><!-- page-content -->
</div><!-- main-content -->
    