<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
//var sysCom_Items_Json = ${sysCom_Items_Json};

$(document).ready(function() {
	$("#pageUnit").val("${searchVO.pageUnit}");
	$("#qw").val("${searchVO.qw}");
	var pre = document.getElementsByClassName("preview");
	for(var i = 0; i < pre.length; i++){
		if(pre[i].dataset.src == '') {
			pre[i].src = '';
		} else {
			pre[i].src = "<c:url value='/resources/images/sub/picture_frame.png'/>";
		}
	}
});
</script>

<script type="text/javascript">

function goAdd() {
	
	var url = "./userWrite";
		
    var winpop = window.open(url, "_mod_pop_data", "resizable=yes,scrollbars=yes,width=950,height=950");
    winpop.focus();
    
}

function goDetail(seq) {
	
	var url = "./userDetail?seq="+seq;
	location.href= url;
		
}

function goModify(seq) {
	
	var url = "./userWrite?seq="+seq;
	
    var winpop = window.open(url, "_mod_pop_data", "resizable=yes,scrollbars=yes,width=950,height=950");
    winpop.focus();
    
}

function goDelete(seq, id, file){
	if(confirm("해당 사용자를 삭제하시겠습니까?")){
		$.post("./userDelete", 
				{ seq: seq,
				  id: id,
				  filePath: file	
				},
				function(data, status) {
					if(status == 'success') {
						self.location.reload();
						alert('삭제되었습니다.');
					}
				}
			);
	}
}
				
		
		
// 		.done(function (result, textStatus, jqXHR) {
// 			if (result.success) {
// 				alert("삭제되었습니다.");
// 				self.location.reload();
// 			} else {
// 				alert("메세지");
// 				alert(result.message);
// 			}
			
// 		}).fail(function (jqXHR, textStatus, errorThrown) {
// 			alert('실패');
// 			alert(jqXHR.status + " : " + textStatus + " : " + errorThrown); });
// 	}
// }

function delUserIds() {
	var delSeq = $('.data-list input:checkbox:checked').map(function () {
		  return this.value;
	}).get();

	if(delSeq.length <1) {
		alert("삭제할 항목을 1개 이상 선택하세요!");
		return;
	}
	if ( confirm("선택한 사용자를 삭제하시겠습니까?") ) {

		$.blockUI({message: '<div><img src="/resources/images/common/busy.gif" width="50px"/></div>'});
		$.post("<c:url value='./delUserSeqs' />", { "seqs": delSeq }, null, "json").done(function (result, textStatus, jqXHR) {

			if (result.success) {
				self.location.reload();
				alert("총 "+delSeq.length+"개의 데이터가 삭제되었습니다.");
			} else {
				alert(result.message);
			}
		}).fail(function (jqXHR, textStatus, errorThrown) { alert(jqXHR.status + " : " + textStatus + " : " + errorThrown); });
	}
}



function goListAll() {
    $("#searchForm #q").val("");
    $("#searchForm #qw").val("");
    
    $("#searchForm").submit();
}

</script>

<script type="text/javascript">
$(document).ready(function() {
      
    var xOffset = 200;
    var yOffset = 30;

    $(document).on("mouseover",".preview",function(e){ //마우스 오버시
    	var source = $(this).attr("data-src");
         if(source != "") {
	        $("body").append("<p id='preview'><img src='"+ source +"' width='400px' ' height='400px'/></p>"); //보여줄 이미지를 선언                       
	        $("#preview")
	            .css("top",(e.pageY - xOffset) + "px")
	            .css("left",(e.pageX + yOffset) + "px")
	            .fadeIn("fast"); //미리보기 화면 설정 셋팅
         }
    });
     
    $(document).on("mousemove",".preview",function(e){ //마우스 이동시
        $("#preview")
            .css("top",(e.pageY - xOffset) + "px")
            .css("left",(e.pageX + yOffset) + "px");
    });
     
    $(document).on("mouseout",".preview",function(){ //마우스 아웃시
        $("#preview").remove();
    });
      
});
</script>
<style>
/* 미리보기 스타일 셋팅 */
#preview{
    z-index: 9999;
    position:absolute;
    border:0px solid #ccc;
    background:#333;
    padding:1px;
    display:none;
    color:#fff;
}
</style>

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
			<li class="active">사용자 목록 관리</li>
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
								<option value="nick_name">닉네임</option>
								<option value="type_name">종류코드명</option>
								<option value="assign">소속</option>
								<option value="is_use">휴면여부</option>
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
			<button type="button" class="btn btn-danger btn-sm" onclick="delUserIds();"><i class="ace-icon fa fa-remove"></i>선택삭제</button>
			<button type="button" class="btn btn-info btn-sm" onclick="goAdd()"><i class="ace-icon glyphicon glyphicon-plus"></i>계정등록</button>
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
						<col style="width:8%">
						<col style="width:18%">
						<col style="width:18%">
						<col style="width:10%">
						<col style="width:10%">
						<col style="width:10%">
						<col style="width:10%">
						<col style="width:13%">
					</colgroup>
					<thead>
			        <tr>
						<th></th>
						<th>번호</th>
						<th class="col-sort" data-sort="id">사용자ID</th>
						<th class="col-sort" data-sort="nickName">닉네임</th>
						<th>대표이미지</th>
						<th class="col-sort" data-sort="typeName">그룹</th>
						<th class="col-sort" data-sort="assign">소속</th>
						<th class="col-sort" data-sort="isUse">휴면여부</th>
						<th>관리</th>
			        </tr>
			        </thead>
					<tbody>
			        <c:forEach var="item" items="${userList}" varStatus="rowStatus">
				    <tr>
						<td><input type="checkbox" value="${item.seq}"></td>
						<td>${searchVO.firstIndex + rowStatus.count}</td>
						<td>
							<a href="javascript:goDetail('${item.seq}')">${item.id}</a>
						</td>
						<td>${item.nickName}</td>
						<td>
						<c:if test="${item.filePath ne null}">
							<img class="preview" width="25px;" data-src="<c:url value='${item.filePath}'/>" src="<c:url value='/resources/images/sub/picture_frame.png'/>" alt="${item.nickName}님의 프로필">
					    </c:if>
					    </td>
						<td>${item.typeName}</td>
						<td>${item.assign}</td>
						<td>${item.isUse}</td>
						<td>
							<a href="javascript:goModify('${item.seq}')" class="btn btn-minier">수정</a>
							<a href="javascript:goDelete('${item.seq}', '${item.id}','${item.filePath}')" class="btn btn-minier">삭제</a>
				      	</td>
				    </tr>
				    </c:forEach>
					<c:if test="${empty userList}">
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