<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
<c:if test="${not empty write_ok_message}">
	parent.opener.location.reload(true);
	alert('${write_ok_message}');
</c:if>
</script>

<script type="text/javascript">
	function checkForm(){
		var title = $("#title").val();
		var cate1 = $("#cate1").val();
		var description = $("#description").val();
		var summary = $("#summary").val();
		var author = $("#author").val();
		var classCount = $("#classCount").val();
		
		var cate1 = $("#cate1").val();
		var cate2 = $("#cate2").val();
		var cate3 = $("#cate3").val();
		
		if( document.getElementById("imageFile").files.length > 1) {
			alert("파일은 1개만 업로드할 수 있습니다.")			
			return false;
		}
		
		if(title == ""){
			alert("제목을 입력해주세요");
			$("#title").focus();
			return false;
		}else if(cate1 == "0" || cate1 == 0 || cate2 == "0" || cate2 == 0 || cate3 == "0" || cate3 == 0){
			alert("강의 분류를 선택해주세요")
			return false;
		}else if(author == ""){
			alert("저자/강사를 입력해주세요")
			$("#author").focus();
			return false;
		}else if(description == ""){
			alert("컨텐츠 소개를 입력해주세요");
			$("#description").focus();
			return false;
		}else if(summary == ""){
			alert("컨텐츠 요약을 입력해주세요")
			$("#summary").focus();
			return false;
		}else if(classCount == 0 || classCount == "") {
			alert("예정 강의수를 입력해주세요.")
			$("#classCount").focus();
			return false;
		}else {
			return true;
		}
	}

$(document).ready(function() {
	var seq = $("#seq").val();
	
	var cate1 = $("#cate1").val();
	var cate2 = $("#cate2").val();
	var cate3 = $("#cate3").val();
	
	if(seq != '0' || seq != 0) { //수정접근일 경우
		getSubCate2(cate1, 2)
		getSubCate3(cate2, 3)
	}
	
	if(cate1 == '0' || cate1 == 0) {
		var resetOption = '<option value="0">--선택--</option>'
		$("#cate2").empty();
		$("#cate2").html(resetOption);
	}
	
	if(cate2 == '0' || cate2 == 0) {
		var resetOption = '<option value="0">--선택--</option>'
		$("#cate3").empty();
		$("#cate3").html(resetOption);
	}
	
	$("#cate1").change(function() {
		var resetOption = '<option value="">--선택--</option>'
		$("#cate3").empty();
		$("#cate3").html(resetOption);
		
		var key = $("#cate1").val();
		var level = 2;
		getSubCate2(key, level);
	});
	
	$("#cate2").change(function() {
		var key = $("#cate2").val();
		var level = 3;
		getSubCate3(key, level);
	});
	
	
	
	//첨부파일 이름노출
	$("#imageFile").on("change", handleFileSelect);
	
	//날짜박스
	$("#dateS").val("${eduContentsVO.sdate}");
	$("#dateS").datepicker({dateFormat: 'yy-mm-dd'});
	
	//수정시 카테고리 기본 세팅
	
	//예상 강의수 문자입력 방지
	$("#classCount").on('keyup', function() {
		var reg = /^[0-9]+$/;
		var classCount = $(this).val();
		
		if(classCount.length != 0 && reg.test(classCount) == false) {
			alert("예상 강의 수에는 숫자만 입력할 수 있습니다.");
			$("#classCount").val("");
			$("#classCount").focus();
		}
		
	});
	
	
}); //document ready

function handleFileSelect(e) {
	var select_files = [];
	var files = $(this)[0].files;
	
	var files_array = document.getElementById("imageFile");
	console.log(files_array);
	
	if(document.getElementById("imageFile").files.length > 1) {
		alert('파일은 1개만 첨부하실 수 있습니다.')
		$("#imageFile").val("");
		return false;
	}
	
	$('input[id=file-name]').removeAttr('value');
	$('input[id=file-name]').attr('value',files[0].name);
	$('input[id=mediaDelYN]').removeAttr('value');
	$('input[id=mediaDelYN]').attr('value','Y');
}


function getSubCate2(key, level) {
	$.ajax({
		type : "GET",
		url : "../admin/getSubCateList",
		data : {
			key: key,
			level: level
		},
		dataType: 'json',
		success : function(data) {
			var html = "";
			var cate2 = $('#cate2').val();
			
			if(data.length == 0 || data.length == '0' || data[0].pSeq == 0) { 
				//조회한 카테고리 목록이 없는 경우
				html += '<option value="1">기타</option>';
				$("#cate2").empty();
				$("#cate2").html(html);
			}else {
				for(var i = 0; i<data.length; i++) {
					if(cate2 != null && cate2 != '' && cate2 == data[i].seq) {
						html += '<option value="'+data[i].seq+'" selected>' +data[i].title+'</option>';
					}else {
						html += '<option value="'+data[i].seq+'">' +data[i].title+'</option>';
					}
					$("#cate2").html(html);
				}
				html += '<option value="1">기타</option>';
				$("#cate2").html(html);
			}
			
			var cate2 = $('#cate2').val();
			getSubCate3(cate2, 3);
		}
	});
	
}

function getSubCate3(key, level) {
	$.ajax({
		type : "GET",
		url : "../admin/getSubCateList",
		data : {
			key: key,
			level: level
		},
		dataType: 'json',
		success : function(data) {
			var html = "";
			var cate3 = $('#cate3').val();
			
			if(data.length == 0 || data.length == '0' || data[0].pSeq == 0) {
				html += '<option value="1">기타</option>';
				$("#cate3").empty();
				$("#cate3").html(html);
			}else {
				for(var i = 0; i<data.length; i++) {
					if(cate3 != null && cate3 != '' && cate3 == data[i].seq) {
						html += '<option value="'+data[i].seq+'" selected>' +data[i].title+'</option>';
					}else {
						html += '<option value="'+data[i].seq+'">' +data[i].title+'</option>';
					}
					$("#cate3").html(html);
				}
				html += '<option value="1">기타</option>';
				$("#cate3").html(html);
			}
			
		}
	});
}

function mediaDel() {
	$('input[id=file-name]').removeAttr('value');
	$('input[id=mediaDelYN]').attr('value','Y');
	$('input[id=imageFile]').val("");
}

</script>

<style>
.file_input label input {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
}
</style>

<div class="main-content">
	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					컨텐츠 ${eduContentsVO.seq == 0 ? "등록" : "수정"}
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form:form id="regForm" modelAttribute="eduContentsVO" class="form-horizontal" onsubmit="return checkForm();" enctype="multipart/form-data">
					<form:hidden path="seq" />
					
					<div class="form-group">
						<label class="control-label col-xs-7">(*)제목</label>
						<div class="col-xs-20">
							<form:input path="title" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="title" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-7">(*)대분류</label>
						<div class="col-xs-20">
							<form:select path="cate1" cssClass="form-control" cssErrorClass="form-control input-validation-error">
							<%-- 
								<c:if test="${eduContentsVO.cate1 != null}">
									<form:option value="${eduContentsVO.cate1}" selected>${eduContentsVO.cate1Name}</form:option>
								</c:if>
							 --%>
								<c:if test="${eduContentsVO.seq == 0}">
									<form:option value="0">--선택--</form:option>
								</c:if>
								<c:forEach var="item" items="${categoryList}" varStatus="rowStatus">
									<c:if test="${item.level eq 1}">
										<form:option value="${item.seq}">${item.title}</form:option>
									</c:if>
								</c:forEach>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-7">(*)중분류</label>
						<div class="col-xs-20">
							<form:select path="cate2" cssClass="form-control" cssErrorClass="form-control input-validation-error">
								<c:if test="${eduContentsVO.cate2 != null}">
									<option value="${eduContentsVO.cate2}" selected>${eduContentsVO.cate2Name}</option>
								</c:if>
								<c:if test="${eduContentsVO.cate2 == null}">
									<form:option value="0">--선택--</form:option>
								</c:if>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-7">(*)소분류</label>
						<div class="col-xs-20">
							<form:select path="cate3" cssClass="form-control" cssErrorClass="form-control input-validation-error">
								<c:if test="${eduContentsVO.cate3 != null}">
									<option value="${eduContentsVO.cate3}" selected>${eduContentsVO.cate3Name}</option>
								</c:if>
								<c:if test="${eduContentsVO.cate3 == null}">
									<form:option value="0">--선택--</form:option>
								</c:if>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-7">(*)저자/강사</label>
						<div class="col-xs-20">
							<form:input path="author" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="author" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-7">(*)컨텐츠 소개</label>
						<div class="col-xs-20">
							<form:input path="description" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="description" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-7">(*)컨텐츠 요약</label>
						<div class="col-xs-20">
							<form:input path="summary" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="summary" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-7">시작일자</label>
						<div class="col-xs-20">
							<input type="text" name="dateS" id="dateS" size="20" readonly value="${eduContentsVO.sdate}" class="form-control" placeholder="YYYY-MM-DD">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-7">난이도</label>
						<div class="col-xs-20">
							<form:select path="difficulty" cssClass="form-control" cssErrorClass="form-control input-validation-error">
								<form:option value="고급">고급</form:option>
								<form:option value="중급">중급</form:option>
								<form:option value="초급">초급</form:option>
								<form:option value="입문">입문</form:option>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-7">서비스 종류</label>
						<div class="col-xs-20">
							<form:select path="serviceType" cssClass="form-control" cssErrorClass="form-control input-validation-error">
								<form:option value="유료">유료</form:option>
								<form:option value="무료">무료</form:option>
								<form:option value="부분무료">부분무료</form:option>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-7">(*)예정 강의수</label>
						<div class="col-xs-20">
							<form:input path="classCount" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							<form:errors path="classCount" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-7">수료증 여부</label>
						<div class="col-xs-20">
							<form:select path="isCertificate" cssClass="form-control" cssErrorClass="form-control input-validation-error">
								<form:option value="Y">Y</form:option>
								<form:option value="N">N</form:option>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-7">서비스 유무</label>
						<div class="col-xs-20">
							<form:select path="isService" cssClass="form-control" cssErrorClass="form-control input-validation-error">
								<form:option value="Y">Y</form:option>
								<form:option value="N">N</form:option>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<label class='control-label col-xs-7'>대표 이미지</label>
						<div class='col-xs-20'>
							<input type="text" class="form-control" id="file-name" value="${eduMediaName}" readonly />
						</div>
						<div class="file_input">
							<label class="btn btn-primary btn-sm">
								    	찾아보기
								<input type="file" name="file" multiple="multiple" class="custom-file-input" id="imageFile" lang="ko" accept="image/*"/>
								<input type="hidden" id="mediaDelYN" name="mediaDelYN" value="N"/>
							</label>
						<button type="button" class="btn btn-info btn-sm" onclick="mediaDel()"><i class="ace-icon glyphicon glyphicon-remove"></i>삭제</button>
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
				
	</div><!-- page-content -->
</div><!-- main-content -->
