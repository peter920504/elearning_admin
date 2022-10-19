<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/userLog.css'/>">
<!-- SheetJS CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<!-- FileSaver saveAs CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
<script type="text/javascript">
//var sysCom_Items_Json = ${sysCom_Items_Json};

$(document).ready(function() {
	$("#pageUnit").val("${searchVO.pageUnit}");
	$("#qw").val("${searchVO.qw}");
});
</script>

<script type="text/javascript">
function goListAll() {
    $("#searchForm #q").val("");
    $("#searchForm #qw").val("");
    
    $("#searchForm").submit();
}
</script>

<script>
function s2ab(s) { 
    var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
    var view = new Uint8Array(buf);  //create uint8array as viewer
    for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
    return buf;    
}

function exportExcel() {
	 // step 1. workbook 생성
    var wb = XLSX.utils.book_new();

    // step 2. 시트 만들기 
    var newWorksheet = excelHandler.getWorksheet();
    
    // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
    XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());

    // step 4. 엑셀 파일 만들기 
    var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});

    // step 5. 엑셀 파일 내보내기 
    saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
}
</script>

<script>
var excelHandler = {
        getExcelFileName : function(){
            return '유저로그.xlsx';
        },
        getSheetName : function(){
            return '유저로그 Sheet';
        },
        getExcelData : function(){
            return document.getElementById('tableData'); 
        },
        getWorksheet : function(){
            return XLSX.utils.table_to_sheet(this.getExcelData());
        }
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
			<li class="active">사용자 관리</li>
			<li class="active">사용자 로그 관리</li>
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
						<label class="control-label col-xs-4">검색필드</label>
						<div class="col-xs-6">
							<select name="qw" id="qw" class="form-control">
								<option value="">전체</option>
								<option value="id">아이디</option>
								<option value="type_name">활동구분코드명</option>
							</select>
						</div>
						<div class="col-xs-17">
							<input type="text" name="q" id="q" size="30" value="${searchVO.q}" placeholder="검색어 입력" class="form-control">
						</div>
						<div class="col-xs-15">
							<button type="submit" class="btn btn-primary btn-sm"><i class="ace-icon fa fa-search"></i>검색</button>
							<input type="button" value="전체목록" class="btn btn-primary btn-sm" onclick="goListAll()">
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
		<div class="container-fluid main">
		<div class="cont-info">
<!-- 			<button type="button" class="btn btn-success btn-sm" onclick="selectAll();"><i class="ace-icon fa fa-check-square-o"></i>전체선택</button> -->
<!-- 			<button type="button" class="btn btn-success btn-sm" onclick="releaseAll();"><i class="ace-icon fa fa-square-o"></i>전체해제</button> -->
<!-- 			<input type="button" value="Excel로 다운로드" class="btn btn-primary btn-sm" onclick="exportExcel()">  -->
						<div class="c2a-btn footer-c2a-btn">
						<div class="text-center main-text">
						<h3>아래버튼을 통해 엑셀로 다운로드 할 수 있습니다</h3>
						<div class="btn-group btn-group-lg" role="group"
							aria-label="Call to action">
							<form action="./downloadExcel" method="post">
							<input type="button" class="btn btn-default btn-lg btn2" value="현재페이지 엑셀다운" onclick="exportExcel()">
							<span class="btn-circle btn-or">or</span>
							<input type="submit" class="btn btn-default btn-lg btn2" value="전체페이지  엑셀다운 ">
							</form>
						</div>
						</div>
						</div>
		</div>
		</div>
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller pull-left">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					검색목록 <span class="data-cnt">(조회수: ${fnItkc:to3DecimalFmt(dataCount)})</span>
				</h4>
				<div class="pull-right page-changer">
				    목록수:
					<select name="pageUnit" id="pageUnit" onchange="changeFirstIndex('pageUnit', this.value);">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
						<option value="100">100</option>
						<option value="200">200</option>
					</select>
				</div>
			</div>
			<div class="widget-body data-tbl">
			    <table class="table table-striped table-bordered table-hover data-list" id="tableData">
					<colgroup>
						<col style="width:8%">
						<col style="width:33%">
						<col style="width:25%">
						<col style="width:30%">
					</colgroup>
					<thead>
			        <tr>
						<th>번호</th>
						<th class="col-sort" data-sort="id">사용자로그인ID</th>
						<th class="col-sort" data-sort="actionDate">활동시간</th>
						<th class="col-sort" data-sort="typeName">활동구분코드명</th>
			        </tr>
			        </thead>
					<tbody>
			        <c:forEach var="item" items="${userLogList}" varStatus="rowStatus">
				    <tr>
						<td>${searchVO.firstIndex + rowStatus.count}</td>
						<td>${item.id}</td>
						<td>${item.actionDate}</td>
						<td>${item.typeName}</td>
				    </tr>
				    </c:forEach>
					<c:if test="${empty userLogList}">
						<tr><td colspan="11">조회 목록이 존재하지 않습니다.</td></tr>
					</c:if>
					</tbody>
			    </table>		
				
				
				<div id="paging">
					<div class="pagination-wrap">
						${RenderPagination}
					</div>
					<div class="page-index-changer">
						<input class="ui-pg-input" type="text" maxlength="7" value="${searchVO.pageIndex}"> / <span style="vertical-align:middle;">${searchVO.totalPage}</span>
						<a onclick="changeLocation('pageIndex', $(this).closest('div').find('.ui-pg-input').val())" class="btn btn-info btn-minier">go</a>					
					</div>
				</div>
				
			</div><!-- widget-body -->
		</div><!-- widget-box -->
		
	</div><!-- page-content -->
</div><!-- main-content-inner -->