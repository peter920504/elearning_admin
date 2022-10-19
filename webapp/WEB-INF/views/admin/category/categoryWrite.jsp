<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
<c:if test="${not empty write_ok_message}">
	parent.opener.location.reload(true);
	alert('${write_ok_message}');
</c:if>
</script>


<script type="text/javascript">
$(document).ready(function(){
	
	$("#level").change(function(){
		var levelVal = $(this).val();
		
		if(levelVal == 2){
			$(".row").eq(1).css("display","none");
			openModal();
		}else if(levelVal == 3){
			$(".row").eq(1).css("display","block");
			openModal();
		}
		$("#pSeq").val('0');
		$("#cateP").empty();
		
		
	});
	
	$("#cate1").change(function(){
		var cate1Val = $(this).val();
		
		cateAjax(cate1Val, 1);
		
	});
	
})

function cateAjax(seq, level){
	
	var url = "./categoryAjax";
	
	$.ajax(url,{
 		method : "POST",
 		dataType : "json",
 		data : {
 			"seq" : seq,
 			"level" : level
 			},
 		success: function(data) {
 			var dataList = data.dataList;
 			
 			$("#cate2").empty();
//  			$("#cate2").append("<option></option>");
 			$("#cate2").append(dataList);
 			
 		}
	});
}


function openModal(){
	var cate1Val = $("#cate1").val();
	cateAjax(cate1Val, 1);
	$("#levelModal").modal({animate:false});
}

function cateChk(){
	
	var cateP = $("#cateP");
	
	cateP.empty();
	
	if($("#level").val() == 2){
		cateP.append($("#cate1 option:selected").text() + " > ");
		$("#pSeq").val($("#cate1").val());
	}else if ($("#level").val() == 3){
		cateP.append($("#cate1 option:selected").text() +" > "+ $("#cate2 option:selected").text());
		$("#pSeq").val($("#cate2").val());
	}
	
	$('#levelModal').modal('hide');
}

function chkForm(){
	var level = $("#level").val();
	var pSeq = $("#pSeq").val();
	var title = $("#title").val();
	
	if(level != 1 && pSeq == 0){
		alert('필수값 확인 (상위 카테고리)');
		return false;
	}
	if(title == '' || title == null){
		alert('필수값 확인 (카테고리명)');
		return false;
	}
}

</script>
<style type="text/css">
	.form-control_pwd {
	  display: block;
	  width: 30%;
	  height: 34px;
	  padding: 6px 12px;
	  font-size: 14px;
	  line-height: 1.42857143;
	  color: #555555;
	  background-color: #ffffff;
	  background-image: none;
	  border: 1px solid #cccccc;
	  border-radius: 4px;
	  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	  -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
	  -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	  transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	}
	
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
					카테고리 ${categoryVO.seq !=0 ? "수정" : "등록"}
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form:form id="regForm" modelAttribute="categoryVO" class="form-horizontal" onsubmit="return chkForm();">
					<form:hidden path="seq" />
					
					<div class="form-group">
						<label class="control-label col-xs-5">분류</label>
						<div class="col-xs-20">
							<c:choose>
								<c:when test="${categoryVO.seq !=0}">
									<input type="text" readonly="readonly" value="${categoryVO.level == 1 ? '대분류' : categoryVO.level == 2 ? '중분류' : '소분류' }">
								</c:when>
								<c:otherwise>
									<form:select path="level" cssClass="form-control" cssErrorClass="form-control input-validation-error">
										<form:option value="1">대분류</form:option>
										<form:option value="2">중분류</form:option>
										<form:option value="3">소분류</form:option>
									</form:select>
								</c:otherwise>
							</c:choose>
							<form:errors path="level" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5"></label>
						<div class="col-xs-20">
							<form:hidden path="pSeq"/>
							<p id="cateP">
								<c:if test="${categoryVO.level ==2}">
									${lv1.pTitle} >
								</c:if>
								<c:if test="${categoryVO.level ==3}">
									${lv1.pTitle} > ${lv2.pTitle}
								</c:if>
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">카테고리명(*)</label>
						<div class="col-xs-20">
							<form:input path="title" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="title" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-5">사용여부</label>
						<div class="col-xs-20">
							<form:radiobutton path="isUse" value="Y"/> <form:label path="isUse"> 사용 </form:label>
							<form:radiobutton path="isUse" value="N" checked="checked" /> <form:label path="isUse"> 미사용 </form:label>
							<form:errors path="isUse" cssClass="field-validation-error" element="div" />
						</div>
					</div>
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

<!-- 분류 선택 modal -->
<div class="modal" id="levelModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog"> 
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="boardqnaModalLabel">상위 카테고리 선택</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<label class="control-label col-xs-30">대분류</label>
					<div class="col-xs-40">
					     <select class="form-control" id="cate1">
					     	<c:forEach var="item" items="${cate1List}" varStatus="status">
						     	<option value="${item.seq}">${item.title}</option>
					     	</c:forEach>
					     </select>
					</div>
					<div class="col-xs-30">
					     
					</div>
				</div>
				<div class="row">
					<label class="control-label col-xs-30">중분류</label>
					<div class="col-xs-40">
					     <select class="form-control" id="cate2">
<!-- 					     	<option></option> -->
					     </select>
					</div>
					<div class="col-xs-30">
					     
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-sm btn-primary" onclick="cateChk()" >등록</button>
				<button type="button" class="btn btn-sm btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
