<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
<c:if test="${not empty write_alert_message}">
	parent.opener.location.reload(true);
	alert('${write_alert_message}');
</c:if>
</script>

<script type="text/javascript">

function checkForm(){
	/* var id = $("#id").val();
	var pw = $("#pw").val();
	var pwCheck = $("#pwCheck").val();
	var nickName = $("#nickName").val();
		
	//중복확인 버튼 체크 됐는지 검사하는 로직 추가해야함
	if(id == "" || pw == "" || pwCheck == "" || nickName == ""){
		alert("필수값 확인");
		return false;
	}else{
		return true;
	}
	if(form.nickDuplication.value != "nickUncheck"){
		alert("닉네임 중복체크를 해주세요.");
		return false;
	}else{
		return true;
	} */
	return true;
}

/* $(function(){
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("#pwCheck").keyup(function(){
		var pw = $("#pw").val();
		var pwCheck = $("#pwCheck").val();
		if(pw != "" || pwCheck != "") {
			if(pw == pwCheck) {
				$("#alert-success").show();
				$("#alert-danger").hide();
				$("#registerBtn").removeAttr("disabled");
			} else {
				$("#alert-success").hide();
				$("#alert-danger").show();
				$("#registerBtn").attr("disabled", "disabled");
			}
		}
	});
}); */
	
	
	
</script>
<div class="main-content">
	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					1:1 문의 답변 등록 
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form:form id="regForm" modelAttribute="questionVO" class="form-horizontal" onsubmit="return checkForm();">
					<form:input path="seq" value="${questionVO.seq }" class="form-control" cssErrorClass="form-control input-validation-error" style="display:none;" />
					<div class="form-group">
						<label class="control-label col-xs-5">제목</label>
						<div class="col-xs-20">
							<form:input path="title" class="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="title" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">내용</label>
						<div class="col-xs-20">
							<form:textarea path="contents" cols="100" rows="10" class="form-control" cssErrorClass="form-control input-validation-error" style="resize: none;"/>
							<form:errors path="contents" cssClass="field-validation-error" element="div" />
						</div>
					</div>

					
					<div class="form-group" style="margin-top:10px;">
						<div class="pull-right">
							<c:if test="${questionVO.seq == 0}">
								<button type="submit"  class="btn btn-primary btn-sm" id="registerBtn" disabled><i class="ace-icon glyphicon glyphicon-ok"></i>등록</button>
							</c:if>
							<c:if test="${questionVO.seq != 0}">
								<button type="submit"  class="btn btn-primary btn-sm" ><i class="ace-icon glyphicon glyphicon-ok"></i>저장</button>
							</c:if>
							<button type="button" class="btn btn-info btn-sm" onclick="window.close()"><i class="ace-icon glyphicon glyphicon-remove"></i>닫기</button>
						</div>
					</div>	
				</form:form>
				</div>
			</div>
		</div>
				
	</div><!-- page-content -->
</div><!-- main-content --> 