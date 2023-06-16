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
		            <th>단위</th>
		            <th>수량</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td>00001</td>
		            <td>Prohaskdfafsdfsdfafa</td>
		            <td>3box</td>
		            <td>30</td>
		        </tr>
		        <tr>
		            <td>00002</td>
		            <td>Prohaska</td>
		            <td>1box</td>
		            <td>30</td>
		        </tr>
		        <tr>
		            <td>00003</td>
		            <td>Prohaska</td>
		            <td>1box</td>
		            <td>30</td>
		        </tr>
		    </tbody>
		</table>
	</div>	
	<hr>
	<div class="basicB">
		<button class="pointB">전체 적용</button>
		<button>닫기</button>
	</div>
</div>
</form>

<script>
	// 모달 열기
	$(document).ready(function() {
		$(".modalShow").click(function() {
			$(".modal1").show();
			$(".modal-overlay").show();
		});
	});
	
	// 모달 닫기
	$(document).ready(function() {
		// x 아이콘 클릭 시 모달 닫기
		$(".closeB").click(function() {
			$(".modal1").hide();
			$(".modal-overlay").hide();
		});
	});
</script>