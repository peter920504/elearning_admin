<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<script type="text/javascript">

function checkForm() {
	var code = $("#code").val();
	var sessionCode ='<%=(Integer)session.getAttribute("sessionCode")%>';
	if(code == sessionCode) {
		codeCheck = 1;
        return true;
    } else {
 		Swal.fire({
          icon: 'fail',                         
          text: '인증코드를 다시 확인해주세요.',  
      	});
	    codeCheck = 0;
	    return false;
	}

	if(codeCheck == 0) {
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
                <div class="panel-heading">
                	 <span class="font-weight-bold">입력한 이메일을 통해</span><br>
                	 <span class="font-weight-bold">발급받은 인증번호를 입력해주세요.</span><br>
                </div>
                <div class="panel-body p-3">
                    <form:form action="./findPW3" method="POST" onsubmit="return checkForm();" enctype="multipart/form-data">
                        <div class="form-group py-2">
                            <div class="input-field"> 
                            	<span class="far fa-user p-2"></span>
                            	<input type="text" class="customInput" id="code" name="code" minlength="6" maxlength="6" placeholder="6자리 인증번호를 입력해주세요." required>
                            </div>
                        </div>
                        <input type="submit" id="findPWBtn" class="btn btn-primary btn-block mt-2 loginBtn"  value="인증하기">
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
