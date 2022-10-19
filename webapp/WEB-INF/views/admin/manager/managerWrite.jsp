<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<script type="text/javascript">
<c:if test="${not empty write_alert_message}">
	//parent.opener.location.reload(true);
	alert('${write_alert_message}');
</c:if>
</script>


<script type="text/javascript">
<c:if test="${not empty id_check_message}">
	parent.opener.location.reload(true);
	alert('${id_check_message}');
</c:if>
</script>

<script type="text/javascript">

	function checkForm(){
		var id = $("#id").val();
		var password = $("#password").val();
		var name = $("#name").val();
		
		if(id.trim() == "" ){
			alert("아이디를 입력하세요.");
			return false;
		}else if(regForm.idDuplication.value != "idCheck"){
			alert("아이디 중복체크를 해주세요.");
			return false;
		}else if(password.trim() == ""){
			alert("비밀번호를 입력하세요.");
			return false;
		}else if(name.trim() == ""){
			alert("이름을 입력하세요.");
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

	function modifyPwd(seq) {
		var url = "./managerUpdatePwd?seq="+seq;
		location.href=url;
	}
</script>
<script>
	
	history.pushState(null, null, location.href);
	window.onpopstate = function(event) {
	     history.go(1); 
	     /* location.reload(); */
		 /* location.href = document.referrer; */
	};
</script>
<script>
	function idDuplChk(){
		var id = $("#id").val();
		var seq = $("#seq").val();
		var name = $("#name").val();
		
		if(id.length==0 || id ==""){
			alert("아이디를 입력하세요.");
			
		}else{
			var id = $("#id").val();
			//var url = "./managerIdCheck?seq="+seq;
			//location.href=url; 
			$.ajax({
				type:"POST",
				data : {
					id: id
				},
				url: "./managerIdCheck",
				success:function(data){
					if(data.idCheck == "checked"){
						alert("사용 가능한 아이디입니다.");
						$('#id').attr('readonly', true);
					}else{
						alert("사용중인 아이디입니다.");
						$('#id').focus();
					}
				},
				error:function(data){
					console.log("실패!!!!");
				}
			});
			regForm.idDuplication.value = "idCheck";
		}
	}  
	
</script>
<style type="text/css">

	.form-control_readonly {
	  background-color: #ffffff;
	  opacity: 1;
	}
	
	
	.form-control[readonly],
	fieldset[readonly] .form-control {
	  background-color: #ffffff;
	  opacity: 1;
	}
</style>

<div class="main-content">
	<div class="page-content">
		<div class="widget-box"> 
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					관리자 계정 ${managerVO.seq !=0 ? "수정" : "등록"}
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form:form id="regForm" modelAttribute="managerVO" class="form-horizontal" onsubmit="return checkForm();">
					<form:hidden path="seq" />
					
					<div class="form-group">
					<c:choose> 
   						<c:when test="${managerVO.seq !=0 or managerVO.id ne null}">
							<label class="control-label col-xs-5">아이디</label>
							<div class="col-xs-20">
								<form:input path="id" readonly="true" class="form-control" cssErrorClass="form-control input-validation-error" />
								<form:errors path="id" cssClass="field-validation-error" element="div" />
							</div>
						</c:when>
						<c:otherwise>
							<label class="control-label col-xs-5">아이디(*)</label>
							<div class="col-xs-15">
								<form:input path="id" name="id" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
								<form:errors path="id" cssClass="field-validation-error" element="div" />
							</div>
							<button type="button" name="idDuplCheck" onclick="idDuplChk()" class="btn btn-primary btn-sm" ><i class="ace-icon glyphicon glyphicon-ok"></i>중복확인</button>
							<input type="hidden" name="idDuplication" value="idUncheck">
						</c:otherwise>
					</c:choose>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">비밀번호(*)</label>
						<div class="col-xs-20">
							<%-- <form:input type="password" path="password" cssClass="form-control" cssErrorClass="form-control input-validation-error" /> --%>
							<form:input type="password" path="password" onkeydown="checkSpaceBar()" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="password" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
					<c:choose> 
						<c:when test="${managerVO.seq !=0 or managerVO.id ne null}">
							<label class="control-label col-xs-5">이름</label>
						</c:when>
						<c:otherwise>
							<label class="control-label col-xs-5">이름(*)</label>
						</c:otherwise>
					</c:choose> 
						<div class="col-xs-20">
							<form:input path="name" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="name" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">부서</label>
						<div class="col-xs-20">
							<form:input path="department" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="department" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">연락처</label>
						<div class="col-xs-20">
							<form:input path="phone" cssClass="form-control" cssErrorClass="form-control input-validation-error" /> 
							<form:errors path="phone" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">계정권한</label>
						<div class="col-xs-20">
							<form:select path="typeCode" cssClass="form-control" cssErrorClass="form-control input-validation-error">
								<form:option value="00">시스템관리자</form:option>
								<form:option value="01">인사담당자</form:option>
								<form:option value="02">컨텐츠관리자</form:option>
								<form:option value="03">일반관리자</form:option>
							</form:select>
							<form:errors path="typeCode" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<c:if test="${managerVO.seq !=0 }">
					<div class="form-group">
						<label class="control-label col-xs-5">등록일</label>
						<div class="col-xs-20">
							<form:input path="regDate" readonly="true" cssClass="form-control" cssErrorClass="form-control input-validation-error" style="background-color:white" />
							<form:errors path="regDate" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					</c:if>
					<c:if test="${managerVO.modDate ne null}">
					<div class="form-group">
						<label class="control-label col-xs-5">수정일</label>
						<div class="col-xs-20">
							<form:input path="modDate" readonly="true" cssClass="form-control" cssErrorClass="form-control input-validation-error" style="background-color:white" />
							<form:errors path="modDate" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					</c:if>
					<div class="form-group" style="margin-top:10px;">
						<div class="pull-right">
							<!-- <button type="button"  class="btn btn-primary btn-sm" onclick="location.href='./managerUpdatePwd'">비밀번호 변경</button> -->
							<c:if test="${managerVO.seq !=0 }">
								<c:choose>
									<c:when test="${managerVO.activateYN eq 'Y'}">
										<button type="button"  class="btn btn-primary btn-sm" onclick="location.replace('./managerAccInactivate?seq=${managerVO.seq}')">계정 비활성화</button>
									</c:when>
									<c:otherwise>
										<button type="button"  class="btn btn-primary btn-sm" onclick="location.replace('./managerAccInactivate?seq=${managerVO.seq}')">비활성화 해제</button>
									</c:otherwise>
								</c:choose>
								<button type="button"  class="btn btn-primary btn-sm" onclick="location.replace('./managerUpdatePwd?seq=${managerVO.seq}')">비밀번호 변경</button>
							</c:if>
							<%-- <button type="button"  class="btn btn-primary btn-sm" onclick="javascript:modifyPwd('${managerVO.seq}'")>비밀번호 변경</button> --%>
							<button type="submit"  class="btn btn-primary btn-sm" ><i class="ace-icon glyphicon glyphicon-ok"></i>적용</button>
							<button type="button" class="btn btn-info btn-sm" onclick="window.close()"><i class="ace-icon glyphicon glyphicon-remove"></i>닫기</button>
						</div>
					</div>				
				</form:form>
				</div>
			</div>
		</div>
				
	</div><!-- page-content -->
</div><!-- main-content -->
