<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

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
			<li class="active">좋아요 목록 관리</li>
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
								<option value="board_type">글종류</option>
								<option value="title">글제목</option>
								<option value="id">사용자ID</option>
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
		
<!-- 		<div class="cont-info"> -->
<!-- 		</div> -->
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
				<ul class="nav nav-tabs">
				  <li class="nav-item active">
				    <a class="nav-link active" data-toggle="tab" href="#qwe">목록</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" data-toggle="tab" href="#asd">차트</a>
				  </li>
				</ul>
				<div class="tab-content">
				<div class="tab-pane fade active in" id="qwe">
			    <table class="table table-striped table-bordered table-hover data-list">
					<colgroup>
						<col style="width:6%">  <!-- 등록번호 --> 
						<col style="width:12%"> <!-- 좋아요날짜  -->
						<col style="width:10%"> <!-- 글종류 15 > 10 -->
						<col style="width:19%"> <!-- 카테고리종류 -->
						<col style="width:39%"> <!-- 글제목 -->
						<col style="width:15%"> <!-- 사용자ID -->
					</colgroup>
					<thead>
			        <tr>
						<th>번호</th>
						<th class="col-sort" data-sort="likeDate">좋아요날짜</th>
						<th class="col-sort" data-sort="boardType">글종류</th>
						<th class="col-sort" data-sort="boardCate">카테고리종류</th>
						<th class="col-sort" data-sort="boardTitle">글제목</th>
						<th class="col-sort" data-sort="id">사용자ID</th>
			        </tr>
			        </thead>
					<tbody>
			        <c:forEach var="item" items="${boardLikeList}" varStatus="rowStatus">
				    <tr>
						<td>${searchVO.firstIndex + rowStatus.count}</td>
						<td>${item.likeDate}</td>
						<td>${item.boardType}</td>
						<td>${item.boardCate}</td>
						<td>${item.boardTitle}</td>
						<td>${item.id}</td>
				    </tr>
				    </c:forEach>
					<c:if test="${empty boardLikeList}">
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
				</div>
				<div class="tab-pane fade" id="asd">
					<div>
						<canvas id="myChart"></canvas>
					</div>
				</div>
				</div>
				
			</div><!-- widget-body -->
		</div><!-- widget-box -->
		
	</div><!-- page-content -->
</div><!-- main-content-inner -->
<script type="text/javascript">

var context = document.getElementById('myChart').getContext('2d');
var statCount1 = "${boardLikeStatCountVO.cate1First}";
var statCount2 = "${boardLikeStatCountVO.cate1Second}";
var statCount3 = "${boardLikeStatCountVO.cate1Third}";
var statCount4 = "${boardLikeStatCountVO.cate1Fourth}";
var statCount5 = "${boardLikeStatCountVO.cate1Fifth}";
var statCount6 = "${boardLikeStatCountVO.cate1Sixth}";
var statCount7 = "${boardLikeStatCountVO.cate1Seventh}";
var statCount8 = "${boardLikeStatCountVO.cate1Eighth}";

var myChart = new Chart(context, {
	type : 'bar', // 차트의 형태
	data : { // 차트에 들어갈 데이터
		labels : [ '개발-프로그래밍', '보안-네트워크', '데이터 사이언스', '크리에이티브', '직무-마케팅',
				'학문-외국어', '커리어', '교양' ],
		datasets : [ { //데이터
			label : '강의 카테코리별 좋아요 차트', //차트 제목
			fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
			data : [ statCount1, statCount2, statCount3, statCount4, statCount5, statCount6, statCount7, statCount8 //x축 label에 대응되는 데이터 값
			],
			backgroundColor : [
			//색상
			'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)',
					'rgba(255, 120, 30, 0.2)' ],
			borderColor : [
			//경계선 색상
			'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)',
					'rgba(255, 120, 30, 1)' ],
			borderWidth : 1
		//경계선 굵기
		} /* ,
						                        {
						                            label: 'test2',
						                            fill: false,
						                            data: [
						                                8, 34, 12, 24
						                            ],
						                            backgroundColor: 'rgb(157, 109, 12)',
						                            borderColor: 'rgb(157, 109, 12)'
						                        } */
		]
	},
	options : {
		scales : {
			yAxes : [ {
				ticks : {
					beginAtZero : true
				}
			} ]
		}
	}
});
</script>
