<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>


<script type="text/javascript">
<c:if test="${not empty write_alert_message}">
	//parent.opener.location.reload(true);
	alert('${write_alert_message}');
</c:if>
</script>


<script type="text/javascript">
/* 	$(function(){
		/* if($("input:checkbox[id='topYNCheck']").is(":checked") == true){ 
		if($("#topYNCheck").is(":checked")== true){  
			console.log("checked!");
			alert("checked!");
			
		}
	}); */
	

	function checkForm(){
		var title = $("#title").val();
		var type = $("#type").val();
		var contents = $("#contents").val();
		
		if(title.trim() == "" ){
			alert("제목을 입력하세요.");
			return false;
		}else if(type.trim() == ""){
			alert("카테고리를 선택하세요.");
			return false;
		}else if(contents.trim() == ""){
			alert("내용을 입력하세요.");
			return false;
		}else{
			return true;
		}
		
	}

</script>

<style type="text/css">

	.form-control_readonly {
	  background-color: #ffffff;
	  opacity: 1;
	}
	
	
	.form-control[readonly],
	fieldset[readonly] .form-control {
	  background-color: #ffffff;
	  opacity: 1;
	}
</style>

<div class="main-content">
	<div class="page-content">
		<div class="widget-box"> 
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					공지사항 ${noticeVO.seq !=0 ? "수정" : "등록"}
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form:form id="regForm" modelAttribute="faqVO" class="form-horizontal" onsubmit="return checkForm();">
					<form:hidden path="seq" />
					<div class="form-group">
						<label class="control-label col-xs-5">제목</label>
						<div class="col-xs-20">
							<form:input type="text" path="title" id="title" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="title" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">카테고리</label>
						<div class="col-xs-20">
							<form:select path="type" id="type" cssClass="form-control" cssErrorClass="form-control input-validation-error">
								<form:option value="">-</form:option>
								<form:option value="컨텐츠">컨텐츠</form:option>
								<form:option value="커뮤니티">커뮤니티</form:option>
								<form:option value="계정">계정</form:option>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">내용</label>
						<div class="col-xs-20">
							<form:textarea path="contents" id="contents" cols="100" rows="10" class="form-control" cssErrorClass="form-control input-validation-error" style="resize: none;"/>
							<form:errors path="contents" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<c:if test="${faqVO.seq !=0 }">
					<div class="form-group">
						<label class="control-label col-xs-5">작성자</label>
						<div class="col-xs-20">
							<form:input path="managerName" readonly="true" cssClass="form-control" cssErrorClass="form-control input-validation-error" style="background-color:white" />
							<form:errors path="managerName" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					</c:if>
					<c:if test="${faqVO.seq !=0 }">
					<div class="form-group">
						<label class="control-label col-xs-5">등록일</label>
						<div class="col-xs-20">
							<form:input path="regDate" readonly="true" cssClass="form-control" cssErrorClass="form-control input-validation-error" style="background-color:white" />
							<form:errors path="regDate" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					</c:if>
					<%-- <c:if test="${faqVO.modDate ne null}">
					<div class="form-group">
						<label class="control-label col-xs-5">수정일</label>
						<div class="col-xs-20">
							<form:input path="modDate" readonly="true" cssClass="form-control" cssErrorClass="form-control input-validation-error" style="background-color:white" />
							<form:errors path="modDate" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					</c:if> --%>
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
