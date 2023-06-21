<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<form id="table_form">
	<div class="form_container">
		<%@ include file = "form.jsp" %>
	</div>
	<div class="form_container2">
		<%@ include file = "form2.jsp" %>
	</div>
	<div class="tableAll" id="CheckboxTable">
		<div class="table-container">
			<table class="table checkbox" id="publicTable" border="1">
			    <thead>
			        <tr>
			            <th><input type="checkbox" name="checkbox" id="selectAllCheckbox" onclick="selectAll(this)"></th>
			            <th>의약품 코드</th>
			            <th>의약품 명</th>
			            <th>규격</th>
			            <th>단위</th>
			        </tr>
			    </thead>
			    <tbody>
			     <tr><td colspan='13'>조회내역 없음</td></tr>
<!-- 			        <tr>
			            <td><input type="checkbox" name="checkbox"></td>
			            <td>00001</td>
			            <td>Prohaskdfafsdfsdfafa</td>
			            <td>3box</td>
			            <td>30</td>
			            <td>유통기한 확인 요망</td>
			        </tr>
			        <tr>
			            <td><input type="checkbox" name="checkbox"></td>
			            <td>00002</td>
			            <td>Prohaska</td>
			            <td>1box</td>
			            <td>30</td>
			            <td>유통기한 확인 요망</td>
			        </tr>
			        <tr>
			            <td><input type="checkbox" name="checkbox"></td>
			            <td>00003</td>
			            <td>Prohaska</td>
			            <td>1box</td>
			            <td>30</td>
			            <td>유통기한 확인 요망</td>
			        </tr> -->
			    </tbody>
			</table>
		</div>
		<hr>
		<div class="basicB">
			<button class="pointB" onclick="opendetailModal()">전체 적용</button> <!-- 부모창에서 자식창으로 값 전달 -->
			<button>닫기</button>
			<button onclick="insertConfirm()">발주 완료</button>
		</div>
		<br><br>
	</div>
</form>			

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>


//checkbox 전체 선택 기능
function selectAll(selectAll)  {
	const checkboxes 
		= document.getElementsByName('checkbox');

	checkboxes.forEach((checkbox) => {
	checkbox.checked = selectAll.checked;
	})
};

	
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
