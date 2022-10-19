<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
var nickRegCheck = 0;
var nickCheck = 0;
var idCheck = 0;
var idRegCheck = 0;
var pwRegCheck = 0;
var pwCheck = 0;
var phoneCheck = 0;

$(function() {
	//닉네임 중복 체크 Ajax(focus 사라질때)
	var regNick = /^[가-힣A-Za-z0-9]{2,10}$/;
	$("#nickName").on('blur', function() {
		var nickName = $("#nickName").val();
		if(nickName != '' && nickName != null) {
			$('#needMsg4').hide();
			if(!regNick.test(nickName)) {
				$('#nickMsg').css("display", "inline-block");
				$("#nickCheckMsg1").hide();
				$("#nickCheckMsg2").hide();
				nickRegCheck = 0;
			} else {	
				$("#nickMsg").hide();
				$("#nickCheckMsg1").hide();
				$("#nickCheckMsg2").hide();
				nickRegCheck = 1;
			}
		}
		if(nickRegCheck != 0) {
			$.ajax({
				async: false,
	        	type : 'GET',
	        	data : {nickName:nickName},
	        	url : './nickCheck',
	        	success : function(data) {
	            	if (data > 0) {
	            		$("#nickCheckMsg1").css("display", "inline-block");
	        			$("#nickCheckMsg2").hide();
	                	nickCheck = 0;
	            	} else {
	            		$("#nickCheckMsg2").css("display", "inline-block");
	        			$("#nickCheckMsg1").hide();
	                	nickCheck = 1;
	            	}
	        	},
	        	error : function(request, error) { 
	        		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        	}
	    	});
	}
	});
	
	var regEmail=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	//이메일 형식 유효성
	$("#id").on('blur', function(){
		var id = $("#id").val();
		if(id != ''  && id != null) {
			$('#needMsg1').hide();
			if(!regEmail.test(id)) {
				$('#idMsg').css("display", "inline-block");
				$("#idCheckMsg1").hide();
				$("#idCheckMsg2").hide();
				idRegCheck = 0;
			} else {	
				$("#idMsg").hide();
				$("#idCheckMsg1").hide();
				$("#idCheckMsg2").hide();
				idRegCheck = 1;
			}
		}
		
		if(idRegCheck == 1) {
			$.ajax({
				async: false,
	        	type : 'GET',
	        	data : {id:id},
	        	url : './idCheck',
	        	success : function(data) {
	            	if (data > 0) {
	            		$("#idCheckMsg1").css("display", "inline-block");
	        			$("#idMsg2").hide();
	                	idCheck = 0;
	            	} else {
	            		$("#idCheckMsg2").css("display", "inline-block");
	        			$("#idCheckMsg1").hide();
	                	idCheck = 1;
	            	}
	        	},
	        	error : function(request, error) { 
	        		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        	}
	    	});
		}
	});	
	
	var regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
	$("#pw").on('blur', function(){
		var pw = $("#pw").val();
		if(pw != ''  && pw != null) {
			$('#needMsg2').hide();
			if(!regPw.test(pw)) {
				$("#pwCheckMsg3").hide();
				$("#pwCheckMsg1").css("display", "inline-block");
				$("#pwCheckMsg2").hide();
				pwRegCheck = 0;
			} else {
				$("#pwCheckMsg3").hide();
    			$("#pwCheckMsg1").hide();
    			$("#pwCheckMsg2").css("display", "inline-block");
            	pwRegCheck = 1;
        	}
		}
	});
	
	$("#pw2").on('blur', function(){
		if(pwRegCheck != 0) {
			var pw = $('#pw').val();
			var pw2 = $('#pw2').val();
			if(pw != pw2){
				$("#pw2CheckMsg1").css("display", "inline-block");
				$("#pw2CheckMsg2").hide();
		    	pwCheck = 0;
			} else {
				$("#pw2CheckMsg2").css("display", "inline-block");
				$("#pw2CheckMsg1").hide();
				pwCheck = 1;
			}
		}
	});
	
// 	var regPhone = /^[0-9]+$/;
	var regPhone = /^\d{2,3}\d{3,4}\d{4}/;
	$("#phone").on('blur', function(){
		var phone = $("#phone").val();
		if(phone != '' && phone != null) {
			$('#needMsg3').hide();
			if(!regPhone.test(phone) || phone.length > 11){
				$("#phoneCheckMsg1").css("display", "inline-block");
				phoneCheck = 0;
			} else {
				$("#phoneCheckMsg1").hide();
				phoneCheck = 1;
			}
		}
	})
});

function checkForm(){
	var returnVal = true;
	
	//중복된 이메일로 회원가입 시도시 
	if(idCheck == 0) {
		if($('#id').val() == ''){
			$('#needMsg1').css("display", "inline-block");
		}
		returnVal = false;
	}
	
	//비밀번호, 비밀번호 확인 조건X
	if(pwCheck == 0) {
		if($('#pw').val() == ''){
			$('#pwCheckMsg3').hide();
			$('#needMsg2').css("display", "inline-block");
		}
		returnVal = false;
	}
	
	//휴대폰번호 미입력시
	if(phoneCheck == 0) {
		$('#needMsg3').css("display", "inline-block");
	}
	
	//중복된 닉네임으로 회원가입 시도시
	if(nickCheck == 0) {
		$('#needMsg4').css("display", "inline-block");
		returnVal = false;
	}
	
	//이용약관 체크 여부
	if(!$('#ckBox').is(':checked')){
		$('#needMsg5').css("display", "inline-block");
		returnVal = false;
	} else {
		$('#needMsg5').hide();
	}
	return returnVal;
}
</script>

<!-- Your custom override -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->
<!-- <link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" rel="stylesheet"> -->
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"> -->
<link href="<c:url value='/resources/theme/assets/css/custom-style.min.css' />" rel="stylesheet">
	
	<!-- ======== @Region: #content ======== -->
	<div id="content" style="font-family: 'Noto Sans KR', sans-serif !important;">
		<div class="container">
			<!-- Sign Up form -->
			<div class="row">
				<div class="offset-md-2 col-lg-5 col-md-7 offset-lg-4 offset-md-3">
					<div class="panel border bg-white">
						
							<div class="panel-heading">
								<h4 class="pt-3 font-weight-bold">HF-Campus</h4>
								<br> <span class="pt-3 font-weight-bold">당신의 미래를 위한,</span><br>
								<span class="font-weight-bold">한걸음</span>
							</div>
							<!--         <h3 class="title-divider"> -->
							<!--           <span>Sign Up</span> -->
							<!--           <small class="mt-4">Already signed up? <a href="login.html">Login here</a>.</small> -->
							<!--         </h3> -->
							<br>
							<form class="form-login form-medium py-3 px-4" role="form" method="post" action="signUp" onsubmit="return checkForm();">
							
							<h5>이메일</h5>
							<div class="form-group form-control mb-0">
								<label class="sr-only" for="id">이메일</label> <input type="email" class="customInput"
									id="id" name="id" maxlength="50" placeholder="hello@humanf.com">
							</div>
							<span class="error_next_box text-danger" id="needMsg1" aria-live="assertive">필수 정보입니다.</span>
							<span class="error_next_box text-danger" id="idMsg" aria-live="assertive">이메일 형식에 맞게 입력해주세요.</span>
							<span class="error_next_box text-danger" id="idCheckMsg1" aria-live="assertive">중복된 이메일이에요!</span>
							<span class="error_next_box text-success" id="idCheckMsg2" aria-live="assertive">멋진 이메일이에요!</span>
							<h5 class="mt-4">비밀번호</h5>
							<div class="form-group form-control mb-0">
								<label class="sr-only" for="signup-password-page">비밀번호</label> <input type="password" class="customInput" id="pw" name="pw">
							</div>
<!-- 							<span class="placeholder_box text-success" id="pwCheckMsg3" aria-live="assertive">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</span> -->
							<span class="error_next_box text-danger" id="needMsg2" aria-live="assertive">필수 정보입니다.</span>
							<span class="error_next_box text-danger" id="pwCheckMsg1" aria-live="assertive">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요!</span>
							<span class="error_next_box text-success" id="pwCheckMsg2" aria-live="assertive">멋진 비밀번호네요!</span>
							<h5 class="mt-4">비밀번호 확인</h5>
							<div class="form-group form-control mb-0">
								<label class="sr-only" for="signup-password-page">비밀번호 확인</label>
								<input type="password" class="customInput"
									id="pw2" name="pw2" placeholder="">
							</div>
							<span class="error_next_box text-danger" id="pw2CheckMsg1" aria-live="assertive">비밀번호가 일치하지 않습니다.</span>
							<span class="error_next_box text-success" id="pw2CheckMsg2" aria-live="assertive">비밀번호가 일치합니다!</span>
							<h5 class="mt-4">닉네임</h5>
							<div class="form-group form-control mb-0">
								<label class="sr-only" for="signup-nickname-page">닉네임
									</label> <input type="text" class="customInput"
									id="nickName" name="nickName" maxlength="25" placeholder="">
							</div>
							<span class="error_next_box text-danger" id="needMsg4" aria-live="assertive">필수 정보입니다.</span>
							<span class="error_next_box text-danger" id="nickMsg" aria-live="assertive">2~10자의 한글, 영문 대 소문자, 숫자만 사용 가능합니다.</span>
							<span class="error_next_box text-danger" id="nickCheckMsg1" aria-live="assertive">중복된 닉네임이에요!</span>
							<span class="error_next_box text-success" id="nickCheckMsg2" aria-live="assertive">멋진 닉네임이에요!</span>
							<h5 class="mt-4">휴대폰 번호<span class="phoneTag" style="color:#8e8e8e; font-size: 15px">(-제외하고 입력해주세요)</span></h5>
							<div class="form-group form-control mb-0">
								<label class="sr-only" for="signup-phone-page">휴대폰 번호</label>
								<input type="text" class="customInput"
									id="phone" name="phone" placeholder="01012345678">
							</div>
							<span class="error_next_box text-danger" id="needMsg3" aria-live="assertive">필수 정보입니다.</span>
							<span class="error_next_box text-danger" id="phoneCheckMsg1" aria-live="assertive">휴대폰 번호 형식이 올바르지 않아요!</span>
							<h5 class="mt-4">소속</h5>
							<div class="form-group">
								<select class="form-control" name="typeCode">
									<option value="01">일반</option>
									<option value="02">기업</option>
									<option value="03">기타</option>
								</select>
							</div>
							<hr/>
							<div class="form-check">
								<label class="form-check-label"> <input type="checkbox"
									value="term" class="form-check-input" id="ckBox"> 이용약관에 동의합니다.
								</label>
							</div>
							<span class="error_next_box text-danger" id="needMsg5" aria-live="assertive">이용약관에 동의가 필요합니다.</span>
							<br>
							<input type="submit" id="signUpBtn" class="btn btn-primary btn-block my-3 signupBtn" value="가입하기">
<!-- 							<button class="btn btn-primary" type="submit">가입하기</button> -->
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>