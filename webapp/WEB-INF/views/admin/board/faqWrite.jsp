<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
<c:if test="${not empty write_ok_message}">
	parent.opener.location.reload(true);
</c:if>
</script>
<script src="<c:url value='/resources/js/smartEditor/js/service/HuskyEZCreator.js'/>" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
window.onload = function() {
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "ir1",  //textarea ID
	    sSkinURI: "<c:url value='/resources/js/smartEditor/SmartEditor2Skin.html'/>",  //skin경로
	    fCreator: "createSEditor2"
	});
};
</script>
<script type="text/javascript">
$(document).ready(function() {
	$("#pageUnit").val("${searchVO.pageUnit}");
	$('.page-content')
		.on('click', '.데이터_삭제', function( evt ) {
			delFaq(evt.target.form);
		});	
	/* 
	var ans = $("#ir1").val();
	alert(ans); 
	*/
	$(document).on("click", ".btn-sm.닫기", function(e) {
		window.close();
	});
	
});	
function delFaq(frm) {
	if ( $.trim(frm.아이디.value) == "" )
		return;
	
	if ( !confirm("이 데이터를 삭제하시겠습니까?") )
		return;

	var url = "<c:url value='/admin/faq/delFaqId' />";
	var frmdata = {"id" : frm.아이디.value};
	blockBox( $(".widget-main") );
	$.ajax({
		url: url,
		method: "POST",
		data: frmdata 
	}).done(function( data ) {
		if ( data.success ) {
			alert("이 데이터를 삭제하였습니다.");
			document.location.replace("faqList");
		} else {
			alert( data.message );
		}
	}).fail(function( oo ) {
		alert( "error:" + oo.message );
	}).always(function() {
		unblockBox( $(".widget-main") );
	});
}
function formSubmit(frm) {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	
	var ir = $("#ir1").val();

	//ir = ir.replace(/(<([^>]+)>)/ig,"");
	
	$("#frm #ir1").val(ir);
	
	frm.submit();
	//return true;
}
</script>

<div class="main-content-inner">

	<div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
		<script type="text/javascript">
			try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){return;}
		</script>

		<ul class="breadcrumb">
			<li>
				<i class="ace-icon fa fa-home home-icon"></i>
				<a href="<c:url value='/' />">Home</a>
			</li>
			<li class="active">게시판관리</li>
			<li class="active">FAQ</li>
		</ul>
	</div>

	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					<span>FAQ ${mode=="modify"?"수정":"등록"}</span>
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<%-- <form:form name="frm" id="frm" modelAttribute="faqVO" class="form-horizontal" method="post" action="faqWrite" onsubmit="formSubmit(this); return false;" >         <!-- submitContents() --> --%>   
				<form:form name="frm" id="frm" modelAttribute="faqVO" class="form-horizontal" method="post" action="faqWrite" onsubmit="formSubmit(this)" >         <!-- submitContents() -->
					<input type="hidden" name="mode" id="mode" value="${mode}" />
					<form:hidden path="아이디" />
					<div class="form-group">
						<label class="control-label col-xs-8">(*)질문</label>
						<div class="col-xs-30">
							<form:input path="질문" cssClass="form-control" placeholder="질문" cssErrorClass="form-control input-validation-error" />
							<form:errors path="질문" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-xs-8">(*)답변</label>
						<div class="col-xs-30">
							<c:if test="${mode=='new'}">
								<form:textarea path="답변" id="ir1" cssClass="form-control" cssErrorClass="form-control input-validation-error" rows="15"/>
							</c:if>
							<c:if test="${mode=='modify'}">
								<form:textarea path="답변" id="ir1" value="${faqVO['답변']}" cssClass="form-control" cssErrorClass="form-control input-validation-error" rows="15"/>
							</c:if>
							
							<form:errors path="답변" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					
					<form:errors path="" cssClass="alert alert-danger" element="div"  />
					<c:if test="${not empty write_ok_message}">
						<div class="alert alert-success">
							${write_ok_message} <br>
						</div>
					</c:if>

					<div class="form-group center">
						<button type="submit" class="btn btn-primary btn-sm" style="margin-right:0px;"><i class="ace-icon glyphicon glyphicon-ok"></i>적용</button>
						<button type="button" class="btn btn-info btn-sm 닫기" ><i class="ace-icon glyphicon glyphicon-remove"></i>닫기</button>
						<c:if test="${mode=='modify'}">
						<button type="button" class="btn btn-success btn-sm 데이터_삭제" >삭제</button>
						</c:if>
					</div>
					
<!-- 					
					<div class="form-group center">
						<button type="submit" class="btn btn-primary btn-sm" style="margin-right:10px;"><i class="ace-icon glyphicon glyphicon-ok"></i>적용</button>
						<button type="button" class="btn btn-info btn-sm" onclick="window.close()"><i class="ace-icon glyphicon glyphicon-remove"></i>닫기</button>
					</div> -->	
				</form:form>
				</div>
			</div>
		</div>
 
	</div><!-- page-content -->
</div><!-- main-content-inner -->

