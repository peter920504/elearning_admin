<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	var img = document.getElementById("myImg");
	if(img.dataset.src != '') {
		img.src = "<c:url value='${sessionId.filePath}'/>";
	} else {
		img.src = "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80";
	}
	
	<c:if test="${not empty write_ok_message}">
		showNotification();
	</c:if>
	<c:if test="${not empty write_not_ok_message}">
		alert('${write_not_ok_message}');
	</c:if>
});


// Show notification
const showNotification = () => {
//function showNotification() {
	var notification = document.getElementById('notification-container2');
    notification.classList.add('show')
    setTimeout(() => {
      notification.classList.remove('show')
    }, 3000)
};

$(function(){
	$("#imageFile").change(function(){
		$("#iconFile").val($("#imageFile").get(0).files[0].name);
		readURL(this);
		$("#saveBtn").attr("disabled", false);
	});
	
	//키보드를 누를때 실행
	$("#nickName").keydown(function() {
		$("#saveBtn").attr("disabled", false);
	});
	
	//키보드에서 손을 땠을때 실행
	$("#nickName").keyup(function() {
		var nickName = $("#nickName").val();
		if(nickName == '${sessionId.nickName}' || nickName == '') {
			$("#saveBtn").attr("disabled", true);	
		}
	});
	
	$("#description").keydown(function() {
		$("#saveBtn").attr("disabled", false);
	});
	
	$("#pw").keydown(function() {
		if(pwRegCheck == 1 && pwRegCheck2 == 1) {
			$("#saveBtn2").attr("disabled", false);	
		}
		$("#pwErrorMsg").hide();
	});
	
	var regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
	var pwRegCheck = 0;
	var pwRegCheck2 = 0;
	$("#pwChange").keyup(function() {
		var pwChange = $("#pwChange").val();
		var pwChangeCheck = $("#pwChangeCheck").val();
		if(!regPw.test(pwChange)){
			$("#saveBtn2").attr("disabled", true);	
			$("#pwCheckMsg2").hide();
			$("#pwCheckMsg1").css("display", "inline-block");
			pwRegCheck = 0;
		} else if(regPw.test(pwChange) && pwChange != pwChangeCheck && pwChangeCheck != ''){
			$("#saveBtn2").attr("disabled", true);	
			$("#pwCheckMsg1").hide();
			$("#pwCheckMsg2").css("display", "inline-block");
        	pwRegCheck = 0;
    	} else if(pwRegCheck == 1 && pwRegCheck2 == 1){
			$("#saveBtn2").attr("disabled", false);	
		} else {
			$("#pwCheckMsg1").hide();
			$("#pwCheckMsg2").hide();
        	pwRegCheck = 1;
    	}
	});
	
	$("#pwChangeCheck").keyup(function() {
		var pwChange = $("#pwChange").val();
		var pwChangeCheck = $("#pwChangeCheck").val();
		if(!regPw.test(pwChangeCheck)){
			$("#saveBtn2").attr("disabled", true);	
			$("#pwCheckMsg2").hide();
			$("#pwCheckMsg1").css("display", "inline-block");
			pwRegCheck2 = 0;
		} else if(regPw.test(pwChangeCheck) && pwChange != pwChangeCheck && pwChange != ''){
			$("#saveBtn2").attr("disabled", true);	
			$("#pwCheckMsg1").hide();
			$("#pwCheckMsg2").css("display", "inline-block");
        	pwRegCheck2 = 0;
    	} else if(pwRegCheck == 1 && pwRegCheck2 == 1){
			$("#saveBtn2").attr("disabled", false);	
		} else {
    		$("#pwCheckMsg1").hide();	
    		$("#pwCheckMsg2").hide();
    		pwRegCheck2 = 1;
    	}
	});
	
	var regPhone = /^\d{2,3}\d{3,4}\d{4}/;
	var phoneCheck = 0;
	$("#phone").keyup(function() {
		var phone = $("#phone").val();
		if(phone != '' && phone != null && phone != '$(sessionId.phone)') {
			if(!regPhone.test(phone) || phone.length > 11){
				$("#saveBtn3").attr("disabled", true);
				$("#phoneCheckMsg1").css("display", "inline-block");
				phoneCheck = 0;
			} else {
				$("#saveBtn3").attr("disabled", false);
				$("#phoneCheckMsg1").hide();
				phoneCheck = 1;
			}
		}
	});
	
	$("#typeCode").change(function(){
		var typeCode = $("#typeCode").val();
		if(typeCode != '${sessionId.typeCode}'){
			$("#saveBtn3").attr("disabled", false);
		} else {
			$("#saveBtn3").attr("disabled", true);
		}
	});
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        $('#myImg').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

function checkForm(){
	var nickName = $("#nickName").val();
	var returnVal = true;
	
	if(nickName != '${sessionId.nickName}' && nickName != '') {
		console.log('ajax실행됨');
		$.ajax({
			async: false,
	    	type : 'GET',
	    	data : {nickName:nickName},
	    	url : './nickCheck',
	    	success : function(data) {
	        	if (data > 0) {
					$("#nickCheckMsg1").css("display", "inline-block");
	            	$('#nickName').focus();
	            	$("#saveBtn").attr("disabled", true);
	            	returnVal = false;
	        	} else {
        			$("#nickCheckMsg1").hide();
	            	returnVal = true;
	        	}
	    	},
	    	error : function(request, error) { 
	    		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    		$("#saveBtn").attr("disabled", true);
	    		returnVal = false;
	    	}
		});
	}
	return returnVal;
}

function checkForm2(){
	var id = '${sessionId.id}';
	var pw = $("#pw").val();
	var returnVal = true;
	
	if(pw != '') {
		$.ajax({
			async: false,
	    	type : 'GET',
	    	data : {id:id, pw:pw},
	    	url : './pwCheck',
	    	success : function(data) {
	        	if (data > 0) {
	        		$("#pwErrorMsg").hide();
	            	returnVal = true;
	        	} else {
	        		$("#pwErrorMsg").css("display", "inline-block");
	            	$("#saveBtn2").attr("disabled", true);
	            	returnVal = false;
	        	}
	    	},
	    	error : function(request, error) { 
	    		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    		returnVal = false;
	    	}
		});
	} else {
		$("#pwErrorMsg").css("display", "inline-block");
		$("#saveBtn2").attr("disabled", true);
		returnVal = false;
	}
	
	return returnVal;
}

function checkForm3(){
	var returnVal = true;
	
	if(phoneCheck = 1) {
		returnVal = true;
	} else {
		returnVal = false;
	}
	return returnVal;
}

</script>

<style>
.input.pf,
.textarea.pf {
	border:none!important; 
	background-color: transparent!important;
}

.input.pf:focus, 
.textarea.pf:focus {
	outline: none!important;
}

.col-md-5 {
	max-width: 100%;
}

.mx-auto {
	margin-left: unset;
}

.bg-white.shadow.rounded.overflow-hidden {
	margin-bottom: 50px;
}

.btn.btn-save[disabled] {
	cursor: not-allowed;
    margin-top: 20px;
/*     border-radius: 15px; */
	width: 30%;
	display: block;
	margin: auto;
	margin-bottom: 30px;
    font-weight: 800!important;
    font-size: 18px;
    line-height: 2.4rem;
}

.btn.btn-save {
	cursor: not-allowed;
    margin-top: 20px;
    width: 30%!important;
    display: block;
    margin: auto;
    margin-bottom: 30px;
/*     border-radius: 15px; */
    font-weight: 800!important;
    font-size: 18px;
    line-height: 2.4rem;
}

.mr-3 {
	margin-right: unset!important;
	margin: 0 auto!important;
}

.error_next_box {
    display: none;
    font-size: 12px;
    margin-top: 20px;
    line-height: 14px;
    color: #ab001f;
    
}

.green {
    color: #08a600!important;
}

</style>
<!-- ======== @Region: body ======== -->
<body class="page page-shop header-compact-sticky page-shop-grid navbar-layout-navbar-below" style="font-family: 'Noto Sans KR', sans-serif !important;">


  <!-- ======== @Region: #page-header ======== -->
  <div id="page-header">
    <div class="container clearfix">
      <h3 class="mb-0 float-md-left">
         	프로필
      </h3>
    </div>
  </div>

  <!-- ======== @Region: #content ======== -->
  <div id="content" class="py-3 py-lg-6">
    <div class="container">
      <div class="row">
        <!-- Products grid -->
        <div class="col-lg-9 order-lg-2">
          <hr class="my-4" />
          <div class="row">
          
          <div class="col-md-5 mx-auto">
			<!-- Profile widget -->
			<!--  section1  -->
			<form role="form" method="post" action="updateProfile1" enctype="multipart/form-data" onsubmit="return checkForm();">
			<div class="bg-white shadow rounded overflow-hidden">
				<div class="px-4 pt-0 pb-4 cover" style="margin-top: 50px;">
					<div class="media align-items-end profile-head" style="text-align:center;">
						<div class="profile mr-3">
							<img data-src="${sessionId.iconFile}"
								src="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80"
								alt="..." width="130" height="130" class="rounded mb-2 img-thumbnail" id="myImg" style="height: 130px;">
								<a href="javascript:void(0);" onclick="$('#imageFile').trigger('click')" class="btn btn-outline-dark btn-sm btn-block">대표이미지 변경</a>
							<input type="file" name="file" id="imageFile" accept="image/*" style="display:none">
						</div>
					</div>
				</div>
			
				<div class="px-4 py-3">
					<h5 class="mb-0">닉네임</h5>
					<div class="p-2 rounded shadow-sm bg-light">
						<input type="text" id="nickName" name="nickName" class="input pf" value="${sessionId.nickName}" placeholder="변경할 닉네임을 입력해주세요" size=100>
					</div>
					<span class="error_next_box" id="nickCheckMsg1" aria-live="assertive">중복된 닉네임이에요!</span>
				</div>
				
				<div class="px-4 py-3">
					<h5 class="mb-0">자기소개</h5>
					<div class="p-2 rounded shadow-sm bg-light">
						<textarea class="textarea pf" rows=10 cols=100 id="description" name="description">${sessionId.description}</textarea>
					</div>
				</div>
				<input type="hidden" id="seq" name="seq" value="${sessionId.seq}">
				<input type="hidden" id="id" name="id" value="${sessionId.id}">
				<input type="hidden" id="iconFile" name="iconFile" value="${sessionId.iconFile}">
				<input type="submit" id="saveBtn" class="btn btn-save btn-teal" value="저장하기" disabled>
				</div>
				</form>
				
				
				<!--  section2  -->
				<form role="form" method="post" action="updateProfile2" onsubmit="return checkForm2();">
				<div class="bg-white shadow rounded overflow-hidden">
				<div class="px-4 py-3">
					<h5 class="mb-0">비밀번호 변경</h5>
					<div class="p-2 rounded shadow-sm bg-light">
						<input type="password" id="pw" class="input pf" value="" placeholder="현재 비밀번호" size=50>
					</div>
					<div class="p-2 rounded shadow-sm bg-light" style="margin-top:10px;">
						<input type="password" id="pwChange" name = "pw" class="input pf" value="" placeholder="새 비밀번호" size=50>
					</div>
					<div class="p-2 rounded shadow-sm bg-light" style="margin-top:10px;">
						<input type="password" id="pwChangeCheck" class="input pf" value="" placeholder="새 비밀번호 확인" size=50>
					</div>
					<span class="error_next_box" id="pwErrorMsg" aria-live="assertive">현재 비밀번호를 확인해주세요.</span>
					<span class="error_next_box" id="pwCheckMsg1" aria-live="assertive">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요!</span>
					<span class="error_next_box" id="pwCheckMsg2" aria-live="assertive">비밀번호가 일치하지 않습니다.</span>
				</div>
				<input type="hidden" id="seq" name="seq" value="${sessionId.seq}">
				<input type="submit" id="saveBtn2" class="btn btn-save btn-teal" value="저장하기" disabled>
				</div>
				</form>
				
				<!--  section3  -->
				<form role="form" method="post" action="updateProfile3" onsubmit="return checkForm3();">
				<div class="bg-white shadow rounded overflow-hidden">
				<div class="px-4 py-3">
					<h5 class="mb-0">휴대폰 번호<span class="phoneTag" style="color:#8e8e8e; font-size: 15px">(-제외하고 입력해주세요)</span></h5>
					<div class="p-2 rounded shadow-sm bg-light">
						<input type="text" id="phone" name="phone" class="input pf" value="${sessionId.phone}" placeholder="" size=50>
					</div>
					<span class="error_next_box" id="phoneCheckMsg1" aria-live="assertive">휴대폰 번호 형식이 올바르지 않아요!</span>
				</div>
				<div class="px-4 py-3">
					<h5 class="mb-0">소속</h5>
								<select class="form-control p-2 rounded shadow-sm bg-light" id="typeCode" name="typeCode">
									<c:if test = "${sessionId.typeCode eq '01'}">
										<option value="01" selected>일반</option>
										<option value="02">기업</option>
										<option value="03">기타</option>
									</c:if>
									<c:if test = "${sessionId.typeCode eq '02'}">
										<option value="01">일반</option>
										<option value="02" selected>기업</option>
										<option value="03">기타</option>
									</c:if>
									<c:if test = "${sessionId.typeCode eq '03'}">
										<option value="01">일반</option>
										<option value="02">기업</option>
										<option value="03" selected>기타</option>
									</c:if>
								</select>
				</div>
				<input type="hidden" id="seq" name="seq" value="${sessionId.seq}">
				<input type="hidden" id="id" name="id" value="${sessionId.id}">	
				<input type="submit" id="saveBtn3" class="btn btn-save btn-teal" value="저장하기" disabled>
				</div>
				</form>
				
				<!--  section4  -->
				<div class="bg-white shadow rounded overflow-hidden">
				<div class="px-4 py-3">
					<h5 class="mb-0">탈퇴</h5>
				</div>
				</div>
			</div>
          
         </div> 
          
        </div>
        
         
        <!-- Products sidebar -->
        <div class="col-lg-3 order-lg-1">

          <!-- Sections Menu-->
          <ul class="nav nav-section-menu mb-4 py-3">
            <li class="nav-header">안녕하세요. ${sessionId.nickName}님!</li>
            <li><a href="<c:url value='/account/my-courses'/>" class="nav-link" style="font-family: 'Noto Sans KR', sans-serif !important;">내 강의 보기</a></li>
            <li><a href="<c:url value='/account/likes'/>" class="nav-link" style="font-family: 'Noto Sans KR', sans-serif !important;">좋아요 한 강의</a></li>
            <li><a href="<c:url value='/account/cart'/>" class="nav-link" style="font-family: 'Noto Sans KR', sans-serif !important;">장바구니</a></li>
            <li><a href="#" class="nav-link" style="font-family: 'Noto Sans KR', sans-serif !important;">프로필</a></li>
          </ul> 
        </div> <!-- side end -->
      </div>
    </div>
  </div>
</body>

