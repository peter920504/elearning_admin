<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
<c:if test="${not empty write_ok_message}">
	parent.opener.location.reload(true);
	alert('${write_ok_message}');
</c:if>
<c:if test="${not empty write_not_ok_message}">
	parent.opener.location.reload(true);
	alert('${write_not_ok_message}');
</c:if>
</script>
<script src="<c:url value='/resources/js/smartEditor/js/service/HuskyEZCreator.js'/>" charset="utf-8"></script>
<link href="<c:url value='/resources/yoons/all.min.css'/>" rel="stylesheet">
<script type="text/javascript">

var idCheck = 0;
var nickCheck = 0;
var idRegCheck = 0;
var pwRegCheck = 0;
var pwCheckCheck = 0;
var nickRegCheck = 0;

function duplIdCheck() {
	var id = $("#id").val();
	if(idRegCheck == 1) {
		$.ajax({
			async: false,
        	type : 'GET',
        	data : {id:id},
        	url : './idCheck',
        	success : function(data) {
            	if (data > 0) {
                	alert("ID가 존재합니다. 다른 ID를 입력해주세요.");
                	$('#id').val('');
                	$('#id').focus();
                	idCheck = 0;
            	} else {
                	alert("사용가능한 ID입니다.");
                	//ID가 중복하지 않으면  idCheck = 1 
                	idCheck = 1;
            	}
        	},
        	error : function(request, error) { 
        		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	}
    	});
	} else {
		alert("올바른 ID를 입력해주세요.");
		$('#id').focus();
		return false;
	}
}

function duplNickCheck() {
	var nickName = $("#nickName").val();
	if(nickRegCheck != 0) {
		$.ajax({
			async: false,
        	type : 'GET',
        	data : {nickName:nickName},
        	url : './nickCheck',
        	success : function(data) {
            	if (data > 0) {
                	alert("닉네임이 존재합니다. 다른 닉네임을 입력해주세요.");
                	$('#nickName').val('');
                	$('#nickName').focus();
                	nickCheck = 0;
            	} else {
                	alert("사용가능한 닉네임입니다.");
                	//닉네임이 중복하지 않으면  idck = 1 
                	nickCheck = 1;
            	}
        	},
        	error : function(request, error) { 
        		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        	}
    	});
	} else {
		alert("올바른 닉네임을 입력해주세요.");
		$('#nickName').focus();
		return false;
	}
}

//id, 닉네임 변화감지
$(function(){
	$('#id').on("propertychange change keyup paste" ,function() {
		idCheck = 0;	
	});
	$('#nickName').on("propertychange change keyup paste" ,function() {
		nickCheck = 0;	
	});	
});

//유효성 검사
$(function(){
// 	var idRegType = /^[a-z0-9]{5,20}$/; //유효성 수정해야됨 이메일형식으로
	var regEmail=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	var pwRegType = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
	var nickRegType = /^[가-힣A-Za-z0-9]{2,10}$/;
	
	$("#id").on('blur', function(){
		var id = $("#id").val();
		if(!regEmail.test(id)) {
			$("#idMsg").show();
			$("#idMsg2").hide();
			idRegCheck = 0;
		} else{
			$("#idMsg").hide();
			$("#idMsg2").show();
			idRegCheck = 1;
		}
	});
	
	$("#pw").on('blur', function(){
		var pw = $("#pw").val();
		if(!pwRegType.test(pw)) {
			$("#pswd1Msg").show();
			$("#pswd1Msg2").hide();
			pwRegCheck = 0;
		} else{
			$("#pswd1Msg").hide();
			$("#pswd1Msg2").show();
			pwRegCheck = 1;
		}
	});
	
	$("#pwCheck").on('blur', function(){
		var pw = $("#pw").val();
		var pwCheck = $("#pwCheck").val();
		if(pwCheck != pw){
			$("#pswd2Msg").show();
			$("#pswd2Msg2").hide();
			pwCheckCheck = 0;
		} else{
			$("#pswd2Msg").hide();
			$("#pswd2Msg2").show();
			pwCheckCheck = 1;
		}
	});
	
	$("#nickName").on('blur', function(){
		var nickName = $("#nickName").val();
		if(!nickRegType.test(nickName)) {
			$("#nickMsg").show();
			$("#nickMsg2").hide();
			nickRegCheck = 0;
		} else{
			$("#nickMsg").hide();
			$("#nickMsg2").show();
			nickRegCheck = 1;
		}
	});
});
	
function checkForm(){
	var id = $("#id").val();
	var pw = $("#pw").val();
	var pwCheck = $("#pwCheck").val();
	var nickName = $("#nickName").val();
	
	if(nickName == "${userVO.nickName}") {
		nickCheck = 1;
		nickRegCheck = 1;
	}
	
	if("${userVO.seq}" != 0) {
		idCheck = 1;
		pwRegCheck = 1;
		pwCheckCheck = 1;
	}
	
	//중복확인 버튼 체크 됐는지 검사하는 로직 
	if(id == "" || pw == "" || pwCheck == "" || nickName == ""){
		alert("필수값 확인");
		return false;
	}else if(idCheck == 0 || nickCheck == 0) {
		alert("사용가능한 ID 또는 닉네임인지 체크하세요.");
		return false;
	}else if(pwRegCheck == 0){
		$("#pw").focus();
		return false;	
	}else if(pwCheckCheck == 0){
		$("#pwCheck").focus();
		return false;
	}else if(nickRegCheck == 0){
		$("#nickName").focus();
		return false;
	}else{
		return true;
	}
	return true;
}	
	
</script>

<style>
.form-group .tbl_file td{padding:2px 0;}
#choiceRecordDiv input{border:none; background-color: none; width:100%}
#recordDiv input{border:none; background-color: none; width:100%}

.file_input label {
    position:relative;
    cursor:pointer;
    display:inline-block;
    vertical-align:middle;
    overflow:hidden;
    background:#777;
    color:#fff;
    text-align:center;
}
.file_input label input {
    position:absolute;
    width:0;
    height:0;
    overflow:hidden;
}
</style>

<div class="main-content">
	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					사용자 ${userVO.seq !=0 ? "수정" : "등록"}
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form:form id="regForm" modelAttribute="userVO" class="form-horizontal" onsubmit="return checkForm();" enctype="multipart/form-data">
					<div class="form-group">
						<label class="control-label col-xs-5">ID(*)</label>
						<div class="col-xs-20">
							<c:if test="${userVO.id != null}">
								<form:input path="id" cssClass="form-control" cssErrorClass="form-control input-validation-error" readonly="true"/>
							</c:if>
							<c:if test="${userVO.id == null}">
								<form:input path="id" cssClass="form-control" cssErrorClass="form-control input-validation-error" maxlength="20"/>
								<span class="error_next_box" id="idMsg" aria-live="assertive">이메일 형식에 맞게 입력해주세요.</span>
								<span class="error_next_box green" id="idMsg2" aria-live="assertive">멋진 아이디네요!</span>
								<span class="error_next_box" id="idMsg3" aria-live="assertive">필수 정보입니다.</span>
							</c:if>
							<form:errors path="id" cssClass="field-validation-error" element="div" />
						</div>
						<c:if test="${userVO.id == null}">
							<button type="button" class="btn btn-primary btn-sm" id="duplBtn" onclick="duplIdCheck()"><i class="ace-icon glyphicon glyphicon-ok"></i>중복확인</button>
						</c:if>
					</div>
					<c:if test="${userVO.id == null}">
					<div class="form-group">
						<label class="control-label col-xs-5">비밀번호(*)</label>
						<div class="col-xs-20">
							<form:input type="password" path="pw" cssClass="form-control" cssErrorClass="form-control input-validation-error" maxlength="20"/>
							<form:errors path="pw" cssClass="field-validation-error" element="div" />
							<span class="error_next_box" id="pswd1Msg" aria-live="assertive">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span>
							<span class="error_next_box green" id="pswd1Msg2" aria-live="assertive">멋진 비밀번호네요!</span>
						</div>
					</div>
					</c:if>
					<c:if test="${userVO.id == null}">
					<div class="form-group">
						<label class="control-label col-xs-5">비밀번호 확인(*)</label>
						<div class="col-xs-20">
							<input type="password" id="pwCheck" name="pwCheck" class="form-control" maxlength="20"/>
							<span class="error_next_box" id="pswd2Msg" aria-live="assertive">비밀번호가 일치하지 않습니다.</span>
							<span class="error_next_box green" id="pswd2Msg2" aria-live="assertive">비밀번호가 일치합니다!</span>
						</div>
					</div>
					</c:if>
					<div class="form-group">
						<label class="control-label col-xs-5">닉네임(*)</label>
						<div class="col-xs-20">
							<form:input path="nickName" cssClass="form-control" cssErrorClass="form-control input-validation-error" maxlength="15"/>
							<span class="error_next_box" id="nickMsg" aria-live="assertive">2~10자의 한글, 영문 대 소문자, 숫자만 사용 가능합니다.</span>
							<span class="error_next_box green" id="nickMsg2" aria-live="assertive">멋진 닉네임이네요!</span>
							<form:errors path="nickName" cssClass="field-validation-error" element="div" />
						</div>
						<button type="button" class="btn btn-primary btn-sm" id="duplBtn" onclick="duplNickCheck()"><i class="ace-icon glyphicon glyphicon-ok"></i>중복확인</button>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">소개</label>
						<div class="col-xs-20">
							<form:input path="description" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="description" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">종류코드</label>
						<div class="col-xs-20">
							<form:select path="typeCode" cssClass="form-control" cssErrorClass="form-control input-validation-error">
								<form:option value="01">일반</form:option>
								<form:option value="02">기업</form:option>
								<form:option value="03">장애인</form:option>
								<form:option value="04">국가유공자</form:option>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">소속</label>
						<div class="col-xs-20">
							<form:input path="assign" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="assign" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">휴대폰 번호</label>
						<div class="col-xs-20">
							<form:input path="phone" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="phone" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					
					<c:if test="${userVO.id != null}">
					<div class="form-group">
						<label class="control-label col-xs-5">가입일자</label>
						<div class="col-xs-20">
							<form:input path="joinDate" cssClass="form-control" cssErrorClass="form-control input-validation-error" readonly="true"/>
							<form:errors path="joinDate" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					</c:if>
					
					<div class="form-group">
						<c:if test="${userVO.id != null}">
							<label class="control-label col-xs-5">탈퇴일자</label>
							<div class="col-xs-20">
							<form:input path="quitDate" cssClass="form-control" cssErrorClass="form-control input-validation-error"/>
							<form:errors path="quitDate" cssClass="field-validation-error" element="div" />
							</div>	
						</c:if>					
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">대표아이콘 파일</label>
						<div class="col-xs-20">
							<div class="custom-file" >
								<div class="file_input">
									<form:input path="iconFile" value="${userVO.iconFile}" class="form-control" readonly="true"/>
								</div>
							</div>
						</div>
						<div class="file_input">
							<label class="btn btn-primary btn-sm">
								찾아보기
								<input type="file" name="file" multiple="multiple" class="custom-file-input" id="imageFile" lang="ko" accept="image/*"/>
							</label>
						</div>
					</div>
					<div class="form-group">
						<label class='control-label col-xs-5'>이미지 미리보기</label>
							<div class='col-xs-20'>
								<div id="result">
									<c:if test="${userVO.iconFile != null && userVO.iconFile != ''}">
										<img class="crop" width="70%" height="200px" src="<c:url value='${userVO.filePath}'/>">
									</c:if>
								</div>
							</div>
					</div>
					<div class="form-group">
						<c:if test="${userVO.id != null}">
						<label class="control-label col-xs-5">휴면여부</label>
						<div class="col-xs-20">
							<form:select path="isUse" cssClass="form-control" cssErrorClass="form-control input-validation-error">
								<form:option value="Y">Y</form:option>
								<form:option value="N">N</form:option>
							</form:select>
						</div>
						</c:if>
					</div>
					
					<div class="form-group" style="margin-top:10px;">
						<div class="pull-right">
							<c:if test="${userVO.seq == 0}">
								<button type="submit" class="btn btn-primary btn-sm" id="registerBtn"><i class="ace-icon glyphicon glyphicon-ok"></i>등록</button>
							</c:if>
							<c:if test="${userVO.seq != 0}">
								<button type="submit" class="btn btn-primary btn-sm" ><i class="ace-icon glyphicon glyphicon-ok" ></i>저장</button>
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

<!-- 이미지 에디터 Modal -->
<div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-full modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">이미지 에디터</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
        	<div class="img-container">
        		<canvas id="canvas">Your browser does not support the HTML5 canvas element.</canvas>
        	</div>
        	<div class="docs-toolbar">
	          <div class="btn-group">
	            <button class="btn btn-primary" data-method="zoom" data-option="0.1" type="button" title="확대">
	                <i class="fas fa-search-plus"></i>
	            </button>
	            <button class="btn btn-primary" data-method="zoom" data-option="-0.1" type="button" title="축소">
	                <i class="fas fa-search-minus"></i>
	            </button>
	            <button class="btn btn-primary" data-method="rotate" data-option="-90" type="button" title="왼쪽 90도 회전">
	                <i class="fas fa-undo"></i>
	            </button>
	            <button class="btn btn-primary" data-method="rotate" data-option="90" type="button" title="오른쪽 90도 회전">
	                <i class="fas fa-redo"></i>
	            </button>
	          </div>
        	</div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-danger" type="button" id="btnDelete" value="Delete" data-dismiss="modal"><spring:message code="취소"/></button>
          <button class="btn btn-primary" type="button"  id="btnCrop" value="Crop" data-dismiss="modal"><spring:message code="적용"/></button>
        </div>
      </div>
    </div>
  </div>

<!-- image cropper -->
<script>
var canvas  = $("#canvas"),
context = canvas.get(0).getContext("2d"),
$result = $('#result');


function cropperInit(img) {
	context.canvas.height = img.height;
    context.canvas.width  = img.width;
    context.drawImage(img, 0, 0);
    var cropper = canvas.cropper({
    	minContainerWidth : 600,
    	minContainerHeight : 600,
    });
    $(".docs-toolbar > .btn-group > .btn").click(function() {
  		var command = $(this).find(".docs-tooltip").attr("data-original-title");
  		var method = $(this).attr("data-method");
  	 	var option = $(this).attr("data-option");
   		cropper.cropper(method, option);
    });
    
    $('#btnCrop').click(function() {
       // Get a string base 64 data url
        var croppedImageDataURL = canvas.cropper('getCroppedCanvas',{
    	   imageSmoothingEnabled: false,
    	   width:200,
    	   height:100
       }).toDataURL("image/png");  
       $result.html( $('<img class="crop">').attr('src', croppedImageDataURL) );
//        var trashIcon = "<i class=\"fas fa-trash remove-file\" style=\"position: absolute;right:10px;bottom:10px;\"></i>"; 
//        $result.append(trashIcon);
    });
    $('#btnDelete').click(function() {
      	canvas.cropper('reset');
      	$result.empty();
      	$('#iconFile').val('');
      	$('#imageFile').val('');
    });
}
// 이미지 클릭시 크롭 적용
$(document).on('click','img',function() {
	canvas.cropper('destroy');
	$("#imageModal").modal();
	var img = new Image();
	img.onload = function() {
		cropperInit(img);
	}
	img.src = $(this).attr("src");
});

// 이미지 파일 추가 시 크롭 적용
$('#imageFile').on( 'change', function(){
	$("#iconFile").val($("#imageFile").get(0).files[0].name);
	canvas.cropper('destroy');
	if (this.files && this.files[0]) {
	  if ( this.files[0].type.match(/^image\//) ) {
		$("#imageModal").modal();
	    var reader = new FileReader();
	    reader.onload = function(evt) {
	    	var img = new Image();
	        img.onload = function() {
	          	cropperInit(img);
	        };
	        img.src = evt.target.result;
		};
	    reader.readAsDataURL(this.files[0]);
	  }
	  else {
	    alert("파일 형식이 잘못되었습니다. 이미지 파일만 가능합니다.");
	  }
	}
	else {
	  alert("선택한 파일이 존재하지 않습니다.");
	}
});
</script>

<link href="<c:url value='/resources/css/cropper.css'/>" rel="stylesheet">
<script src="<c:url value='/resources/js/cropper.js'/>"></script>
<script src="<c:url value='/resources/js/jquery-cropper.js'/>"></script>