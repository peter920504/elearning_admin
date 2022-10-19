<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="shortcut icon" href="<c:url value='/resources/images/common/logo.png'/>">
<link rel="apple-touch-icon" href="<c:url value='/resources/images/apple-touch-icon.png'/>"> 
	
<link rel="stylesheet" href="<c:url value='/resources/libs/bootstrap/css/bootstrap.css'/>" >
<link rel="stylesheet" href="<c:url value='/resources/libs/bootstrap/css/bootstrap.min.css'/>" >
<link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.css'/>" media="screen">
<link rel="stylesheet" href="<c:url value='/resources/libs/jquery-ui/jquery-ui.css'/>" >
<link rel="stylesheet" href="<c:url value='/resources/css/datepicker.css'/>" >
<link rel="stylesheet" href="<c:url value='/resources/css/ui.jqgrid.css'/>" >
<link rel="stylesheet" href="<c:url value='/resources/css/ace-fonts.css'/>" media="screen">
<link rel="stylesheet" href="<c:url value='/resources/css/ace.css'/>" class="ace-main-stylesheet" id="main-ace-style" >

<script src="<c:url value='/resources/libs/backbone/underscore-min.js'/>"></script>
<script src="<c:url value='/resources/libs/core/underscore.string.min.js'/>"></script>

<script src="<c:url value='/resources/libs/jquery-1.11.3.min.js'/>"></script>
<script src="<c:url value='/resources/libs/jquery-ui/jquery-ui.js'/>"></script>
<script src="<c:url value='/resources/libs/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/libs/ace-extra.js'/>"></script>
<script src="<c:url value='/resources/libs/placeholders.jquery.min.js'/>"></script>
<script src="<c:url value='/resources/libs/jquery.fileDownload.js'/>"></script>

<script src="<c:url value='/resources/libs/core/string.js'/>"></script>

<script src="<c:url value='/resources/js/handlebars-1.0.0.beta.6.js'/>"></script>
<script src="<c:url value='/resources/libs/jquery-validation-1.11.1/messages_ko.js'/>"></script>

<link rel="stylesheet" href="<c:url value='/resources/libs/jquery-resizable/jquery.resizableColumns.css'/>" >
<script src="<c:url value='/resources/libs/jquery-resizable/jquery.resizableColumns.js'/>"></script>
<script src="<c:url value='/resources/libs/jquery-resizable/store.min.js'/>"></script>

<script src="<c:url value='/resources/libs/jquery.blockUI.js'/>"></script>

<script>
	new Image().src="<c:url value='/resources/images/common/busy.gif'/>";
	$(document).ajaxStop($.unblockUI); 
	$.blockUI.defaults.css = {}; 
	$.blockUI.defaults.overlayCSS ={};
</script>

<script src="<c:url value='/resources/js/vacu/common.js'/>"></script>

<script type="text/javascript">
$(document).ready(function() {

	$("table.data-list").resizableColumns();

  	$(".data-list .col-sort").click(function() {
  		//alert($(this).data("sort"));
  		//alert($(this).closest("th").data("order"));
		changeLocationArray([['pageIndex','1'],['sortField', encodeURI($(this).data("sort"))],['sortOrder', ($(this).closest("th").data("order")=='desc'?'asc':'desc')]]);		
	});
	$(".data-list .col-sort[data-sort='${searchVO.sortField}']").data("order","${searchVO.sortOrder}");
	$(".data-list .col-sort[data-sort='${searchVO.sortField}']").append(" <i class='sort-icon ace-icon fa fa-caret-${searchVO.sortOrder=='desc'?'down':'up'}' icon-on-right'></i>");
});

function selectAll() {
	$('.data-list input:checkbox').prop('checked', true);
}

function releaseAll() {
	$('.data-list input:checkbox').prop('checked', false);
}

function goDelete(id) {
	var ids=[];
	ids.push(id);
	goDeleteByIds(ids);
}

function goDeleteMulti() {	
	var ids = $('.data-list input:checkbox:checked').map(function () {
		  return this.value;
		}).get();
	
	goDeleteByIds(ids);
}

function _goDeleteByIds(url, ids) {
	if(ids.length <1) {
		alert("삭제할 항목을 1개 이상 선택하세요!");
		return;
	}
	
    if (confirm("선택한 항목를 삭제하시겠습니까")) {
    	$.blockUI({message: '<div><img src="<c:url value='/resources/images/common/busy.gif'/>" width="50px"/></div>'});
        $.post(url, { "ids": ids }, null, "json")
        .done(function (result, textStatus, jqXHR) {
			//alert(result + ":" + textStatus + ":" + jqXHR.status); //jqXHR.readyState,jqXHR.status,jqXHR.statusText,jqXHR.responseXML,jqXHR.responseTexT
			if (result.success)
			    self.location.reload();
			else
			    alert(result.message);
		}).fail(function (jqXHR, textStatus, errorThrown) { alert(jqXHR.status + " : " + textStatus + " : " + errorThrown); });
    }
}

function _goDeleteOne(url, id) {
	if (confirm("선택한 아이디 '"+ id + "' 항목를 삭제하시겠습니까")) {
		$.post(url, { "id": id }, null, "json")
		.done(function (result, textStatus, jqXHR) {
			//alert(result + ":" + textStatus + ":" + jqXHR.status); //jqXHR.readyState,jqXHR.status,jqXHR.statusText,jqXHR.responseXML,jqXHR.responseTexT
			if (result.success)
			    self.location.reload();
			else
			    alert(result.message);
		}).fail(function (jqXHR, textStatus, errorThrown) { alert(jqXHR.status + " : " + textStatus + " : " + errorThrown); });
	}
}

function goDownloadExcel() {
	$('#downExcelForm').submit().remove();
}

function goDownloadExcelJudge() {
	$('#downExcelFormJudge').submit().remove();
}

function goDownloadExcelOpen() {
	$('#downExcelFormOpen').submit().remove();
}

function goDownload(id) {
	var ids=[];
	ids.push(id);
	goDownloadByIds(ids);
}

function goDownloadMulti() {
	var ids = $('.data-list input:checkbox:checked').map(function () {
		  return this.value;
		}).get();

	goDownloadByIds(ids);
}

function goDownloadByIds(ids) {
	if(ids.length <1) {
		alert("다운로드할 항목을 1개 이상 선택하세요!");
		return;
	}

	$('#downloadForm #ids').val(ids);
	$('#downloadForm').submit();
}

</script>

