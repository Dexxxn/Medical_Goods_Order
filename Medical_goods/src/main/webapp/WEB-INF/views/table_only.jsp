<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 모달창 기본 틀 -->
<div class="modal1" style="width:370px; height:270px; margin-top: 400px;">
	<div class="header">
		상단 제목
		<div style="display:flex;">
			<div><i class="fas fa-light fa-x closeB"></i></div>
		</div>
	</div>
	<div class="main">
		<p>alert 대신 재확인창으로 쓰일 예정</p>
		<p>1</p>
		<div class="basicB bottom">
			<hr style="display: block;">
			<button class="pointB">확인</button>
			<button class="closeB">취소</button>
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
	
	// 모달 닫기
	$(document).ready(function() {
		// x 아이콘 클릭 시 모달 닫기
		$(".closeB").click(function() {
			$(".modal1").hide();
		});
	});
</script>