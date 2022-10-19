<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<body class="page page-shop header-compact-sticky page-shop-grid navbar-layout-navbar-below" style="font-family: 'Noto Sans KR', sans-serif !important;">
    
<style>
	.nav-float{
		overflow:hidden;
	}
	.nav-float ul li{
		margin-left : 15px;
	}
	.nav-float button{
		margin-right : 15px;
	}
	th, td{
		vertical-align: middle;
		text-align: center;
	}
	.row-table{
	 	padding: 0px 15px 0px 15px;
	}
	
</style>
<script type="text/javascript">
	$(function () {
		$(".nav-item").click(function() {
			$(".fa-check").show();
			$.ajax({
				type:"POST",
				data : {
				},
				url: "./webQnaList",
				success:function(data){
					var qnaList = data.questionList;
					var html ="";

					if(qnaList != null){
						$.each(qnaList, function(idx, val){
							html += "<tr><th>NO</th><th></th><th>제목</th><th>작성자</th><th>작성일</th></tr>";
							html += "<tr><td>"+ (idx+1) + "</td>";
							html += "<td><c:if test='" + val.password + "eq null'><i class='ion-ios-locked'></i></c:if></td>";
							html += "<td style='text-align: left'><a href='<c:url value='./webQnaDetail?seq=" + val.seq + "'/>''><c:if test='" + val.depth + " == 1 }'><i class='fas fa-level-up-alt fa-rotate-90'></i>&nbsp;&nbsp;&nbsp;</c:if>" + val.title +"</a></td>";
					        html += "<td>" + val.writerName + "</td>";
					        html += "<td>" + val.wDate +"</td></tr>";
					     });
					}
					$("tbody").html(html);
				},
				error:function(request, status, error){

					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	});

</script>
<body class="page page-shop header-compact-sticky page-shop-grid navbar-layout-navbar-below" style="font-family: 'Noto Sans KR', sans-serif !important;">

	 <!-- ======== @Region: #page-header ======== -->
  <div id="page-header">
    <div class="container clearfix">
      <h3 class="mb-0 float-md-left">
        커뮤니티
      </h3>
      <!-- Page header breadcrumb -->
      <nav class="breadcrumb float-md-right"> <a class="breadcrumb-item" href="<c:url value='/'/>">Home</a> <a class="breadcrumb-item" href="<c:url value='/notice/webNoticeList'/>">커뮤니티</a> </nav>
    </div>
  </div>
  
    <!-- ======== @Region: #content ======== -->
  <div id="content" class="py-3 py-lg-6">
    <div class="container">
      <div class="row">
        <!-- Products grid -->
        <div class="col-lg-9 order-lg-2">
          <!-- Products filters -->
          <div class="row">
            <div class="col-lg-6 mb-3 mb-lg-0">
              <form class="form-inline justify-content-lg-start text-sm">
                <label class="control-label mr-2">Search:</label>
                <input type="text" name="q" class="form-control form-control-sm mr-lg-2" placeholder="">
                <!-- <a href="#adv-search" data-toggle="collapse" class="text-sm">advanced search</a> -->
              </form>
            </div>
            <div class="col-lg-6">
              <form class="form-inline justify-content-lg-end text-sm">
                <label class="control-label mr-2">Sort By:</label>
                <select name="sortField" class="form-control form-control-sm">
                  <option value="seq">전체</option>
                  <option value="title">이름순</option>
                  <option value="difficulty">난이도</option>
                </select>
                <label class="control-label mr-2 ml-lg-3">Show:</label>
                <select name="pageUnit" id="pageUnit" onchange="changeFirstIndex('pageUnit', this.value);" class="form-control form-control-sm">
                  <option value="15">15</option>
                  <option value="30">30</option>
                  <option value="45">45</option>
                  <option value="60">60</option>
                </select>
              </form>
            </div>
            <div class="col-lg-12 collapse" id="adv-search">
              <!-- Advanced search form -->
              <form class="mt-3 bg-light p-3 rounded mb-4 text-sm">
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <label>Category</label>
                    <select class="form-control">
                      <option value="#">Mens</option>
                      <option value="#">Womens</option>
                      <option value="#">Childrens</option>
                      <option value="#">Baby</option>
                    </select>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label>Brand</label>
                    <select class="form-control">
                      <option value="#">Brand 1</option>
                      <option value="#">Brand 2</option>
                      <option value="#">Brand 3</option>
                      <option value="#">Brand 4</option>
                    </select>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label>Price</label>
                    <div class="row">
                      <div class="input-group col-md-6">
                        <span class="input-group-prepend">$</span>
                        <input type="text" class="form-control" placeholder="from">
                      </div>
                      <div class="input-group col-md-6">
                        <span class="input-group-prepend">$</span>
                        <input type="text" class="form-control" placeholder="to">
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label>Size</label>
                    <select class="form-control">
                      <option value="#">Small</option>
                      <option value="#">Medium</option>
                      <option value="#">Large</option>
                      <option value="#">Extra Large</option>
                    </select>
                  </div>
                  <div class="col-md-12">
                    <button type="submit" class="btn btn-primary"> <i class="fa fa-search"></i> Search </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <hr class="my-4" />
          <div class="nav-float">
          	<ul style="float:left" class="nav nav-pills flex-column flex-lg-row">
          		<li class="nav-item"> <a class="nav-link " href="#"> <i class="fas fa-check" style="display: none;"></i>   내가 작성한 문의 </a> </li>
          	</ul>
          	<button type="button" class="mb-2 btn btn-outline-teal" style="float:right" onclick="location.href='<c:url value="./webQnaWrite"/>'">문의 작성하기</button>
          </div>
          <div class="row row-table" style="float:none">
	          <table class="table mb-0">
				<colgroup>
					<col style="width:8%">
					<col style="width:8%">
					<col style="width:50%">
					<col style="width:15%">
					<col style="width:15%">
				</colgroup>
				
				<tbody>
					<tr>
						<th>NO</th>
						<th></th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>                   
					</tr>
					<c:forEach var="item" items="${questionList }" varStatus="rowStatus" >
					<tr>
						<td>${searchVO.firstIndex + rowStatus.count}</td>
						<td><c:if test="item.password eq null"><i class="ion-ios-locked"></i></c:if></td>
						<td style="text-align: left"><a href="<c:url value="./webQnaDetail?seq=${item.seq}"/>"><c:if test="${item.depth == 1 }"><i class="fas fa-level-up-alt fa-rotate-90"></i>&nbsp;&nbsp;&nbsp;</c:if>${item.title }</a></td>
						<td>${item.writerName }</td>
						<td>${item.wDate }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
         </div> 
          <!-- Pagination -->
          <nav aria-label="Page navigation">
          	${RenderPagination}
          </nav>
        </div>
        
         
        <!-- Products sidebar -->
        <div class="col-lg-3 order-lg-1">

          <!-- Sections Menu-->
          <ul class="nav nav-section-menu mb-4 py-3">
            <li class="nav-header">COMMUNITY</li>
            <li><a href="<c:url value='/notice/webNoticeList'/>" class="nav-link text-slab" style="font-family: 'Noto Sans KR', sans-serif !important;">공지사항</a></li>
            <li><a href="<c:url value='/qna/webQnaList'/>" class="nav-link text-slab" style="font-family: 'Noto Sans KR', sans-serif !important;">1:1 문의</a></li>
            <li><a href="<c:url value='/faq/webFaqList'/>" class="nav-link text-slab" style="font-family: 'Noto Sans KR', sans-serif !important;">FAQ</a></li>
        </div> 
        <!-- side end -->
      </div>
    </div>
  </div>
</body>
