<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<body class="page page-shop header-compact-sticky page-shop-grid navbar-layout-navbar-below" style="font-family: 'Noto Sans KR', sans-serif !important;">
    
<style>
	th, td{
		vertical-align: middle;
		text-align: center;
	}
	.row-table{
	 	padding: 0px 15px 0px 15px;
	}
	.card-margin{
		margin-top : 20px;
	}
</style>
<script type="text/javascript">
	$(function () {
		$(".nav-item").click(function() {
			var faqType = $.trim($(this).text());
		   $(".nav-link").removeClass("active");
		   $(this).find("a").addClass("active");
		   
		   $.ajax({
				type:"POST",
				data : {
					faqType : faqType
				},
				url: "./webFaqList",
				success:function(data){
					var faqList = data.faqList;
					var html ="";
					if(faqList != null){
						$.each(faqList, function(idx, val){  
							html += "<div class='card'>";
							html += "<div class='card-header py-0 px-0' role='tab' id='headingOne2'>";
							html += "<a data-toggle='collapse' data-parent='#accordion-list-style' href='#collapseList"+(idx+1)+ "' aria-expanded='true' aria-controls='collapseOne' class='show'>"+ val.title +"</a> </div>";
							html += "<div id='collapseList" + (idx+1) + "' class='collapse' role='tabpanel' aria-labelledby='headingOne1' data-parent='#accordion-list-style'>";
					        html += "<div class='card-body'>" + val.contents + "</div>";
					        html += "</div></div>";
					     });
					}
					$("#accordion-list-style").html(html);
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
          <div class="faqType">
			<ul class="nav nav-pills flex-column flex-lg-row">
			<li class="nav-item"> <a id="nav-link" class="nav-link" href="#">컨텐츠</a> </li>
			<li class="nav-item"> <a id="nav-link" class="nav-link" href="#">커뮤니티</a> </li>
			<li class="nav-item"> <a id="nav-link" class="nav-link" href="#">계정</a> </li>
			</ul>
          </div>
          <div class="card-accordion card-accordion-list-style card-accordion-icons-left card-margin" id="accordion-list-style" role="tablist" aria-multiselectable="true">
			<c:forEach var="item" items="${faqList }" varStatus="rowStatus">			
            <div class="card">
              <div class="card-header py-0 px-0" role="tab" id="headingOne2"> <a data-toggle="collapse" data-parent="#accordion-list-style" href="#collapseList${rowStatus.index}" aria-expanded="true" aria-controls="collapseOne" class="show">${item.title }</a> </div>
              <div id="collapseList${rowStatus.index}" class="collapse" role="tabpanel" aria-labelledby="headingOne1" data-parent="#accordion-list-style">
                <div class="card-body">${item.contents }</div>
              </div>
            </div>
           </c:forEach>
          </div>
          
          <!-- Pagination -->
         <nav aria-label="Page navigation">
          	<%-- ${RenderPagination} --%>
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
