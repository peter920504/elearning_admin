<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
<c:if test="${not empty write_ok_message}">
	alert('${write_ok_message}');
// 	parent.opener.location.reload(true);
</c:if>
<c:if test="${not empty write_not_ok_message}">
	alert('${write_not_ok_message}');
</c:if>
<c:if test="${not empty popupClose}">
	window.opener.location.reload();
	window.close();
</c:if>
</script>

<script type="text/javascript">


function goApplyToSvcs(id) {
	var ids=[];
	ids.push(id);
	goApplyToSvcsByIds(ids);
}

function goApplyToSvcsByIds(ids) {
	if(ids.length <1) {
		alert("적재할 항목을 1개 이상 선택하세요!");
		return ; 
	}
	
    if (confirm("선택한 항목를 적재하시겠습니까(편집노드만적재, 하위노드적재안함, 적재후자동색인)")) {
    	$.blockUI({message: '<div><img src="<c:url value='/resources/images/common/busy.gif'/>" width="50px"/></div>'});
        $.post("<c:url value='/svcs/applyToSvcsIds'/>", { "ids": ids, "applySubExclude": true, "applySolrIndex": true}, null, "json")
        .done(function (result, textStatus, jqXHR) {
		    //alert(result + ":" + textStatus + ":" + jqXHR.status); //jqXHR.readyState,jqXHR.status,jqXHR.statusText,jqXHR.responseXML,jqXHR.responseTexT
	    	alert(result.message);//alert(ids.length+"건의 자료적재를 완료하였습니다.");
		}).fail(function (jqXHR, textStatus, errorThrown) { alert(jqXHR.status + " : " + textStatus + " : " + errorThrown); });
    }
}

</script>

<div class="main-content">
<form id="downloadForm" method="post" action="<c:url value='/store/dataDownload'/>">
	<input type="hidden" id="ids" name="ids[]">	
</form>
	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					사용자 코드유형  ${userCodeVO.typeCode != null ? "편집" : "등록"}
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form:form id="write" modelAttribute="userCodeVO" class="form-horizontal"  action="userCodeWrite">
					<input type="hidden" name="seq" id="seq" value="${userCodeVO.seq}">
					<div class="form-group">
						<label class="control-label col-xs-8">사용자 코드유형</label>
						<div class="col-xs-16">
							<input name="dataType" id="dataType" type="text" class="form-control" readonly="readonly" value="${userCodeVO.dataType}">
						</div>
					</div>				
					<div class="form-group">
						<label class="control-label col-xs-8">코드값</label>
						<div class="col-xs-16">
							<c:if test="${userCodeVO.typeCode != null}">
								<form:input path="typeCode" cssClass="form-control" cssErrorClass="form-control input-validation-error" value="${userCodeVO.typeCode}" readonly="true"/>
								<input type="hidden" name="oriTypeCode" id="oriTypeCode" value="${userCodeVO.typeCode}"/>
							</c:if>
							<c:if test="${userCodeVO.typeCode == null}">
								<form:input path="typeCode" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							</c:if>
							<form:errors path="typeCode" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-xs-8">설명</label>
						<div class="col-xs-40">
							<c:if test="${userCodeVO.typeCode != null}">
								<form:input path="typeName" cssClass="form-control" cssErrorClass="form-control input-validation-error" value="${userCodeVO.typeName}" />
							</c:if>
							<c:if test="${userCodeVO.typeCode == null}">
								<form:input path="typeName" cssClass="form-control" cssErrorClass="form-control input-validation-error" />
							</c:if>
							<form:errors path="typeName" cssClass="field-validation-error" element="div" />
						</div>
					</div>
					
					
					<form:errors path="" cssClass="alert alert-danger" element="div"  />
					
					<c:if test="${not empty write_ok_message}">
					<div class="alert alert-success">
						${write_ok_message}
					</div>
					</c:if>
					
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
