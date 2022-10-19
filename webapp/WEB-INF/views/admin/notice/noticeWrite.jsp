<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>


<script type="text/javascript">
<c:if test="${not empty write_alert_message}">
	//parent.opener.location.reload(true);
	alert('${write_alert_message}');
</c:if>
</script>


<script type="text/javascript">
	$(function() {
		 $("#file").change(function(e){
			var fileName = $("#file")[0].files[0].name;
			$("#originFileName").value = fileName;
			$("#originFileName").val(fileName);
			$("#originFileName").attr("disabled", true); 
		});
	});

	
	function is_checked(){
		if($("#topYNCheck").is(":checked")== true){  
			$("#topYN").val(1);
		}
		alert($("#topYN").val());
	}
/* 
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
	}*/
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
					공지사항 ${noticeVO.seq !=0 ? "수정" : "등록"}
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form:form id="regForm" modelAttribute="noticeVO" class="form-horizontal" onsubmit="return checkForm();" enctype="multipart/form-data">
					<form:hidden path="seq" />
					<div class="form-group">
						<label class="control-label col-xs-5">제목</label>
						<div class="col-xs-20">
							<form:input type="text" path="title" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="title" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">첨부파일</label>
						<div class="col-xs-20">
							<input type="file" name="file" id="file" style="display:none; ">
							<form:input path="originFileName" id="originFileName" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="originFileName" cssClass="field-validation-error" element="div" />
						</div>
						<c:if test="${noticeVO.originFileName eq null }">
						<button type="button" class="btn btn-primary btn-sm" id="duplBtn" onclick="$('#file').trigger('click')"><i class="ace-icon glyphicon glyphicon-ok"></i>첨부파일</button>
						</c:if>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">내용</label>
						<div class="col-xs-20">
							<form:textarea path="contents" cols="100" rows="10" class="form-control" cssErrorClass="form-control input-validation-error" style="resize: none;"/>
							<form:errors path="contents" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">고정공지</label>
						<div class="col-xs-20">
							<c:choose>
								<c:when test="${noticeVO.topYN eq 1 }"><input type="checkbox" id="topYNCheck" onclick='is_checked()' checked="checked"/></c:when>
								<c:otherwise><input type="checkbox" id="topYNCheck" onclick='is_checked()'/></c:otherwise>
							</c:choose> 
							<form:checkbox path="topYN" id="topYN" value="0" cssClass="form-control" cssErrorClass="form-control input-validation-error" style="display:none;" /> 
							<form:errors path="topYN" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<c:if test="${noticeVO.seq !=0 }">
					<div class="form-group">
						<label class="control-label col-xs-5">작성자</label>
						<div class="col-xs-20">
							<form:input path="managerName" readonly="true" cssClass="form-control" cssErrorClass="form-control input-validation-error" style="background-color:white" />
							<form:errors path="managerName" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					</c:if>
					<c:if test="${noticeVO.seq !=0 }">
					<div class="form-group">
						<label class="control-label col-xs-5">등록일</label>
						<div class="col-xs-20">
							<form:input path="regDate" readonly="true" cssClass="form-control" cssErrorClass="form-control input-validation-error" style="background-color:white" />
							<form:errors path="regDate" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					</c:if>
					<c:if test="${noticeVO.modDate ne null}">
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
