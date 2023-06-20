<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<form id="table_only_form">
<%@ include file = "form.jsp" %>
<!-- checkbox가 없는 테이블 -->
<div class="tableAll" id="onlyTable">

	<div class="table-container">
		<table class="table only" border="1">
		    <thead>
		        <tr>
		            <th>의약품 코드</th>
		            <th>의약품 명</th>
		            <th>규격</th>
		            <th>단위</th>
		            <th>수량</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
					<td colspan="6" style="text-align:center;">날짜를 선택하세요.</td>
		        </tr>
		    </tbody>
		</table>
	</div>	
	<hr>
	<div class="basicB">
		<input class="pointB" type="button" value="전체 적용">
		<input class="closeB" type="button" value="닫기">
	</div>
</div>
</form>