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

function updateUser(seq) {
	var url = "<c:url value='/admin/userWrite?seq="+seq+"'/>";
	var winpop = window.open(url, "_view_pop", "resizable=yes,scrollbars=yes,width=1100,height=750");
	winpop.focus(); 
}

function goDelete(id){
	if(confirm("해당 사용자를 삭제하시겠습니까?")){
		$.post("./userDelete", 
				{ id: id },
				function(data, status) {
					if(status == 'success') {
						location.href = "<c:url value='/admin/userList'/>";
						alert('삭제되었습니다.');
					}
				}
			);
	}
}

function goList() {
	var url = "./userList";
	location.href= url;
}
 
 
// function 비밀번호수정_팝업() {
// 	$('#frm비밀번호').each(function() { this.reset(); });
// 	$('#비밀번호변경_modal').modal({animate:false});
// }

// function 비밀번호변경_처리(frm) {
// 	//$("#frm_print input[name=img_angle]:checked").val()

// 	//var org_passwd = $("#frm비밀번호 input[name=org_passwd]").val();
// 	var passwd_1 = $("#frm비밀번호 input[name=passwd_1]").val();
// 	var passwd_2 = $("#frm비밀번호 input[name=passwd_2]").val();

// 	if ( $.trim(passwd_1) == "" ) {
// 		alert("비밀번호를 입력해주십시오");
// 		return;
// 	}
// 	if ( passwd_1 != passwd_2 ) {
// 		alert("비밀번호 를 재입력해주십시오");
// 		return;
// 	}
// 	var url = "<c:url value='/admin/modifyPasswd' />";
// 	var frmdata = {"passwd_1": passwd_1, "passwd_2": passwd_2 };
// 	blockBox( $("#frm비밀번호") );
// 	$.ajax({
// 		url: url,
// 		method: "POST",
// 		data: frmdata 
// 	}).done(function( data ) {
// 		if ( data.success ) {
// 			alert("처리 되었습니다.");
			
// 		} else {
// 			alert( data.message );
// 		}
// 		$('#비밀번호변경_modal').modal('hide');
// 	}).fail(function( oo ) {
// 		alert( "error:" + oo.message );
// 	}).always(function() {
// 		unblockBox( $("#frm비밀번호") );
// 	});
// }

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
			<li class="active">사용자 관리</li>
			<li class="active">사용자 상세정보</li>
		</ul>
	</div>

	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					<span>사용자 상세정보 </span>
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<div class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-xs-10">등록번호</label>
						<div class="col-xs-20">
							<input type="text" Class="form-control" value="${userVO.seq}" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">ID</label>
						<div class="col-xs-20">
							<input type="text" Class="form-control" value="${userVO.id}" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">닉네임</label>
						<div class="col-xs-20">
							<input type="text" Class="form-control" value="${userVO.nickName}" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">소개</label>
						<div class="col-xs-20">
							<input type="text" Class="form-control" value="${userVO.description}" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">종류코드</label>
						<div class="col-xs-20">
							<input type="text" Class="form-control" value="${userVO.typeCode}" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">소속</label>
						<div class="col-xs-20">
							<input type="text" Class="form-control" value="${userVO.assign}" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">휴대폰번호</label>
						<div class="col-xs-20">
							<input type="text" Class="form-control" value="${userVO.phone}" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">가입일자</label>
						<div class="col-xs-20">
							<input type="text" Class="form-control" value="${userVO.joinDate}" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">탈퇴일자</label>
						<div class="col-xs-20">
							<input type="text" Class="form-control" value="${userVO.quitDate}" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">대표아이콘 파일명</label>
						<div class="col-xs-20">
							<input type="text" Class="form-control" value="${userVO.iconFile}" readonly/>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-10">휴면여부</label>
						<div class="col-xs-20">
							<input type="text" Class="form-control" value="${userVO.isUse}" readonly/>
						</div>
					</div>
																			
					<div class="form-group">
						<div class="col-xs-offset-50" style="float: right">
							<button type="submit" class="btn btn-success btn-sm" onclick="updateUser('${userVO.seq}')">수정</button>
							<a href="javascript:goDelete('${userVO.id}')" class="btn btn-success btn-sm">삭제</a>
							<button class="btn btn-success btn-sm" onclick="goList()">목록</button>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
 
	</div><!-- page-content -->
</div><!-- main-content-inner -->