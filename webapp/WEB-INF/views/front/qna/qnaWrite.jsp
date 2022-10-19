<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<body class="page page-shop header-compact-sticky page-shop-grid navbar-layout-navbar-below" style="font-family: 'Noto Sans KR', sans-serif !important;">

<style>
	.form-fileName{
		width : 60%;
	}
</style>
<script type="text/javascript">
	$(function() {
		 $("#imageFile").change(function(e){
				var fileName = $("#imageFile")[0].files[0].name;
				$("#fileName").value = fileName;
				$("#fileName").val(fileName);
				$("#fileName").attr("disabled", true); 
		});
	});
	
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
           <h4><a href="<c:url value="./webQnaList"/>"><i class="fas fa-angle-left"></i> 1:1 문의</a></h4>
          </h2>
          <div class="row row-table">
           <form:form id="regForm"  modelAttribute="questionVO" onsubmit="return submit_comment()"  enctype="multipart/form-data">
	          <table class="table mb-0">
	          <colgroup>
					<col style="width:20%" align="center" >
					<col style="width:80%">
				</colgroup>
				<tbody>
					<tr>
						<td>
							<label for="example-text-input" class="col-sm-15  col-form-label">제목</label>
						</td>
						<td>
							<form:input path="title" class="form-control" type="text" id="title" name="title"/>
						</td>
					</tr>
					<tr>
						<td>
							<label for="example-text-input" class="col-sm-15 col-form-label">첨부파일</label>
						</td>
						<td style="vertical-align:middle;">
							<form:input path="fileName" class="form-control form-fileName" style="float:left" type="text" id="fileName" name="fileName"/>
 							<input type="file" name="file" id="imageFile" style="display:none; ">
<!--  							<input type="file" name="file" id="imageFile" accept="image/*" style="display:none; "> -->
							<button type="button" class="mb-2 btn btn-outline-teal" style="float:left; vertical-align:middle;" onclick="$('#imageFile').trigger('click')">첨부파일</button>
							<!-- <input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp"> -->
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
					<%-- <tr>
						<td>
							<input type='checkbox' name='secret' value='secret' />  비밀글 <br>
						</td>
						<td>비밀번호 <form:input path="password" type="password" id="password" name="password"/> </td>
					</tr> --%>
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