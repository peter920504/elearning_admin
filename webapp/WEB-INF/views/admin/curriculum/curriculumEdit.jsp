<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
<c:if test="${not empty write_ok_message}">
	parent.opener.location.reload(true);
	alert('${write_ok_message}');
</c:if>
</script>

<script type="text/javascript">
	function checkForm(){
		var title = $("#title").val();
		var contentsTitle = $("#contentsTitle").val();
		var step = $("#step").val();
		var contentsType = $("#contentsType").val();
		
		var classCheckYN = $("#classCheckYN").val();
		
		
		if( document.getElementById("curriculumFile").files.length > 1) {
			alert("파일은 1개만 업로드하실 수 있습니다.")			
			return false;
		}
		
		if(title == ""){
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}else if(contentsTitle == ""){
			alert("교육컨텐츠를 지정해주세요.")
			$("#contentsTitle").focus();
			return false;
		}else if(step == ""){
			alert("강의 차수를 입력해주세요.");
			$("#step").focus();
			return false;
		}else if(classCheckYN == "N") {
			alert("강의 차수를 확인해주세요.")
			return false;
		}else if(contentsType == ""){
			alert("강의 종류를 입력해주세요.")
			$("#contentsType").focus();
			return false;
		}else {
			return true;
		}
	}

$(document).ready(function() {
	
	//첨부파일 이름노출
	$("#curriculumFile").on("change", handleFileSelect);
	
	$("#step").on("change", function() {
		alert("강의 차수를 변경하셨습니다. 다시 확인 버튼을 눌러 검사해주세요.")
		$("#classCheckYN").val("N");
	})
	
	//강의차수 값 검사
	$("#classCheck").on('click', function() {
		var inputCount = $("#step").val();
		var contentsSeq = $("#contentsSeq").val();
		
		var originStep = $("#originStep").val();
		if(inputCount == originStep) {
			alert("기존 강의차수와 동일합니다. 확인되었습니다.")
			$("#classCheckYN").val("Y");
		}else {
			if(inputCount == 0 || inputCount == "0") {
				alert("1 이상의 숫자를 입력해주세요.")
				return false;
			}else if(contentsSeq == null || contentsSeq == ""){
				alert("교육 컨텐츠를 먼저 선택해주세요.")
				return false;
			}else {
				countCheck_current(contentsSeq, inputCount);
			}
		}
		
	});
	
}); //document ready


function handleFileSelect(e) {
	var select_files = [];
	var files = $(this)[0].files;
	$('input[id=file-name]').removeAttr('value');
	$('input[id=file-name]').attr('value',files[0].name);
	$('input[id=mediaDelYN]').removeAttr('value');
	$('input[id=mediaDelYN]').attr('value','Y');
}

function mediaDel() {
	$('input[id=file-name]').removeAttr('value');
	$('input[id=mediaDelYN]').attr('value','Y');
	$('input[id=imageFile]').val("");
}

//현재 존재하는 차수인지
function countCheck_current(contentsSeq, inputCount) {
	
	$.ajax({
		type : "GET",
		url : "../admin/checkClassCount",
		data : {
			"contentsSeq": contentsSeq,
			"inputCount": inputCount
		},
		dataType: 'json',
		success : function(data) {
			if(data == "false" || data == false) {
				alert("이미 등록된 차수입니다.");
				$("#step").val("");
				$("#step").focus();
				$("#classCheckYN").val("N");
			}else {
				if (!confirm("등록 가능한 차수입니다. 등록하시겠습니까?")) {
					alert("취소하셨습니다. 차수를 재입력 후 확인해주세요")
					$("#step").val("");
					$("#step").focus();
					$("#classCheckYN").val("N");
				}else {
					$("#classCheckYN").val("Y");
					$('input[id=step]').attr('readOnly', "true");
				}
			
			}
		}
	});
}

</script>

<style>
.file_input label input {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
}
</style>

<div class="main-content">
	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					교육과정 수정
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form:form id="regForm" modelAttribute="curriculumVO" class="form-horizontal" onsubmit="return checkForm();" enctype="multipart/form-data">
					<form:hidden path="seq" />
					
					<div class="form-group">
						<label class="control-label col-xs-6">제목(*)</label>
						<div class="col-xs-20">
							<form:input path="title" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="title" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-6">컨텐츠 제목(*)</label>
						<div class="col-xs-20">
							<form:input path="contents" readOnly="true" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="contents" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<form:hidden path="contentsSeq" />
					<div class="form-group">
						<label class="control-label col-xs-6">강의 차수(*)</label>
						<div class="col-xs-20">
							<form:input path="step" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="step" cssClass="field-validation-error" element="div" />
						</div>
						<button type="button" id="classCheck" class="btn btn-info btn-sm">확인</button>
						<input type="hidden" id="originStep" name="classCheckYN" value="${originStep}"/>
						<input type="hidden" id="classCheckYN" name="classCheckYN" value="N"/>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-6">강의 종류(*)</label>
						<div class="col-xs-20">
							<form:input path="contentsType" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-6">YOUTUBE ID(*)</label>
						<div class="col-xs-20">
							<form:input path="youTubeId" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
						</div>
					</div>
					<div class="form-group">
						<label class='control-label col-xs-6'>강의영상</label>
						<div class='col-xs-20'>
							<input type="text" class="form-control" id="file-name" value="${eduMediaName}" readonly />
						</div>
						<div class="file_input">
							<label class="btn btn-primary btn-sm">
								    	찾아보기
								<input type="file" name="file" multiple="multiple" class="custom-file-input" id="curriculumFile" lang="ko" accept="video/*"/>
								<input type="hidden" id="mediaDelYN" name="mediaDelYN" value="N"/>
							</label>
							<button type="button" class="btn btn-info btn-sm" onclick="mediaDel()"><i class="ace-icon glyphicon glyphicon-remove"></i>삭제</button>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-6">등록일자</label>
						<div class="col-xs-20">
							<form:input path="regDate" readOnly="true" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
						</div>
					</div>
					
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
