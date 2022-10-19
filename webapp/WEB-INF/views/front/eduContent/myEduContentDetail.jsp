<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<body class="page page-shop header-compact-sticky page-shop-grid navbar-layout-navbar-below" style="font-family: 'Noto Sans KR', sans-serif !important;">
    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<style>
	th, td {
		vertical-align: middle;
	}
	.sort-style{
		margin : 0px 10px 0px 10px;
	}
	.tab3-div1{
		margin-left: 10px;
		margin-bottom:6px;
	}
	.tab3-div2{
		margin-left: 10px;
		font-size: 16px;
		margin-bottom: 20px;
	}
	.tab3-div3{
		margin-left: 10px;
		
	}
	.comment-wdate{
		margin-left : 17px;
		color : gray;
	}
	.empty-table{
		margin-top : 40px;
		font-size: 17px;
		color : gray;
	}
	#star a{
	   text-decoration: none;
	   color: gray;
	}
	  
	#star a.on{
	   color: #ffc108;
	}
	  
	#star {
	  	display: flex;
	  	align-items: center;
	}
</style>

<script type="text/javascript">
	$(function () {
		$(".sort-style").click(function() {
			var sortField = $(this).attr("id");
			var contentsSeq = $("#contentsSeq").val();
			console.log("sortField : "+sortField);
			console.log("contentsSeq : "+contentsSeq);
			$.ajax({
				type:"POST",
				data : {
					sortField : sortField
					, contentsSeq : contentsSeq
				},
				url: "./commentList",
				success:function(data){
					var commentList = data.commentList;
					console.log("commentList : "+commentList);
					var html ="";
		
					if(commentList != null){
						$.each(commentList, function(idx, val){ 
							html += "<tr><td><div class='tab3-div1'>";
		            		for(i = 0; i < val.score; i++){
		            			html += "<i class='fas fa-star text-warning'></i>";
		            		}
		            		html += "</div>";
		            		html += "<div class='tab3-div2'><span style='font-weight: bold;'>" + val.nickName +"</span><span class='comment-wdate'>" + val.wDate + "</span></div>";
		            		html += "<div class='tab3-div3'>" + val.contents +"</div></td></tr>";
					     });
					}
					$(".commentListTbody").html(html);
				},
				error:function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
	});
</script>

<!-- ======== @Region: #highlighted ======== -->
<div id="highlighted" style="font-family: 'Noto Sans KR', sans-serif !important;">
	<!-- Image Banner: Use the the data-bg-img functionality to create a simple image banner Use spacer classes to make the banner larger with padding, allows for easy responsive changes too see: elements-ctas.htm To make the banner full height/screen add the attributes: data-toggle="full-height" data-offset="#header"-->
	<div class="text-center text-lg-left py-5 py-lg-10 flex-valign"
		data-css='{"background-position":"center top","background-attachment":"fixed", "height":"300px", "background-color":"#003333"}'
		data-breakpoint="992">
		<!-- data-toggle="full-height" -->
		<div class="container">
			<div class="row justify-content-md-center"
				style="align-items: center;">
				<div class="col col-4" style="height: 250px"
					data-bg-img="<c:url value='/resources/theme/assets/img/backgrounds/computer-screens.jpg' />"
					data-css='{"background-position":"center right"}'></div>
				<div class="col-lg-6 py-5 pl-lg-4">
					<p class="text-white mb-2 op-8">${eduVO.cate1Name} >
						${eduVO.cate2Name}</p>
					<h2 class="text-white text-uppercase mt-0 mb-3 font-weight-bold">
						${eduVO.title}</h2>
					<hr class="mt-3 mb-5 hr-light op-2" />
					<p class="">
						<i class="fas fa-star text-warning"></i> <i
							class="fas fa-star text-warning"></i> <i
							class="fas fa-star text-warning"></i> <i
							class="fas fa-star text-warning"></i> <i
							class="fas fa-star-half-alt text-warning"></i>
					</p>
					<p class="text-white mb-0 op-8">${eduVO.author}</p>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- ======== @Region: #content ======== -->
<div id="content" class="pt-5 pb-6 bg-light pos-relative pos-zindex-10" style="font-family: 'Noto Sans KR', sans-serif !important;">
	<c:set var="commentYN" value="${commentYN}" />
	<div class="container">
		<div class="row">
			<!-- Main content -->
			<div class="col-lg-9 mb-3">
				<ul class="nav nav-tabs flex-column flex-lg-row" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#tab-1" role="tab">대시보드</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#tab-2" role="tab">후기</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content py-3">
					<div class="tab-pane active show" id="tab-1" role="tabpanel">
						<div class="card card-body">
							<h5 class="card-title text-teal op-6 mb-3">
								<i class="fas fa-check mr-2"></i>학습현황
							</h5>
							<div class="progress_div" style="display: flex; align-items: flex-end; justify-content: center;">
								<div class="percent" style="width: 10%;">
									<h3 class="text-teal">${progressPercent}%</h3>
								</div>
								<div class="progress mb-3" style="width: 80%;">
									<div
										class="progress-bar progress-bar-striped progress-bar-animated w-70"
										data-toggle="progress-bar-animated-progress"
										role="progressbar" aria-valuenow="${progressPercent}" aria-valuemin="0"
										aria-valuemax="100"></div>
								</div>
							</div>
							<div class="text-right">
								<p style="color: #6c757d; font-size: 14px; padding-right: 25px;">
									총 ${eduVO.classCount}강 중 ${completeCount}강을 수강했어요!</p>
							</div>
						</div>
					<div class="card card-body">
						<h5 class="card-title text-teal op-6 mb-3">
							<i class="fas fa-check mr-2"></i>강의 목록
						</h5>
						<table class="table mb-0">
							<colgroup>
								<col style="width: 5%">
								<col style="width: 10%">
								<col style="width: 65%">
								<col style="width: 10%">
								<col style="width: 10%">
							</colgroup>
							<tbody>
								<c:forEach var="item" items="${curiList}" varStatus="rowStatus">
									<tr>
										<td scope="row">${item.step}</td>
										<td>
											<i class="far fa-play-circle text-teal" onclick="window.open('./videoPlayer?seq=${item.seq}')" data-toggle="tooltip" data-original-title="강의 시청" style="font-size: 20px;">
											</i>
										</td>
										<td>${item.title}</td>
										<td>00:00:00</td>
										<c:choose>
											<c:when test="${item.completeYN ne null and item.completeYN ne Y}">
												<td><i class="fas fa-check text-teal"></i></td>
											</c:when>
											<c:otherwise>
												<td><i class="fas fa-check text-grey"></i></td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
								<c:if test="${empty curiList}">
					            	<td class="text-teal" colspan="4" style="text-align: center;">등록된 강의가 없습니다.</td>
					            </c:if>
							</tbody>
						</table>
					</div>
					</div>
				
				<!-- 후기 리스트  -->
				<div class="tab-pane" id="tab-2" role="tabpanel">
	              <div class="card card-body">
	              <h5 class="card-title text-teal op-6 mb-3">
	              	<span class="sort-style" id="timeDesc"><a href="#">최신순</a></span>
	              	<span class="sort-style" id="scoreDesc"><a href="#">별점높은순</a></span>
	              	<span class="sort-style" id="scoreAsc"><a href="#">별점낮은순</a></span>
	              </h5>
                 <table class="table mb-0">
	            	<colgroup>
						<col style="width:100%">
					</colgroup>
		            <tbody class="commentListTbody">
		            <c:if test="${empty commentList}"> 
		           		<tr><td><span class="empty-table">후기가 아직 없습니다.</span></td></tr>
		            </c:if>
		            <c:forEach var="item" items="${commentList}" varStatus="rowStatus">
	            	<tr>
		            	<td>
		            		<div class="tab3-div1">
		            			 <c:forEach var = "i" begin= "1" end = "${item.score }"><i class="fas fa-star text-warning"></i></c:forEach>
		            		</div>
		            		<div class="tab3-div2"><span style="font-weight: bold;">${item.nickName }</span><span class="comment-wdate">${item.wDate }</span></div>
		            		<div class="tab3-div3">${item.contents }</div>
		            	</td>
	            	</tr>
		            </c:forEach>
		           </tbody>
		           </table>
	           </div>
	            </div>
				</div>
          </div>
          
          <!-- 후기작성 모달 -->
          <button id="review-modal" class="btn btn-primary" data-toggle="modal" data-target=".example-modal-centered" style="display: none;">Modal Vertically Centered</button>
          <div class="modal fade example-modal-centered" tabindex="-1" role="dialog" aria-labelledby="myCenteredModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" style="font-family: 'Noto Sans KR', sans-serif !important;">
              <div class="modal-content">
                <div class="modal-header">
                  <h4 class="modal-title">
                    후기를 작성해주세요 <i class="fas fa-thumbs-up"></i>
                  </h4>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                </div>
                <form:form id="regForm"  modelAttribute="commentVO" onsubmit="return submit_comment()">
                	<form:input path="contentsSeq" type="hidden" value="${eduVO.seq }" id="contentsSeq" name="contentsSeq"/>
	                <div class="modal-body"> 
		               	<div class="form-group row">
				            <label for="example-text-input" class="col-sm-2 col-form-label">별 점</label>
				            <div class="col-sm-7" id="star">
				               <a href="#" value="1"><i class="fas fa-star mr-1"></i></a> <!-- 자식들-->
							   <a href="#" value="2"><i class="fas fa-star mr-1"></i></a>
							   <a href="#" value="3"><i class="fas fa-star mr-1"></i></a>
							   <a href="#" value="4"><i class="fas fa-star mr-1"></i></a>
							   <a href="#" value="5"><i class="fas fa-star mr-1"></i></a>
								<form:input path="score" type="hidden" id="score" name="score"/>
				            </div>
				          </div>
				          <div class="form-group row">
				            <label for="example-text-input" class="col-sm-2 col-form-label">내 용</label>
				            <div class="col-sm-10">
				              <form:textarea path="contents" rows="10" class="form-control" type="text" id="contents" name="contents"/>
				            </div>
			          	</div>
	                </div>
	                
	                <div class="modal-footer">
	                  <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	                  <button type="submit" class="btn btn-primary">등록</button>
	<!--                   <button type="button" class="btn btn-primary" id="submit-comment" onclick="submit-comment()">등록</button> -->
	                </div>
                </form:form>
              </div>
            </div>
          </div>
          
          
        <!-- Sidebar content -->
        <div class="col-lg-3 mb-4 mb-lg-0 px-lg-0 mt-lg-0">
          <div data-settings='{"parent":"#content","mind":"#header","top":10,"breakpoint":992}' data-toggle="sticky">
            <div class="bg-white mb-3 pb-3 bg-shadow">
              <h4 class="px-3 py-4 op-5 m-0">
                ${eduVO.title}
              </h4>
              <hr class="m-0">
              <div class="pos-relative px-3 py-3">
              	<p class="mb-0 text-sm">
              		강사: ${eduVO.author}
              	</p>
              	<p class="mb-0 text-sm">
              		총 ${eduVO.classCount}개 강의
              	</p>
              	<p class="mb-0 text-sm">
              		난이도: ${eduVO.difficulty}
              	</p>
              	<p class="mb-0 text-sm">
              		${eduVO.serviceType}
              	</p>
              </div>
              
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>

  $(document).ready(function() {
	  var commentYN='<c:out value="${commentYN}"/>';
	  if(commentYN == 'N') {
	  	document.getElementById("review-modal").click();
	  }
  });
  
	function submit_comment(){
		
		if(document.getElementById('score').value == 0){
			alert("별점을 선택하세요.");
			return false;
		}else{
			return true;
		}
		
		document.getElementById('regForm').submit();
		console.log("submit");
		$('#regForm').reset()
	}
	
	$('#star a').click(function(){ 
		 $(this).parent().children("a").removeClass("on");    
		 $(this).addClass("on").prevAll("a").addClass("on");
		 console.log($(this).attr("value"));
		 document.getElementById('score').value = $(this).attr("value");
	 });
	
	function goVideoPlayer(){
		 var link = './videoPlayer=${item.seq}';
		 var winpop = window.open(link);  
		 winpop.focus();
	}
</script>