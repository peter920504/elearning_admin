<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <body class="page page-shop header-compact-sticky page-shop-grid navbar-layout-navbar-below" style="font-family: 'Noto Sans KR', sans-serif !important;">
<style>
	.reportForm{
		/* justify-content: center; */
		display: flex;
	    justify-content: center;
	    align-content: center;
	}
	table{
		 margin: auto;
	}
</style>

<script type="text/javascript">
	<c:if test="${not empty write_alert_message}">
		alert('${write_alert_message}');
		location.href = "../";
	</c:if>
	
	function submit_check(){ 
		 var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		 var writer = $("#writer").val();
		 var email = $("#email").val();
		 var contents = $("#contents").val();

		 if(writer.trim() == ""){
	    	alert("작성자 이름을 입력하세요.");
	        return false;         
		 }else if(!reg_email.test(email)) {  
	    	alert("이메일 형식을 확인하세요.");
	        return false;         
	     }else if(contents.trim() == ""){
	    	alert("내용을 입력하세요.");
	        return false;         
	     }else {                       
	        return true;         
	     }
	}
</script>

 <div id="content">
   <div class="container">
      <div class="row">
        <!-- sidebar -->
        <div class="col-md-3">

          <!-- Sections Menu-->
          <div class="nav-section-menu">
            <div class="nav nav-list">
              <a href="<c:url value='/notice/webNoticeList'/>" class="nav-link first"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
               	공지사항</font></font>
                <i class="fa fa-angle-right"></i>
              </a>
              <a href="<c:url value='/qna/webQnaList'/>" class="nav-link"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                1:1문의</font></font>
                <i class="fa fa-angle-right"></i>
              </a>
              <a href="<c:url value='/faq/webFaqList'/>" class="nav-link"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                FAQ</font></font>
                <i class="fa fa-angle-right"></i>
              </a>
            </div>
          </div>
        </div>
		<!--main content-->
        <div class="col-md-9">
          <h2 class="title-divider">
           <h4><a href="#"><i class="fas fa-angle-left"></i> 오류신고</a></h4>
          </h2>
          <div class="row row-table reportForm">
           <form:form id="regForm"  modelAttribute="reportVO" onsubmit="return submit_check()">
	          <table class="table mb-0 ">
	          <colgroup>
					<col style="width:20%" align="center" >
					<col style="width:80%">
				</colgroup>
				<tbody>
					<tr>
						<td>
							<label for="example-text-input" class="col-sm-15 col-form-label">이름 </label>
						</td>
						<td>
							<form:input path="writer" class="form-control" type="text" id="writer" name="writer" />
						</td>
					</tr>
					<tr>
						<td>
							<label for="example-text-input" class="col-sm-15 col-form-label">이메일 </label>
						</td>
						<td>
							<form:input path="email" class="form-control" type="text" id="email" name="email" />
						</td>
					</tr>
					<tr>
						<td>
							<label for="example-text-input" class="col-sm-15 col-form-label">내용</label>
						</td>
						<td>
							<form:textarea path="contents" cols="100" rows="10" class="form-control" type="text" id="contents" name="contents" style="resize: none;"/>
						</td>
					</tr>
					<tr>
						<td colspan="2"><button type="submit" class="mb-2 btn btn-outline-teal" style="margin-right:20px; float:right;">등록</button></td>
					</tr>
				</tbody>
			</table>
			</form:form>
         </div> 
        </div>
      </div>
	</div>
</div>
</body>
