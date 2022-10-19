<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="main-content">
	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					<span>정보수정요청 상세보기</span>
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
					<div class="form-horizontal">
						<div class="form-group">
							<label class='control-label col-xs-12'>제목</label>
							<div class='col-xs-28'>
								<input class="form-control" type="text" value="${item['제목']}" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class='control-label col-xs-12'>이름</label>
							<div class='col-xs-28'>
								<input class="form-control" type="text" value="${item['이름']}" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class='control-label col-xs-12'>전화번호</label>
							<div class='col-xs-28'>
								<input class="form-control" type="text" value="${item['전화번호']}" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class='control-label col-xs-12'>이메일</label>
							<div class='col-xs-28'>
								<input class="form-control" type="text" value="${item['이메일']}" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class='control-label col-xs-12'>등록일</label>
							<div class='col-xs-28'>
								<input class="form-control" type="text" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${item['등록일']}" />" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label class='control-label col-xs-12'>요청내용</label>
							<div class='col-xs-28'>
								<textarea class="form-control" readonly="readonly">${item['요청내용']}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label class='control-label col-xs-12'>이미지 미리보기</label>
							<div class='col-xs-28'>
								<img alt="" src="<c:url value='/data/uploads/upload/requestUpdate/${item[\'파일명\']}'/>">
							</div>
						</div>
					</div><!-- form-horizontal -->
				</div><!-- widget-main -->
			</div><!-- widget-body -->
		</div><!-- widget-box -->

	</div><!-- page-content -->
</div><!-- main-content -->
