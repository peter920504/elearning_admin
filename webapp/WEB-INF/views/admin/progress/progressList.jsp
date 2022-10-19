<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
//var sysCom_Items_Json = ${sysCom_Items_Json};

$(document).ready(function() {
	
	$("#pageUnit").val("${searchVO.pageUnit}");
	$("#qw").val("${searchVO.qw}");
	
	$("#datesS").val("${searchVO.datesS}");
	$("#datesE").val("${searchVO.datesE}");
	$("#dateS").val("${searchVO.dateS}");
	$("#dateE").val("${searchVO.dateE}");
	$("#datesS").datepicker({dateFormat: 'yy-mm-dd'});
	$("#datesE").datepicker({dateFormat: 'yy-mm-dd'});
	$("#dateS").datepicker({dateFormat: 'yy-mm-dd'});
	$("#dateE").datepicker({dateFormat: 'yy-mm-dd'});
	
});
</script>

<script type="text/javascript">

function goDetail(seq) {
	
	var url = "./progressDetail?seq="+seq;
	
    var winpop = window.open(url, "_mod_pop_data", "resizable=yes,scrollbars=yes,width=950,height=950");
    winpop.focus();
    
}

function goListAll() {
    $("#searchForm #q").val("");
    $("#searchForm #qw").val("");
    $("#searchForm #dateS").val("");
    $("#searchForm #dateE").val("");
    $("#searchForm #datesS").val("");
    $("#searchForm #datesE").val("");
    
    $("#searchForm").submit();
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
			<li class="active">진도관리</li>
			<li class="active">진도 목록</li>
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
							<label class="control-label col-xs-4">수강시작일</label>
							<div class="col-xs-8">
								<input type="text" name="datesS" id="datesS" size="20" value="${searchVO.datesS}" class="form-control" placeholder="YYYY-MM-DD">
							</div>
							<label class="control-label col-xs-2 center">~</label>
							<div class="col-xs-8"> 
								<input type="text" name="datesE" id="datesE" size="20" value="${searchVO.datesE}" class="form-control" placeholder="YYYY-MM-DD">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-xs-4">수강완료일</label>
							<div class="col-xs-8">
								<input type="text" name="dateS" id="dateS" size="20" value="${searchVO.dateS}" class="form-control" placeholder="YYYY-MM-DD">
							</div>
							<label class="control-label col-xs-2 center">~</label>
							<div class="col-xs-8"> 
								<input type="text" name="dateE" id="dateE" size="20" value="${searchVO.dateE}" class="form-control" placeholder="YYYY-MM-DD">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-xs-4">검색필드</label>
							<div class="col-xs-6">
								<select name="qw" id="qw" class="form-control">
									<option value="">전체</option>
									<option value="nick_name">사용자</option>
									<option value="title">교육컨텐츠</option>
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
		
		<div class="cont-info">
			<button type="button" class="btn btn-success btn-sm" onclick="selectAll();"><i class="ace-icon fa fa-check-square-o"></i>전체선택</button>
			<button type="button" class="btn btn-success btn-sm" onclick="releaseAll();"><i class="ace-icon fa fa-square-o"></i>전체해제</button>
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
			    <table class="table table-striped table-bordered table-hover data-list">
					<colgroup>
						<col style="width:3%">
						<col style="width:3%">
						
						<col style="width:18%">
						<col style="width:18%">
						<col style="width:18%">
						<col style="width:18%">
						<col style="width:18%">
						
						<col style="width:4%">
					</colgroup>
					<thead>
			        <tr>
						<th></th>
						<th>번호</th>
						
						<th class="col-sort" data-sort="nickName">사용자</th>
						<th class="col-sort" data-sort="contents">교육컨텐츠</th>
						<th class="col-sort" data-sort="point">진행률</th>
						<th class="col-sort" data-sort="startDate">수강시작일시</th>
						<th class="col-sort" data-sort="">수강완료여부</th>
						
						<th>상세</th>
			        </tr>
			        </thead>
					<tbody>
			        <c:forEach var="item" items="${progressList}" varStatus="rowStatus">
				    <tr>
						<td><input type="checkbox" value="${item.seq}"></td>
						<td>${searchVO.firstIndex + rowStatus.count}</td>
						
						<td>${item.userVO.nickName}</td>
						<td>${item.contentsVO.title}</td>
						<td>
							${item.point} / ${item.contentsVO.classCount}
							(<fmt:formatNumber type="number" maxFractionDigits="0" value="${item.point * 100 / item.contentsVO.classCount}" /> %) 
						</td>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${item.startDate}" />
							
						</td>
						<td>
							<c:choose>
								<c:when test="${item.endDate ne null}">
									Y / <fmt:formatDate pattern="yyyy-MM-dd" value="${item.endDate}" />
								</c:when>
								<c:otherwise>
									N
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<a href="javascript:goDetail('${item.seq}')" class="btn btn-minier">보기</a>
				      	</td>
				    </tr>
				    </c:forEach>
					<c:if test="${empty progressList}">
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