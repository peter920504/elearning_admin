<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<script type="text/javascript">

$(function(){
	var regEmail=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	  
	//이메일 형식 유효성
	$("#id").on('blur', function(){
		var id = $("#id").val();
		if(id != ''  && id != null) {
			if(!regEmail.test(id)) {
				$("#idMsg").show();
				regCheck = 0;
			} else {	
				$("#idMsg").hide();
				regCheck = 1;
			}
		}
	});	
	  
});

</script>

<style>
.swal2-content {
  font-family: 'Noto Sans KR', sans-serif !important;
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
                	 <span class="font-weight-bold">비밀번호를 잃어버리셨나요?</span><br>
                	 <span class="font-weight-bold">가입하신 이메일을 정확히 입력해 주세요.</span><br>
                	 <span class="font-weight-bold">이메일을 통해 인증번호가 전송됩니다.</span>
                </div>
                <div class="panel-body p-3">
                    <form:form action="./findPW2" modelAttribute="userVO" method="POST" onsubmit="return checkForm();" enctype="multipart/form-data">
                        <div class="form-group py-2">
                            <div class="input-field"> 
                            	<span class="far fa-user p-2"></span>
                            	<input type="email" class="customInput" id="id" name="id" minlength="5" maxlength="50" placeholder="가입한 이메일을 정확히 입력해 주세요.(소문자)" required>
                            </div>
                        </div>
                        <div>
                        	<span class="error_next_box" id="idMsg" aria-live="assertive">이메일 형식에 맞게 입력해주세요.</span>
                        </div>
                        <input type="submit" id="findPWBtn" class="btn btn-primary btn-block mt-2 loginBtn"  value="이메일 전송하기">
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
