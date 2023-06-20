<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- 모달창 기본 틀 -->
	<!-- 모달 창이 열려 있을 때 -->
	<div class="modal-overlay"></div>
	<div class="modal1" style="width:750px; height:550px;">
		<div class="header">
			<span class="modal_title">상단 제목</span>
			<div style="display:flex;">
				<div><i class="fas fa-thin fa-arrows-rotate"></i></div>
				<div><i class="fas fa-light fa-x closeB"></i></div>
			</div>
		</div>
		<div class="main">
			<%@ include file = "table_only.jsp" %>
			<%@ include file = "table.jsp" %>
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

</script>