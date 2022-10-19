<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">

$(document).ready(function() {
// 	$("#pageUnit").val("${searchVO.pageUnit}");
	//$('.page-content')
	//	.on('change', '.접속권한', function( evt ) {
	//		권한_변경_처리( this );
	//	})

});	

function goListAll(btn) {
    $(btn.form).find(":input[name='q']").val("");
    $(btn.form).find(":input[name='qw']").val("");
    $(btn.form).submit();
}

function formSubmit(frm) {
	
	
	return true;
}

 
function 비밀번호수정_팝업() {
	$('#frm비밀번호').each(function() { this.reset(); });
	$('#비밀번호변경_modal').modal({animate:false});
}

function 비밀번호변경_처리(frm) {
	//$("#frm_print input[name=img_angle]:checked").val()

	//var org_passwd = $("#frm비밀번호 input[name=org_passwd]").val();
	var passwd_1 = $("#frm비밀번호 input[name=passwd_1]").val();
	var passwd_2 = $("#frm비밀번호 input[name=passwd_2]").val();

	if ( $.trim(passwd_1) == "" ) {
		alert("비밀번호를 입력해주십시오");
		return;
	}
	if ( passwd_1 != passwd_2 ) {
		alert("비밀번호 를 재입력해주십시오");
		return;
	}
	var url = "<c:url value='/admin/modifyPasswd' />";
	var frmdata = {"passwd_1": passwd_1, "passwd_2": passwd_2 };
	blockBox( $("#frm비밀번호") );
	$.ajax({
		url: url,
		method: "POST",
		data: frmdata 
	}).done(function( data ) {
		if ( data.success ) {
			alert("처리 되었습니다.");
			
		} else {
			alert( data.message );
		}
		$('#비밀번호변경_modal').modal('hide');
	}).fail(function( oo ) {
		alert( "error:" + oo.message );
	}).always(function() {
		unblockBox( $("#frm비밀번호") );
	});
}

</script>

<div class="main-content-inner">

	<div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
		<script type="text/javascript">
			try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
		</script>

		<ul class="breadcrumb">
			<li>
				<i class="ace-icon fa fa-home home-icon"></i>
				<a href="<c:url value='/admin' />">Home</a>
			</li>
			<li class="active">사용자정보</li>
			<li class="active">나의정보</li>
		</ul>
	</div>

	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					<span>나의 정보 </span>
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form:form modelAttribute="userVO" class="form-horizontal" method="post" action="myinfo" onsubmit="return formSubmit(this);" >
					<input type="hidden" name="mode" value="${mode}" />
					<form:input path="ID" type="hidden" />
					<form:input path="PASSWORD" type="hidden" />
					<form:input path="DEPARTMENT" type="hidden" />
		
					<div class="form-group">
						<label class="control-label col-xs-10">(*)아이디</label>
						<div class="col-xs-20">
							<form:input path="ID" cssClass="form-control" placeholder="사용자ID" cssErrorClass="form-control input-validation-error" readonly="true" />
							<form:errors path="ID" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">(*)이름</label>
						<div class="col-xs-20">
							<form:input path="NAME" cssClass="form-control" placeholder="사용자이름" cssErrorClass="form-control input-validation-error" />
							<form:errors path="NAME" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">(*)비밀번호</label>
						<div class="col-xs-20">
							<button type="button" onclick="비밀번호수정_팝업();" class="btn btn-primary btn-sm">비밀번호변경</button>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">부서</label>
						<div class="col-xs-20">
							<form:input path="DEPARTMENT" cssClass="form-control" placeholder="부서" cssErrorClass="form-control input-validation-error" readonly="true" />
							<form:errors path="DEPARTMENT" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">연락처</label>
						<div class="col-xs-20">
							<form:input path="PHONE" cssClass="form-control" placeholder="연락처" cssErrorClass="form-control input-validation-error" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">(*)접속권한</label>
						<div class="col-xs-20">
							<form:select path="TYPE_NAME" cssClass="form-control" cssErrorClass="form-control input-validation-error" readonly="true" onFocus="this.initialSelect = this.selectedIndex;"  onChange="this.selectedIndex = this.initialSelect;">
								<form:option value="">[접속권한]</form:option>
								<form:option value="ROLE_시스템관리자">시스템관리자</form:option>
								<form:option value="ROLE_일반관리자">일반관리자</form:option>
								<form:option value="ROLE_게시판관리자">게시판관리자</form:option>
								<form:option value="ROLE_대출관리자">대출관리자</form:option>
								<form:option value="ROLE_일반사용자">일반사용자</form:option>
							</form:select>
							<form:errors path="TYPE_NAME" cssClass="field-validation-error" element="div" />
						</div>
					</div>
<%-- 					<c:if test="${mode=='modify'}"> --%>
<!-- 					<div class="form-group"> -->
<!-- 						<label class="control-label col-xs-10">등록일</label> -->
<!-- 						<div class="col-xs-20"> -->
<%-- 							<form:input path="등록일" cssClass="form-control" placeholder="등록일" cssErrorClass="form-control input-validation-error" readonly='true' /> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="form-group"> -->
<!-- 						<label class="control-label col-xs-10">최종수정일</label> -->
<!-- 						<div class="col-xs-20"> -->
<%-- 							<form:input path="수정일" cssClass="form-control" placeholder="수정일" cssErrorClass="form-control input-validation-error" readonly='true' /> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 					</c:if> --%>
					<form:errors path="" cssClass="alert alert-danger" element="div"  />
					
					<c:if test="${not empty write_ok_message}">
						<div class="alert alert-success">
							${write_ok_message}
						</div>
					</c:if>

					<div class="form-group">
						<div class="col-xs-offset-50">
							<button type="submit" class="btn btn-success btn-sm" onclick=";">저장</button>
							<button type="reset" class="btn btn-success btn-sm" onclick=";">취소</button>
						</div>
					</div>
				</form:form>
				</div>
			</div>
		</div>
 
	</div><!-- page-content -->
</div><!-- main-content-inner -->

<!-- {{{ 비밀번호변경_modal -->
<div class="modal" id="비밀번호변경_modal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog"> 
		<div class="modal-content">
			<form name="frm비밀번호" id="frm비밀번호" role="form" method="post" action="" onsubmit="비밀번호변경_처리(this); return false; ">
			<input type="hidden" name="pageUnit" value="10">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="boardqnaModalLabel">비밀번호 변경 팝업창</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<label class="control-label col-xs-30">신규 비밀번호</label>
					<div class="col-xs-40">
					     <input type="password" name="passwd_1" class="form-control input-xs" placeholder="신규 비밀번호">
					</div>
					<div class="col-xs-30">
					     
					</div>
				</div>
				<div class="row">
					<label class="control-label col-xs-30">신규 비밀번호 재입력</label>
					<div class="col-xs-40">
					     <input type="password" name="passwd_2" class="form-control input-xs" placeholder="신규 비밀번호 재입력">
					</div>
					<div class="col-xs-30">
					     
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-sm btn-primary" >등록</button>
				<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">닫기</button>
			</div>
			</form>
		</div>
	</div>
</div>
<!-- }}}  -->
