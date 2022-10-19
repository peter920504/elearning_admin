<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="widget-header widget-head-flat">
	<h4 class="smaller pull-left">
		검색목록 <span class="data-cnt">(${fnItkc:to3DecimalFmt(dataCount)} 개)</span>
	</h4>
</div>
<div class="widget-body data-tbl">	
	<div class="">
	    <table class="table table-striped table-bordered table-hover data-list">
			<colgroup>
				<col style="width:20px">
				<col style="width:60px">
				<col>
				<col style="width:200px">
				<col style="width:200px">
			</colgroup>
			<thead>
	        <tr>
				<th></th>
				<th class="col-sort" >번호</th>
				<th class="col-sort" >부서이름</th>
				<th class="col-sort" >사번</th>
				<th class="col-sort" >사용자이름</th>
	        </tr>
	        </thead>
        	<tbody>
	        <c:forEach var="item" items="${dataList}" varStatus="rowStatus">
		    <tr>
				<td><input type="checkbox" name="${item['NFUID']}" value="${item['NFUID']}"></td>
				<td>${searchVO.firstIndex + rowStatus.count}</td>
				<td>${item['DEPT']}</td>
				<td>${item['NFUID']}</td>
				<td>${item['NFCN']}</td>
		    </tr>
		    </c:forEach>
			<c:if test="${empty dataList}">
				<tr><td colspan="20">조회 목록이 존재하지 않습니다.</td></tr>
			</c:if>
			</tbody>
	    </table> 
		<div id="paging">
			<div class="pagination-wrap">
				${RenderPagination}
			</div>
		</div>
	</div>
</div>
