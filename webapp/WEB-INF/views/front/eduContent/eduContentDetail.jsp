<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
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
		padding-top : 40px;
		font-size: 17px;
		color : gray;
	}

</style>

<script type="text/javascript">
//Show notification
const showNotification = () => {
//function showNotification() {
	var notification = document.getElementById('notification-container');
    notification.classList.add('show')
    setTimeout(() => {
      notification.classList.remove('show')
    }, 3000)
};

//Show notification
const showNotification2 = () => {
//function showNotification() {
	var notification = document.getElementById('notification-container3');
    notification.classList.add('show')
    setTimeout(() => {
      notification.classList.remove('show')
    }, 3000)
};

// Show notification
const showNotification3 = () => {
//function showNotification() {
	var notification = document.getElementById('notification-container4');
    notification.classList.add('show')
    setTimeout(() => {
      notification.classList.remove('show')
    }, 3000)
};

//Show notification
const showNotification4 = () => {
//function showNotification() {
	var notification = document.getElementById('notification-container5');
    notification.classList.add('show')
    setTimeout(() => {
      notification.classList.remove('show')
    }, 3000)
};

function addWishList(itemSeq){
	$.ajax({
		async: false,
		type : "POST",
		url : "../../account/addWish",
		data : {conSeq:itemSeq}, 
		success : function(data) {
			if(data > 0) {
				showNotification2();
				
				setTimeout(function(){
					location.reload();
				},2000);
			}
		},
		error : function(request, error) { 
	   		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
	});
}

function delWishList(itemSeq){
	$.ajax({
		async: false,
		type : "POST",
		url : "../../account/delWish",
		data : {conSeq:itemSeq}, 
		success : function(data) {
			if(data > 0) {
				showNotification3();
				
				setTimeout(function(){
					location.reload();
				},2000);
			}
		},
		error : function(request, error) { 
	   		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
	});
}

function addCartList(itemSeq){
	$.ajax({
		async: false,
		type : "POST",
		url : "../../account/addCart",
		data : {conSeq:itemSeq}, 
		success : function(data) {
			if(data > 0) {
				showNotification4();
				
				setTimeout(function(){
					location.href="<c:url value='/account/cart?seq='/>" + '${sessionId.seq}';
				},2000);
			}
		},
		error : function(request, error) { 
	   		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
	});
}

function insertMyCon(itemSeq) {
	$.ajax({
		type : "GET",
		url : "../edu/insertMyContent?conSeq="+itemSeq,
		dataType: 'json',
		success : function(data) {
			
			if(data > 0) {
				showNotification();
				
				setTimeout(function(){
					location.href="<c:url value='/edu/myEduContent?seq='/>" + itemSeq;
				},2000);
			}
		}
	});
}

function recentlist(sort){
	$('#tab-3').load(location.href+' #tab-3');
}


$(function () {
	$(".sort-style").click(function() {
		var sortField = $(this).attr("id");
		var contentsSeq = ${eduVO.seq};
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
<!DOCTYPE html>
<!-- ======== @Region: #highlighted ======== -->
  <div id="highlighted" style="font-family: 'Noto Sans KR', sans-serif !important;">
    <!-- Image Banner: Use the the data-bg-img functionality to create a simple image banner Use spacer classes to make the banner larger with padding, allows for easy responsive changes too see: elements-ctas.htm To make the banner full height/screen add the attributes: data-toggle="full-height" data-offset="#header"-->
    <%-- <div class="bg-white text-center text-lg-left py-5 py-lg-10 flex-valign" data-bg-img="<c:url value='/resources/theme/assets/img/backgrounds/computer-screens.jpg' />" data-css='{"background-position":"center top","background-attachment":"fixed"' data-toggle="full-height" data-breakpoint="992"> --%>
    <div class="text-center text-lg-left py-5 py-lg-10 flex-valign" data-css='{"background-position":"center top","background-attachment":"fixed", "height":"300px", "background-color":"#003333"}' data-breakpoint="992"> <!-- data-toggle="full-height" -->
      <div class="container">
      <div class="row justify-content-md-center" style="align-items:center;">
      	<div class="col col-4" style="height:250px" data-bg-img="<c:url value='/resources/theme/assets/img/backgrounds/computer-screens.jpg' />" data-css='{"background-position":"center right"}'>
      	</div>
				<div class="col-lg-6 py-5 pl-lg-4">
					<p class="text-white mb-2 op-8">
						${eduVO.cate1Name} > ${eduVO.cate2Name}
					</p>
					<h2 class="text-white text-uppercase mt-0 mb-3 font-weight-bold">
						${eduVO.title}
					</h2>
					<hr class="mt-3 mb-5 hr-light op-2" />
					<p class="">
						<i class="fas fa-star text-warning"></i>
						<i class="fas fa-star text-warning"></i>
						<i class="fas fa-star text-warning"></i>
						<i class="fas fa-star text-warning"></i>
						<i class="fas fa-star-half-alt text-warning"></i>
					</p>
					<p class="text-white mb-0 op-8">
						${eduVO.author}
					</p>
				</div>
      </div>
      </div>
    </div>
  </div>

  <!-- ======== @Region: #content ======== -->
  <div id="content" class="pt-5 pb-6 bg-light pos-relative pos-zindex-10" style="font-family: 'Noto Sans KR', sans-serif !important;">
    <div class="container">
      <div class="row">
        <!-- Main content -->
        <div class="col-lg-9 mb-3">
        	<ul class="nav nav-tabs flex-column flex-lg-row" role="tablist">
	            <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#tab-1" role="tab">강의소개</a> </li>
	            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#tab-2" role="tab">커리큘럼</a> </li>
	            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#tab-3" role="tab">후기</a> </li>
          	</ul>
          <!-- Tab panes -->
          <div class="tab-content py-3">
            <div class="tab-pane active show" id="tab-1" role="tabpanel">
              <div class="card card-body">
	            <h5 class="card-title text-teal op-6">
	              <i class="fas fa-check mr-2"></i>컨텐츠 요약
	            </h5>
	            <p class="card-text px-3">웹페이지 개발에 있어서 사용자 눈에 보이지 않는 데이터를 사용해 웹 서비스를 구축하기 위해 JAVA를 학습합니다.</p>
	          </div>
	          <div class="card card-body">
	            <h5 class="card-title text-teal op-6">
	              <i class="fas fa-check mr-2"></i>컨텐츠 설명
	            </h5>
	            <p class="card-text px-3">
	            	초보자도 쉽게 배울 수 있도록 구성한 실습 위주의 강의입니다.</br>
	            	- 자바 기본 문법 (변수, 연산자, 배열, 조건문, 반복문, 예외처리 등) </br>
	         		- 객체지향 프로그래밍이란?</br>
	         		- 상속, 다형성, 추상화, 인터페이스 등</br>
	         		- 쓰레드와 패턴</br>
	            </p>
	          </div>
            </div>
            <div class="tab-pane" id="tab-2" role="tabpanel">
              <div class="card card-body">
	            <h5 class="card-title text-teal op-6 mb-3">
	              <i class="fas fa-check mr-2"></i>강의 목록
	            </h5>
	            <table class="table mb-0">
	            	<colgroup>
						<col style="width:10%">
						<col style="width:70%">
						<col style="width:20%">
					</colgroup>
		            <tbody>
		            <c:forEach var="item" items="${curiList}" varStatus="rowStatus">
		            	<tr>
		            		<td scope="row">${item.step}</td>
		            		<td>${item.title}</td>
		            		<td>00:00:00</td>
		            	</tr>
		            </c:forEach>
		            <c:if test="${empty curiList}">
		            	<td class="text-teal" colspan="3" style="text-align: center;">등록된 강의가 없습니다.</td>
		            </c:if>
		            </tbody>
		          </table>
	          </div>
            </div>
            <div class="tab-pane" id="tab-3" role="tabpanel">
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
              <div class="pos-relative px-3" style="text-align: end;">
              <c:if test = "${sessionId != null }">
              	<c:if test="${resultCart ne 1}">
              		<a href="javascript:addCartList('${eduVO.seq}')" class="h3 text-warning" data-toggle="tooltip" data-original-title="장바구니에 담기"><i class="fa fa-cart-plus mr-2"></i></a>
            	</c:if>
            	<c:if test="${resultLike ne 1}">
            		<a href="javascript:addWishList('${eduVO.seq}')" class="h3 text-danger" data-toggle="tooltip" data-original-title="좋아요 목록에 담기"><i class="far fa-heart mr-2"></i></a>
            	</c:if>
             	<c:if test="${resultLike eq 1}">
             		<a href="javascript:delWishList('${eduVO.seq}')" class="h3 text-danger" data-toggle="tooltip" data-original-title="좋아요 취소하기"><i class="fas fa-heart mr-2"></i></a>
             	</c:if>
             </c:if>
             <c:if test = "${sessionId == null }">
             	<a href="<c:url value='/account/login'/>" class="h3 text-warning" data-toggle="tooltip" data-original-title="장바구니에 담기"><i class="fa fa-cart-plus mr-2"></i></a>
             	<a href="<c:url value='/account/login'/>" class="h3 text-danger" data-toggle="tooltip" data-original-title="좋아요 목록에 담기"><i class="far fa-heart mr-2"></i></a>
             </c:if>
              </div>
              
            </div>
            
           		<c:if test="${resultIsMy ne 1}">
           			<a href="javascript:insertMyCon(${eduVO.seq})" class="btn btn-teal btn-block py-3 mb-3 bg-op-6 roboto-bold" style="font-size: 17px; border-radius:3px">수강신청</a>
           		</c:if>
            	<c:if test="${resultIsMy eq 1}">
            		<a href="<c:url value='/edu/myEduContent?seq=${eduVO.seq}'/>" class="btn btn-teal btn-block py-3 mb-3 bg-op-6 roboto-bold" style="font-size: 17px; border-radius:3px">강의 들으러가기</a>
            	</c:if>
            
          </div>
        </div>
      </div>
    </div>
  </div>