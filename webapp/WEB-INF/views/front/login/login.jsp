<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- 카카오 로그인 -->
<script type="text/javascript">

    function loginWithKakao() {
    	Kakao.init('83d03171429b0e47f31f2629036a69c5');
    	Kakao.isInitialized();
    		// 카카오 로그인 서비스 실행하기 및 사용자 정보 가져오기
            Kakao.Auth.login({ 
    			success:function(auth) {
    				Kakao.API.request({
    					url: '/v2/user/me',
    					success: function(response) {
    						//사용자 정보를 가져와서 폼에 추가
    						var account = response.kakao_account;
    						
    						$('#form-kakao-login input[name=id]').val(account.email);
    						$('#form-kakao-login input[name=nickName]').val(account.profile.nickname);
    						$('#form-kakao-login input[name=iconFile]').val(account.profile.img);
    						// 사용자 정보가 포함된 폼을 서버로 제출한다.
    						Kakao.Auth.setAccessToken(auth.access_token); //access_token값 저장
    						document.querySelector('#form-kakao-login').submit();
    					},
    					fail: function(error) {
    						//경고창에 에러메세지 표시
//     						$('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
    					}
    				}); //api request
    			}, //success 결과
    			fail:function(error) {
    				// 경고창에 에러메시지 표시
//     				$('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
    			}
            }); //로그인 인증
        } 
    
</script>

<script type="text/javascript">

$(function(){
	var regEmail=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	  // 눈표시 클릭 시 패스워드 보이기
	  $('.input-field i').on('click',function(){
	    $('#pw').toggleClass('active');

	    if($('#pw').hasClass('active')){
	    	$(this).attr('class',"fa fa-eye-slash fa-lg")
	    	.prev('#pw').attr('type',"text");
	    }
	    else{
	    	 $(this).attr('class',"fa fa-eye fa-lg")
	         .prev('#pw').attr('type','password');
	    }
	});
	  
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

function checkForm() {
	var loginCheck=0; 
	var id = $("#id").val();
	var pw = $("#pw").val();
	$.ajax({
		async: false,
       	type : 'GET',
       	data : {id:id, pw:pw},
       	url : './loginCheck',
       	success : function(data) {
           	if (data > 0) {
           		loginCheck = 1;
               	return true;
           	} else {
           		Swal.fire({
                    icon: 'fail',                         
                    text: '로그인에 실패하였습니다.',  
                });
           		loginCheck = 0;
           		return false;
           	}
       	},
       	error : function(request, error) { 
       		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       	}
	});
	if(loginCheck == 0) {
		return false;
	} else {
		return true;
	}
	return true;
}
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
                <div class="panel-body p-3">
                    <form:form action="./login" modelAttribute="userCodeVO" method="POST" onsubmit="return checkForm();" enctype="multipart/form-data">
                        <div class="form-group py-2">
                            <div class="input-field"> 
                            	<span class="far fa-user p-2"></span>
                            	<input type="email" class="customInput" id="id" name="id" minlength="5" maxlength="50" placeholder="이메일" required>
                            </div>
                        </div>
                        <div>
                        	<span class="error_next_box" id="idMsg" aria-live="assertive">이메일 형식에 맞게 입력해주세요.</span>
                        </div>
                        <div class="form-group py-1">
                            <div class="input-field"> 
                            	<span class="fas fa-lock px-2"></span> 
                            	<input type="password" class="customInput" id="pw" name="pw" placeholder="비밀번호" required>
                            	<i class="fa fa-eye fa-lg"></i>
                            </div>
                        </div>
                        <div class="form-inline pb-3"> 
<!--                         <input type="checkbox" name="remember" id="remember"> <label for="remember" class="text-muted">자동 로그인</label>  -->
                        <a href="<c:url value='/account/findPW'/>" id="forgot" class="font-weight-bold">비밀번호 찾기</a> </div>
                        <input type="hidden" name="referer" value="<%=request.getHeader("Referer")%>">
                        <input type="submit" id="loginBtn" class="btn btn-primary btn-block mt-2 loginBtn"  value="로그인">
                        <div class="text-center pt-2 pb-3 text-muted">아직 회원이 아니신가요? <a href="./signUp">회원가입</a> </div>
                    </form:form>
                </div>
                <div class="mx-3 my-2 py-2 bordert">
<!--                     <div class="text-center py-3"> <a href="https://wwww.facebook.com" target="_blank" class="px-2"> <img src="https://www.dpreview.com/files/p/articles/4698742202/facebook.jpeg" alt=""> </a> <a href="https://www.google.com" target="_blank" class="px-2"> <img src="https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png" alt=""> </a> <a href="https://www.github.com" target="_blank" class="px-2"> <img src="https://www.freepnglogos.com/uploads/512x512-logo-png/512x512-logo-github-icon-35.png" alt=""> </a> </div> -->
						<div class="text-center py-3">  
							 <img src="<c:url value='/resources/images/kakao_login_medium_narrow.png'/>" alt="" style="all:unset; cursor:pointer;" onclick="loginWithKakao()">
						</div>
                </div>
                <form id="form-kakao-login" method="post" action="kakao_callback">
		    			<input type="hidden" name="id"/>
		    			<input type="hidden" name="nickName"/>
		    			<input type="hidden" name="iconFile"/>
		    			<input type="hidden" name="referer" value="<%=request.getHeader("Referer")%>"/>
		    	</form>
            </div>
        </div>
    </div>
</div>
</div>
