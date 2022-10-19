<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
//var sysCom_Items_Json = ${sysCom_Items_Json};


$(document).ready(function() {
	$("#dataType").change(function() {
		$("#searchForm").submit();
	});
});
</script>

<script type="text/javascript">

function goWrite() {
	
    var url = "./userCodeWrite?dataType=" + encodeURI($("#dataType").val());
    var winpop = window.open(url, "_mod_pop_data", "resizable=yes,scrollbars=yes,width=550,height=300");
    winpop.focus();
}

function goModify(seq,typeCode) {
    var url = "./userCodeWrite?dataType="+encodeURI($("#dataType").val())+"&seq="+seq+"&typeCode="+typeCode;
    var winpop = window.open(url, "_mod_pop_data", "resizable=yes,scrollbars=yes,width=550,height=300");
    winpop.focus();
}

function deleteCommonCode(typeCode) {
	if(confirm("해당 코드를 삭제하시겠습니까?")){
		var dataType = $("#dataType").val();
	
		$.post("./userCodeDelete", 
				{ "dataType": dataType, "typeCode": typeCode},
				function(data, status) {
					if(status == 'success') {
						self.location.reload();
						alert('삭제되었습니다.');
					}
				}
			);
	}
}


</script>

<div class="main-content-inner">
<!-- iframe id="ifdownload" name="ifdownload" style="width:0px;height:0px;"></iframe-->
<!-- Form -->
	<div class="breadcrumbs breadcrumbs-fixed" id="breadcrumbs">
		<script type="text/javascript">
			try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
		</script>

		<ul class="breadcrumb">
			<li>
				<i class="ace-icon fa fa-home home-icon"></i>
				<a href="<c:url value='/admin' />">Home</a>
			</li>
			<li class="active">사용자관리</li>
			<li class="active">사용자 유형코드 관리</li>
		</ul>
	</div>
	
	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					검색조건
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
				<form name="searchForm" id="searchForm" method="get" class="form-horizontal">
					<div class="form-group">
						<label class="control-label col-xs-4">사용자 코드유형</label>
						<div class="col-xs-10">
							<select name="dataType" id="dataType" class="form-control">
								<c:forEach var="field" items="${codeList}">
									<option value="${field.codeName}" ${searchVO["dataType"]==field.codeName?"selected":""}>${field.codeName}(${field.totalCount})</option>
								</c:forEach>
							</select>
						</div>
						
					</div>

				</form>
				</div>
			</div>
		</div>
		<div class="cont-info">
			
			<ul style="float:right;">
				<button type="button" class="btn btn-success btn-sm" onclick="goWrite();"><i class="ace-icon fa fa-floppy-o"></i>등록</button>
			</ul>
			
		</div>
		
		<div class="widget-box">
			<div class="widget-body data-tbl">		
			    <table class="table table-striped table-bordered table-hover data-list">
					<colgroup>
						<col style="width:30%">
						<col style="width:60%">
						<col style="width:10%">
					</colgroup>
					<thead>
			        <tr>
						<th>코드값</th>
						<th>설명</th>
						<th>관리</th>
			        </tr>
			        </thead>
					<tbody>
			        <c:forEach var="item" items="${userCodeList}" varStatus="rowStatus">
				    <tr>
				    	<td style="display:none;">${searchVO.firstIndex + rowStatus.count}</td>
						<td>${item.typeCode}</td>
						<td>${item.typeName}</td>
						<td>
							<a href="javascript:goModify('${searchVO.firstIndex + rowStatus.count}','${item['typeCode']}')" class="btn btn-minier">수정</a>
							<a href="javascript:deleteCommonCode('${item['typeCode']}')" class="btn btn-minier">삭제</a>
						</td>
				    </tr>
				    </c:forEach>
					<c:if test="${empty userCodeList}">
						<tr><td colspan="4">조회 목록이 존재하지 않습니다.</td></tr>
					</c:if>
					</tbody>
			    </table>		
				
			</div><!-- widget-body -->
		</div><!-- widget-box -->
		
	</div><!-- page-content -->
</div><!-- main-content-inner -->