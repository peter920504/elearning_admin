<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<script type="text/javascript">
$(function(){
	
	var regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
	var pwRegCheck = 0;
	var pwRegCheck2 = 0;
	$("#pwChange").keyup(function() {
		var pwChange = $("#pwChange").val();
		var pwChangeCheck = $("#pwChangeCheck").val();
		if(!regPw.test(pwChange)){
			$("#saveBtn").attr("disabled", true);	
			$("#pwCheckMsg2").hide();
			$("#pwCheckMsg1").css("display", "inline-block");
			pwRegCheck = 0;
		} else if(regPw.test(pwChange) && pwChange != pwChangeCheck && pwChangeCheck != ''){
			$("#saveBtn").attr("disabled", true);	
			$("#pwCheckMsg1").hide();
			$("#pwCheckMsg2").css("display", "inline-block");
	    	pwRegCheck = 0;
		} else if(pwRegCheck == 1 && pwRegCheck2 == 1){
			$("#saveBtn").attr("disabled", false);	
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
			$("#saveBtn").attr("disabled", true);	
			$("#pwCheckMsg2").hide();
			$("#pwCheckMsg1").css("display", "inline-block");
			pwRegCheck2 = 0;
		} else if(regPw.test(pwChangeCheck) && pwChange != pwChangeCheck && pwChange != ''){
			$("#saveBtn").attr("disabled", true);	
			$("#pwCheckMsg1").hide();
			$("#pwCheckMsg2").css("display", "inline-block");
	    	pwRegCheck2 = 0;
		} else if(pwRegCheck == 1 && pwRegCheck2 == 1){
			$("#saveBtn").attr("disabled", false);	
		} else {
			$("#pwCheckMsg1").hide();	
			$("#pwCheckMsg2").hide();
			pwRegCheck2 = 1;
		}
	});
});
</script>

<style>
.swal2-content {
  font-family: 'Noto Sans KR', sans-serif !important;
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

<!-- Your custom override -->
<link href="<c:url value='/resources/theme/assets/css/custom-style.min.css' />" rel="stylesheet">

<!-- ======== @Region: #content ======== -->
<div id="content" class="py-3 py-lg-6" style="font-family: 'Noto Sans KR', sans-serif !important;">
<div class="container">
    <div class="row">
        <div class="offset-md-2 col-lg-5 col-md-7 offset-lg-4 offset-md-3">
            <div class="panel border bg-white">
                <div class="panel-heading">
                    <h4 class="pt-3 font-weight-bold">HF-Campus</h4>
                    <br>
                    <span class="pt-3 font-weight-bold">당신의 미래를 위한,</span><br>
                    <span class="font-weight-bold">첫 걸음</span>
                </div>
                <div class="panel-heading">
                	 <span class="font-weight-bold">새로운 비밀번호를 입력해주세요.</span><br>
                </div>
                <div class="panel-body p-3">
                    <form:form action="./findPW4" method="POST" onsubmit="return checkForm();" enctype="multipart/form-data">
                        <div class="form-group py-2">
                            <div class="input-field"> 
                            	<span class="far fa-user p-2"></span>
                            	<input type="password" class="customInput" id="pwChange" name="pw" placeholder="새 비밀번호" size= 50 required>
                            </div>
                            <br>
                            <div class="input-field">
                            	<span class="far fa-user p-2"></span>
                            	<input type="password" id="pwChangeCheck" class="customInput" value="" placeholder="새 비밀번호 확인" size=50 required>
                            </div>
                            <span class="error_next_box" id="pwCheckMsg1" aria-live="assertive">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요!</span>
							<span class="error_next_box" id="pwCheckMsg2" aria-live="assertive">비밀번호가 일치하지 않습니다.</span>
                        </div>
                        <input type="submit" id="saveBtn" class="btn btn-primary btn-block mt-2 loginBtn"  value="변경하기" disabled>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
