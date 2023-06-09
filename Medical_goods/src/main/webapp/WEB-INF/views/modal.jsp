<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- 모달창 기본 틀 -->
	<!-- 모달 창이 열려 있을 때 -->
	<div class="modal-overlay"></div>
	<div class="modal1" style="width:750px; height:550px;">
		<div class="header">
			상단 제목
			<div style="display:flex;">
				<div><i class="fas fa-thin fa-arrows-rotate"></i></div>
				<div><i class="fas fa-light fa-x closeB"></i></div>
			</div>
		</div>
		<div class="main">
			<p>내용이 들어갑니당</p>
			<p>1</p>
			<div class="basicB top">
				<button>찾기</button>
				<button>정렬</button>
				<button>재고 불러오기</button>
			</div>
			<div>
				<table class="table checkbox" border="1">
				    <thead>
				        <tr>
				            <th><input type="checkbox" name="checkbox" onclick="selectAll(this)"></th>
				            <th>의약품 코드</th>
				            <th>의약품 명</th>
				            <th>규격</th>
		   		            <th>수량</th>
		  		            <th>특이사항</th>
				        </tr>
				    </thead>
				    <tbody>
				        <tr>
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
				        </tr>
				    </tbody>
				</table>
			</div>
			<div class="basicB bottom">
				<hr>
				<button class="pointB">전체 적용</button>
				<button class="closeB">닫기</button>
			</div>
		</div>			
	</div>
	

	
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
	$("#modalShow").click(function() {
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