<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


 <div id="content">
    <div class="container">
      <div class="row">
        <!-- sidebar -->
        <div class="col-md-3">

          <!-- Sections Menu-->
          <div class="nav-section-menu">
            <div class="nav nav-list">
              <a href="about.html" class="nav-link first"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
               	공지사항</font></font>
                <i class="fa fa-angle-right"></i>
              </a>
              <a href="about-extended.html" class="nav-link"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                1:1문의</font></font>
                <i class="fa fa-angle-right"></i>
              </a>
              <a href="about-me.html" class="nav-link"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                FAQ</font></font>
                <i class="fa fa-angle-right"></i>
              </a>
            </div>
          </div>
        </div>
        <!--main content-->
        <div class="col-md-9">
          <h2 class="title-divider">
            <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> 공지사항 </font></font></span>
          </h2>
          <div class="row">
            <div class="col-md-6">
              <form id="contact-form" action="#" role="form">
                <div class="form-group">
                  <label class="sr-only" for="contact-name"></label>
                  <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">제목</font></font> 
                  <input type="text" class="form-control" id="contact-name" placeholder="">
                </div>
                <div class="form-group">
                  <label class="sr-only" for="contact-email"></label>
                  <font style="vertical-align: inherit;"><font style="vertical-align: inherit;">첨부파일</font></font>
                  <input type="email" class="form-control" id="contact-email" placeholder="">
                  <button id="fileUpload">찾아보기</button>
                </div>
                <div class="form-group">
                  <label class="sr-only" for="contact-message"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">메시지</font></font></label>
                  <textarea rows="12" class="form-control" id="contact-message" placeholder=""></textarea>
                </div>
                <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><input type="button" class="btn btn-primary" value="확인"></font></font>
              </form>
            </div>
          </div>
        </div>
    </div>
  </div>