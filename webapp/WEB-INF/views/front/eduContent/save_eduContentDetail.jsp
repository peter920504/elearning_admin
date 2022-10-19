<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- ======== @Region: #highlighted ======== -->
  <div id="highlighted" style="font-family: 'Noto Sans KR', sans-serif !important;">
    <!-- Image Banner: Use the the data-bg-img functionality to create a simple image banner Use spacer classes to make the banner larger with padding, allows for easy responsive changes too see: elements-ctas.htm To make the banner full height/screen add the attributes: data-toggle="full-height" data-offset="#header"-->
    <%-- <div class="bg-white text-center text-lg-left py-5 py-lg-10 flex-valign" data-bg-img="<c:url value='/resources/theme/assets/img/backgrounds/computer-screens.jpg' />" data-css='{"background-position":"center top","background-attachment":"fixed"' data-toggle="full-height" data-breakpoint="992"> --%>
    <div class="text-center text-lg-left py-5 py-lg-10 flex-valign" data-css='{"background-position":"center top","background-attachment":"fixed", "height":"300px", "background-color":"#003333"}' data-breakpoint="992"> <!-- data-toggle="full-height" -->
      <%-- 
      <div data-toggle="sticky" data-settings='{"persist":true,"breakpoint":992}' class="pos-t-auto">
        <div class="container pt-6 text-center" data-scroll="scrollax">
          <h2 class="display-4 text-white mb-0 w-100 w-lg-50 mx-auto font-weight-bold" data-animate="fadeIn" data-animate-delay="0.2">
            Learn, Share, Build
          </h2>
          <p class="text-white lead w-100 w-lg-60 mx-auto mb-md-6">Delicata expetendis cu per. Quo cibo deserunt periculis at, ponderum lucilius ad pri. Est no iudico labores expetenda. </p>
          <form class="row mb-2 w-100 w-lg-70 align-items-center mx-auto" data-animate="fadeIn" data-animate-delay="0.4">
            <div class="input-group input-group-lg input-group-rounded mb-3">
              <div class="input-group-prepend" id="sizing-addon1">
              </div>
            </div>
          </form>
        </div>
      </div>
      --%>
      <div class="container">
      <div class="row justify-content-md-center" style="align-items:center;">
      	<div class="col col-4" style="height:250px" data-bg-img="<c:url value='/resources/theme/assets/img/backgrounds/computer-screens.jpg' />" data-css='{"background-position":"center right"}'>
      	</div>
				<div class="col-lg-6 py-5 pl-lg-4">
					<p class="text-white mb-2 op-8">
						대분류 > 중분류
					</p>
					<h2 class="text-white text-uppercase mt-0 mb-3 font-weight-bold">
						JAVA 기초
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
						홍길동
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
					<%-- 
		            <thead>
		              <tr>
		                <th>차수</th>
		                <th>강의제목</th>
		                <th>시간</th>
		              </tr>
		            </thead>
		            --%>
		            <tbody>
		              <tr>
		                <td scope="row">1</th>
		                <td>자바언어 설명, 설치</td>
		                <td>23:53</td>
		              </tr>
		              <tr>
		                <td scope="row">2</th>
		                <td>변수</td>
		                <td>20:27</td>
		              </tr>
		              <tr>
		                <td scope="row">3</th>
		                <td>연산자</td>
		                <td>32:57</td>
		              </tr>
		              <tr>
		                <td scope="row">4</th>
		                <td>글자수 긴 강의제목 글자수 긴 강의제목 글자수 긴 강의제목</td>
		                <td>1:20:56</td>
		              </tr>
		              <tr>
		                <td scope="row">5</th>
		                <td>글자수 긴 강의제목 글자수 긴 강의제목 글자수 긴 강의제목 글자수 긴 강의제목 글자수 긴 강의제목</td>
		                <td>1:20:56</td>
		              </tr>
		            </tbody>
		          </table>
	          </div>
            </div>
            <div class="tab-pane" id="tab-3" role="tabpanel">
              <h4>
                Tab 3 Content
              </h4>
            </div>
          </div>
        	<%--
          <div class="row text-left mb-5">
            <div class="col-lg-6 mb-3 mb-sm-0">
              <select class="form-control form-control-lg bg-white bg-op-9 text-sm w-lg-50" data-toggle="select">
                <option> Categories </option>
                <option> Learn </option>
                <option> Share </option>
                <option> Build </option>
              </select>
            </div>
            <div class="col-lg-6 text-lg-right">
              <select class="form-control form-control-lg bg-white bg-op-9 ml-auto text-sm w-lg-50" data-toggle="select">
                <option> Filter by </option>
                <option> Votes </option>
                <option> Replys </option>
                <option> Views </option>
              </select>
            </div>
          </div>
          <!-- End of post 1 -->
          <div class="card row-hover pos-relative py-3 px-3 mb-3 border-warning border-top-0 border-right-0 border-bottom-0 rounded-0">
            <div class="row align-items-center">
              <div class="col-md-8 mb-3 mb-sm-0">
                <h5>
                  <a href="#" class="text-primary">Drupal 8 quick starter guide</a>
                </h5>
                <p class="text-sm"><span class="op-6">Posted</span> <a class="text-black" href="#">20 minutes</a> <span class="op-6">ago by</span> <a class="text-black" href="#">KenyeW</a></p>
                <div class="text-sm op-5"> <a class="text-black mr-2" href="#">#C++</a> <a class="text-black mr-2" href="#">#AppStrap Theme</a> <a class="text-black mr-2" href="#">#Wordpress</a> </div>
              </div>
              <div class="col-md-4 op-7">
                <div class="row text-center op-7">
                  <div class="col px-1"> <i class="ion-connection-bars icon-1x"></i> <span class="d-block text-sm">141 Votes</span> </div>
                  <div class="col px-1"> <i class="ion-ios-chatboxes-outline icon-1x"></i> <span class="d-block text-sm">122 Replys</span> </div>
                  <div class="col px-1"> <i class="ion-ios-eye-outline icon-1x"></i> <span class="d-block text-sm">290 Views</span> </div>
                </div>
              </div>
            </div>
          </div>
          <!-- /End of post 1 -->
          <!-- End of post 2 -->
          <div class="card row-hover pos-relative py-3 px-3 mb-3 border-primary border-top-0 border-right-0 border-bottom-0 rounded-0">
            <div class="row align-items-center">
              <div class="col-md-8 mb-3 mb-sm-0">
                <h5>
                  <a href="#" class="text-primary">HELP! My Windows XP machine is down</a>
                </h5>
                <p class="text-sm"><span class="op-6">Posted</span> <a class="text-black" href="#">54 minutes</a> <span class="op-6">ago by</span> <a class="text-black" href="#">DanielD</a></p>
                <div class="text-sm op-5"> <a class="text-black mr-2" href="#">#Development</a> <a class="text-black mr-2" href="#">#AppStrap Theme</a> </div>
              </div>
              <div class="col-md-4 op-7">
                <div class="row text-center op-7">
                  <div class="col px-1"> <i class="ion-connection-bars icon-1x"></i> <span class="d-block text-sm">256 Votes</span> </div>
                  <div class="col px-1"> <i class="ion-ios-chatboxes-outline icon-1x"></i> <span class="d-block text-sm">251 Replys</span> </div>
                  <div class="col px-1"> <i class="ion-ios-eye-outline icon-1x"></i> <span class="d-block text-sm">223 Views</span> </div>
                </div>
              </div>
            </div>
          </div>
          <!-- /End of post 2 -->
          <!-- End of post 3 -->
          <div class="card row-hover pos-relative py-3 px-3 mb-3 border-primary border-top-0 border-right-0 border-bottom-0 rounded-0">
            <div class="row align-items-center">
              <div class="col-md-8 mb-3 mb-sm-0">
                <h5>
                  <a href="#" class="text-primary">Bootstrap 4 development in record time with AppStrap Bootstrap 4 Theme</a>
                </h5>
                <p class="text-sm"><span class="op-6">Posted</span> <a class="text-black" href="#">32 minutes</a> <span class="op-6">ago by</span> <a class="text-black" href="#">AppStrapMaster</a></p>
                <div class="text-sm op-5"> <a class="text-black mr-2" href="#">#Bootstrap 4</a> <a class="text-black mr-2" href="#">#Wordpress</a> </div>
              </div>
              <div class="col-md-4 op-7">
                <div class="row text-center op-7">
                  <div class="col px-1"> <i class="ion-connection-bars icon-1x"></i> <span class="d-block text-sm">245 Votes</span> </div>
                  <div class="col px-1"> <i class="ion-ios-chatboxes-outline icon-1x"></i> <span class="d-block text-sm">116 Replys</span> </div>
                  <div class="col px-1"> <i class="ion-ios-eye-outline icon-1x"></i> <span class="d-block text-sm">257 Views</span> </div>
                </div>
              </div>
            </div>
          </div>
          <!-- /End of post 3 -->
          <!-- End of post 4 -->
          <div class="card row-hover pos-relative py-3 px-3 mb-3 border-warning border-top-0 border-right-0 border-bottom-0 rounded-0">
            <div class="row align-items-center">
              <div class="col-md-8 mb-3 mb-sm-0">
                <h5>
                  <a href="#" class="text-primary">Bootstrap 4 development in record time with AppStrap Bootstrap 4 Theme</a>
                </h5>
                <p class="text-sm"><span class="op-6">Posted</span> <a class="text-black" href="#">29 minutes</a> <span class="op-6">ago by</span> <a class="text-black" href="#">Themelize.me</a></p>
                <div class="text-sm op-5"> <a class="text-black mr-2" href="#">#Android</a> <a class="text-black mr-2" href="#">#Bootstrap 4</a> <a class="text-black mr-2" href="#">#Wordpress</a> <a class="text-black mr-2" href="#">#Drupal</a> </div>
              </div>
              <div class="col-md-4 op-7">
                <div class="row text-center op-7">
                  <div class="col px-1"> <i class="ion-connection-bars icon-1x"></i> <span class="d-block text-sm">49 Votes</span> </div>
                  <div class="col px-1"> <i class="ion-ios-chatboxes-outline icon-1x"></i> <span class="d-block text-sm">29 Replys</span> </div>
                  <div class="col px-1"> <i class="ion-ios-eye-outline icon-1x"></i> <span class="d-block text-sm">170 Views</span> </div>
                </div>
              </div>
            </div>
          </div>
          <!-- /End of post 4 -->
          <!-- End of post 5 -->
          <div class="card row-hover pos-relative py-3 px-3 mb-3 border-primary border-top-0 border-right-0 border-bottom-0 rounded-0">
            <div class="row align-items-center">
              <div class="col-md-8 mb-3 mb-sm-0">
                <h5>
                  <a href="#" class="text-primary">Drupal 8 quick starter guide</a>
                </h5>
                <p class="text-sm"><span class="op-6">Posted</span> <a class="text-black" href="#">53 minutes</a> <span class="op-6">ago by</span> <a class="text-black" href="#">Themelize.me</a></p>
                <div class="text-sm op-5"> <a class="text-black mr-2" href="#">#iOS</a> <a class="text-black mr-2" href="#">#Bootstrap 4</a> </div>
              </div>
              <div class="col-md-4 op-7">
                <div class="row text-center op-7">
                  <div class="col px-1"> <i class="ion-connection-bars icon-1x"></i> <span class="d-block text-sm">164 Votes</span> </div>
                  <div class="col px-1"> <i class="ion-ios-chatboxes-outline icon-1x"></i> <span class="d-block text-sm">82 Replys</span> </div>
                  <div class="col px-1"> <i class="ion-ios-eye-outline icon-1x"></i> <span class="d-block text-sm">240 Views</span> </div>
                </div>
              </div>
            </div>
          </div>
          <!-- /End of post 5 -->
          <!-- End of post 6 -->
          <div class="card row-hover pos-relative py-3 px-3 mb-3 border-danger border-top-0 border-right-0 border-bottom-0 rounded-0">
            <div class="row align-items-center">
              <div class="col-md-8 mb-3 mb-sm-0">
                <h5>
                  <a href="#" class="text-primary">Custom shortcut or command to launch command in terminal?</a>
                </h5>
                <p class="text-sm"><span class="op-6">Posted</span> <a class="text-black" href="#">44 minutes</a> <span class="op-6">ago by</span> <a class="text-black" href="#">DanielD</a></p>
                <div class="text-sm op-5"> <a class="text-black mr-2" href="#">#Development</a> <a class="text-black mr-2" href="#">#C++</a> <a class="text-black mr-2" href="#">#Bootstrap 4</a> </div>
              </div>
              <div class="col-md-4 op-7">
                <div class="row text-center op-7">
                  <div class="col px-1"> <i class="ion-connection-bars icon-1x"></i> <span class="d-block text-sm">180 Votes</span> </div>
                  <div class="col px-1"> <i class="ion-ios-chatboxes-outline icon-1x"></i> <span class="d-block text-sm">35 Replys</span> </div>
                  <div class="col px-1"> <i class="ion-ios-eye-outline icon-1x"></i> <span class="d-block text-sm">44 Views</span> </div>
                </div>
              </div>
            </div>
          </div>
          <!-- /End of post 6 -->
          <!-- End of post 7 -->
          <div class="card row-hover pos-relative py-3 px-3 mb-3 border-primary border-top-0 border-right-0 border-bottom-0 rounded-0">
            <div class="row align-items-center">
              <div class="col-md-8 mb-3 mb-sm-0">
                <h5>
                  <a href="#" class="text-primary">HELP! My Windows XP machine is down</a>
                </h5>
                <p class="text-sm"><span class="op-6">Posted</span> <a class="text-black" href="#">3 minutes</a> <span class="op-6">ago by</span> <a class="text-black" href="#">DanielD</a></p>
                <div class="text-sm op-5"> <a class="text-black mr-2" href="#">#C++</a> <a class="text-black mr-2" href="#">#AppStrap Theme</a> <a class="text-black mr-2" href="#">#Drupal</a> </div>
              </div>
              <div class="col-md-4 op-7">
                <div class="row text-center op-7">
                  <div class="col px-1"> <i class="ion-connection-bars icon-1x"></i> <span class="d-block text-sm">236 Votes</span> </div>
                  <div class="col px-1"> <i class="ion-ios-chatboxes-outline icon-1x"></i> <span class="d-block text-sm">79 Replys</span> </div>
                  <div class="col px-1"> <i class="ion-ios-eye-outline icon-1x"></i> <span class="d-block text-sm">162 Views</span> </div>
                </div>
              </div>
            </div>
          </div>
          <!-- /End of post 7 -->
          <!-- End of post 8 -->
          <div class="card row-hover pos-relative py-3 px-3 mb-3 border-primary border-top-0 border-right-0 border-bottom-0 rounded-0">
            <div class="row align-items-center">
              <div class="col-md-8 mb-3 mb-sm-0">
                <h5>
                  <a href="#" class="text-primary">Bootstrap 4 development in record time with AppStrap Bootstrap 4 Theme</a>
                </h5>
                <p class="text-sm"><span class="op-6">Posted</span> <a class="text-black" href="#">46 minutes</a> <span class="op-6">ago by</span> <a class="text-black" href="#">DanielD</a></p>
                <div class="text-sm op-5"> <a class="text-black mr-2" href="#">#Development</a> <a class="text-black mr-2" href="#">#C++</a> <a class="text-black mr-2" href="#">#Drupal</a> </div>
              </div>
              <div class="col-md-4 op-7">
                <div class="row text-center op-7">
                  <div class="col px-1"> <i class="ion-connection-bars icon-1x"></i> <span class="d-block text-sm">130 Votes</span> </div>
                  <div class="col px-1"> <i class="ion-ios-chatboxes-outline icon-1x"></i> <span class="d-block text-sm">121 Replys</span> </div>
                  <div class="col px-1"> <i class="ion-ios-eye-outline icon-1x"></i> <span class="d-block text-sm">191 Views</span> </div>
                </div>
              </div>
            </div>
          </div>
          <!-- /End of post 8 -->
          <!-- End of post 9 -->
          <div class="card row-hover pos-relative py-3 px-3 mb-3 border-primary border-top-0 border-right-0 border-bottom-0 rounded-0">
            <div class="row align-items-center">
              <div class="col-md-8 mb-3 mb-sm-0">
                <h5>
                  <a href="#" class="text-primary">HELP! My Windows XP machine is down</a>
                </h5>
                <p class="text-sm"><span class="op-6">Posted</span> <a class="text-black" href="#">41 minutes</a> <span class="op-6">ago by</span> <a class="text-black" href="#">KylieJ</a></p>
                <div class="text-sm op-5"> <a class="text-black mr-2" href="#">#Android</a> <a class="text-black mr-2" href="#">#Bootstrap 4</a> <a class="text-black mr-2" href="#">#Wordpress</a> </div>
              </div>
              <div class="col-md-4 op-7">
                <div class="row text-center op-7">
                  <div class="col px-1"> <i class="ion-connection-bars icon-1x"></i> <span class="d-block text-sm">194 Votes</span> </div>
                  <div class="col px-1"> <i class="ion-ios-chatboxes-outline icon-1x"></i> <span class="d-block text-sm">16 Replys</span> </div>
                  <div class="col px-1"> <i class="ion-ios-eye-outline icon-1x"></i> <span class="d-block text-sm">113 Views</span> </div>
                </div>
              </div>
            </div>
          </div>
          <!-- /End of post 9 -->
          <!-- End of post 10 -->
          <div class="card row-hover pos-relative py-3 px-3 mb-3 border-primary border-top-0 border-right-0 border-bottom-0 rounded-0">
            <div class="row align-items-center">
              <div class="col-md-8 mb-3 mb-sm-0">
                <h5>
                  <a href="#" class="text-primary">HELP! My Windows XP machine is down</a>
                </h5>
                <p class="text-sm"><span class="op-6">Posted</span> <a class="text-black" href="#">30 minutes</a> <span class="op-6">ago by</span> <a class="text-black" href="#">AppStrapMaster</a></p>
                <div class="text-sm op-5"> <a class="text-black mr-2" href="#">#Android</a> <a class="text-black mr-2" href="#">#AppStrap Theme</a> <a class="text-black mr-2" href="#">#Wordpress</a> </div>
              </div>
              <div class="col-md-4 op-7">
                <div class="row text-center op-7">
                  <div class="col px-1"> <i class="ion-connection-bars icon-1x"></i> <span class="d-block text-sm">179 Votes</span> </div>
                  <div class="col px-1"> <i class="ion-ios-chatboxes-outline icon-1x"></i> <span class="d-block text-sm">194 Replys</span> </div>
                  <div class="col px-1"> <i class="ion-ios-eye-outline icon-1x"></i> <span class="d-block text-sm">167 Views</span> </div>
                </div>
              </div>
            </div>
          </div>
          <!-- /End of post 10 -->
			 --%>
          
          
        </div>
        <!-- Sidebar content -->
        <div class="col-lg-3 mb-4 mb-lg-0 px-lg-0 mt-lg-0">
          <div data-settings='{"parent":"#content","mind":"#header","top":10,"breakpoint":992}' data-toggle="sticky">
            <div class="bg-white mb-3 pb-3 bg-shadow">
              <h4 class="px-3 py-4 op-5 m-0">
                JAVA 기초
              </h4>
              <hr class="m-0">
              <div class="pos-relative px-3 py-3">
              <%--
                <h6 class="text-primary text-sm">
                  <a href="#" class="text-primary">Why Bootstrap 4 is so awesome? </a>
                </h6>
                <p class="mb-0 text-sm"><span class="op-6">Posted</span> <a class="text-black" href="#">39 minutes</a> <span class="op-6">ago by</span> <a class="text-black" href="#">AppStrapMaster</a></p>
              --%>
              	<p class="mb-0 text-sm">
              		강사: 홍길동
              	</p>
              	<p class="mb-0 text-sm">
              		총 30개 강의
              	</p>
              	<p class="mb-0 text-sm">
              		난이도: 초급
              	</p>
              	<p class="mb-0 text-sm">
              		무료
              	</p>
              </div>
              <div class="pos-relative px-3" style="text-align: end;">
              	<a href="#" class="h3 text-warning" data-toggle="tooltip" data-original-title="장바구니에 담기"><i class="fa fa-cart-plus mr-2"></i></a>
              	<a href="#" class="h3 text-danger" data-toggle="tooltip" data-original-title="좋아요 목록에 담기"><i class="far fa-heart mr-2"></i></a>
              </div>
              
            </div>
            
            <a class="btn btn-teal btn-block py-3 mb-3 bg-op-6 roboto-bold" style="font-size: 17px; border-radius:3px" href="#">수강신청</a>
            <%-- 
            <div class="bg-white text-sm">
              <h4 class="px-3 py-4 op-5 m-0 roboto-bold">
                Stats
              </h4>
              <hr class="my-0">
              <div class="row text-center d-flex flex-row op-7 mx-0">
                <div class="col-sm-6 flex-ew text-center py-3 border-bottom border-right"> <a class="d-block lead font-weight-bold" href="#">58</a> Topics </div>
                <div class="col-sm-6 col flex-ew text-center py-3 border-bottom mx-0"> <a class="d-block lead font-weight-bold" href="#">1.856</a> Posts </div>
              </div>
              <div class="row d-flex flex-row op-7">
                <div class="col-sm-6 flex-ew text-center py-3 border-right mx-0"> <a class="d-block lead font-weight-bold" href="#">300</a> Members </div>
                <div class="col-sm-6 flex-ew text-center py-3 mx-0"> <a class="d-block lead font-weight-bold" href="#">DanielD</a> Newest Member </div>
              </div>
            </div>
            --%>

          </div>
        </div>
      </div>
    </div>
  </div>