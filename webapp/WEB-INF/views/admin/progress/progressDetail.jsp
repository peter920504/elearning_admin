<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="main-content">
	<div class="page-content">
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					사용자 정보
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
					<div class="form-horizontal"> 
						<div class="form-group">
							<label class="control-label col-xs-5">아이디</label>
							<div class="col-xs-20">
								<input class="form-control" value="${progressVO.userVO.id}" readonly="readonly" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-5">닉네임</label>
							<div class="col-xs-20">
								<input class="form-control" value="${progressVO.userVO.nickName}" readonly="readonly" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-5">휴면여부</label>
							<div class="col-xs-20">
								<input class="form-control" value="${progressVO.userVO.isUse}" readonly="readonly" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					교육컨텐츠 정보
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
					<div class="form-horizontal"> 
						<div class="form-group">
							<label class="control-label col-xs-5">제목</label>
							<div class="col-xs-20">
								<input class="form-control" value="${progressVO.contentsVO.title}" readonly="readonly" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-5">카테고리</label>
							<div class="col-xs-20">
								<input class="form-control" value="${progressVO.contentsVO.cate1Name}" readonly="readonly" />
								<input class="form-control" value="${progressVO.contentsVO.cate2Name}" readonly="readonly" />
								<input class="form-control" value="${progressVO.contentsVO.cate3Name}" readonly="readonly" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-5">총 강의수</label>
							<div class="col-xs-20">
								<input class="form-control" value="${progressVO.contentsVO.classCount}" readonly="readonly" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-5">난이도</label>
							<div class="col-xs-20">
								<input class="form-control" value="${progressVO.contentsVO.difficulty}" readonly="readonly" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-xs-5">서비스 여부</label>
							<div class="col-xs-20">
								<input class="form-control" value="${progressVO.contentsVO.isService}" readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="widget-box">
			<div class="widget-header widget-head-flat">
				<h4 class="smaller">
					<a href="#" data-action="collapse"><i class="1 ace-icon fa bigger-125 fa-chevron-up"></i></a>
					진도율
				</h4>
			</div>
			<div class="widget-body">
				<div class="widget-main">
					<div class="form-horizontal"> 
						<div class="form-group">
							<label class="control-label col-xs-5">강의 진행율</label>
							<label class="control-label col-xs-7"> 
								${progressVO.point} / ${progressVO.contentsVO.classCount} 
								(<fmt:formatNumber type="number" maxFractionDigits="0" value="${progressVO.point * 100 / progressVO.contentsVO.classCount}" /> %) 
							</label>
						</div>
						<div class="form-group">
							<c:set var="progressRate" value="${progressVO.point * 100 / progressVO.contentsVO.classCount}" />
							<label class="control-label col-xs-15"> <progress id="progress" value="${progressRate}" min="0" max="100"></progress> </label>
<!-- 							<div class="pull-right"> -->
<!-- 								<button type="button"  class="btn btn-primary btn-sm" ><i class="ace-icon glyphicon glyphicon-ok"></i>적용</button> -->
<!-- 								<button type="button" class="btn btn-info btn-sm" onclick="window.close()"><i class="ace-icon glyphicon glyphicon-remove"></i>전송</button> -->
<!-- 							</div>	 -->
						</div>
					</div>
				</div>
			</div>
		</div>
				
	</div><!-- page-content -->
</div><!-- main-content -->
