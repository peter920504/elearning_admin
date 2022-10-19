<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
<c:if test="${not empty write_ok_message}">
	parent.opener.location.reload(true);
</c:if>

function openErrorURL() {
    var url = $.trim($("#오류URL").val())
    if(url=='')
    	return;
    
    var winpop = window.open(url, "_blank");
    winpop.focus();
}
</script>

<div class="main-content">
	<div class="page-content">
	
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					열린마당 / 오류신고
					<c:choose>
					<c:when test="${mode=='new'}">등록</c:when>
					<c:when test="${mode=='modify'}">수정</c:when>
					<c:when test="${mode=='reply'}">답변</c:when>
					</c:choose> 
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form:form modelAttribute="boardVO" class="form-horizontal">
					<form:hidden path="오류신고번호" />
					<c:if test="${mode!='reply'}"><form:hidden path="처리상태" /></c:if>
					
				<c:if test="${mode!='reply'}">
					<div class="form-group">
						<label class="control-label col-xs-8">(*)오류유형</label>
						<div class="col-xs-40">
							<form:select path="오류유형" cssClass="form-control" cssErrorClass="form-control input-validation-error" disabled="${(mode=='reply')?'true':''}" >
								<form:option value="">[선택]</form:option>
								<form:options items="${sysCom_ErrRpt_ErrTypes}" itemValue="이름" itemLabel="이름" />
							</form:select>
							<form:errors path="오류유형" cssClass="field-validation-error" element="div" />
						</div>
					</div>
				</c:if>
				<c:if test="${mode=='reply'}">
					<div class="form-group">
						<label class="control-label col-xs-8">(*)아이템</label>
						<div class="col-xs-40">
							<form:input path="아이템명" cssClass="form-control" cssErrorClass="form-control input-validation-error" readonly="${(mode=='reply')?'true':''}" />
							<form:errors path="아이템명" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-8">(*)오류유형</label>
						<div class="col-xs-40">
							<form:input path="오류유형" cssClass="form-control" cssErrorClass="form-control input-validation-error" readonly="${(mode=='reply')?'true':''}" />
							<form:errors path="오류유형" cssClass="field-validation-error" element="div" />
						</div>
					</div>
				</c:if>
					<div class="form-group">
						<label class="control-label col-xs-8">(*)오류URL</label>
						<div class="col-xs-35">
							<form:input path="오류URL" cssClass="form-control" cssErrorClass="form-control input-validation-error" readonly="${(mode=='reply')?'true':''}" />
							<form:errors path="오류URL" cssClass="field-validation-error" element="div" />
						</div>
						<div class="col-xs-5">
							<a href="javascript:openErrorURL()" class="btn btn-success btn-xs">열기</a>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-8">(*)제목</label>
						<div class="col-xs-40">
							<form:input path="제목" cssClass="form-control" cssErrorClass="form-control input-validation-error" readonly="${(mode=='reply')?'true':''}" />
							<form:errors path="제목" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-8">(*)오류내용</label>
						<div class="col-xs-40">
							<form:textarea path="오류내용" cssClass="form-control" cssErrorClass="form-control input-validation-error" cssStyle="height:200px;" readonly="${(mode=='reply')?'true':''}" />
							<form:errors path="오류내용" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-8">신고일</label>
						<div class="col-xs-16">
							<form:input path="신고일" cssClass="form-control" cssErrorClass="form-control input-validation-error" readonly="true" />
							<form:errors path="신고일" cssClass="field-validation-error" element="div" />
						</div>
						<label class="control-label col-xs-8">등록IP</label>
						<div class="col-xs-16">
							<form:input path="신고자IP" cssClass="form-control" cssErrorClass="form-control input-validation-error" readonly="true" />
							<form:errors path="신고자IP" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-8">신고자이름</label>
						<div class="col-xs-16">
							<form:input path="신고자이름" cssClass="form-control" cssErrorClass="form-control input-validation-error" readonly="true" />
							<form:errors path="신고자이름" cssClass="field-validation-error" element="div" />
						</div>
						<label class="control-label col-xs-8">신고자이메일</label>
						<div class="col-xs-16">
							<form:input path="신고자이메일" cssClass="form-control" cssErrorClass="form-control input-validation-error" readonly="true" />
							<form:errors path="신고자이메일" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					
				<c:if test="${mode=='reply'}">
					<div class="form-group">
						<label class="control-label col-xs-8">처리상태(*)</label>
						<div class="col-xs-40">
							<form:select path="처리상태" cssClass="form-control" cssErrorClass="form-control input-validation-error" >
								<form:option value="N">미완료</form:option>
								<form:option value="Y">완료</form:option>
							</form:select>
							<form:errors path="처리상태" cssClass="field-validation-error" element="div" />
						</div>
					</div>					
					<div class="form-group">
						<label class="control-label col-xs-8">답변내용</label>
						<div class="col-xs-40">
							<form:textarea path="답변내용" cssClass="form-control" cssErrorClass="form-control input-validation-error" cssStyle="height:200px;" />
							<form:errors path="답변내용" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-8">처리일</label>
						<div class="col-xs-16">
							<form:input path="처리일" cssClass="form-control" cssErrorClass="form-control input-validation-error" readonly="true" />
							<form:errors path="처리일" cssClass="field-validation-error" element="div" />
						</div>
						<label class="control-label col-xs-8">등록IP</label>
						<div class="col-xs-16">
							<form:input path="답변자IP" cssClass="form-control" cssErrorClass="form-control input-validation-error" readonly="true" />
							<form:errors path="답변자IP" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-8">등록자이름</label>
						<div class="col-xs-16">
							<form:input path="답변자이름" cssClass="form-control" cssErrorClass="form-control input-validation-error" readonly="true" />
							<form:errors path="답변자이름" cssClass="field-validation-error" element="div" />
						</div>
					</div>
				</c:if>
					
					<form:errors path="" cssClass="alert alert-danger" element="div"  />
					
					<c:if test="${not empty write_ok_message}">
					<div class="alert alert-success">
						${write_ok_message}
					</div>
					</c:if>
					
					<div class="form-group center">
						<button type="submit" class="btn btn-primary btn-sm" style="margin-right:10px;"><i class="ace-icon glyphicon glyphicon-ok"></i>적용</button>
						<button type="button" class="btn btn-primary btn-sm" onclick="window.close()"><i class="ace-icon glyphicon glyphicon-remove"></i>닫기</button>
					</div>				
				</form:form>
				</div><!-- widget-main -->
			</div><!-- widget-body -->
		</div><!-- widget-box -->
		
	</div><!-- page-content -->
</div><!-- main-content -->
