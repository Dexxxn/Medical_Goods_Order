// checkbox 전체 선택 기능
function selectAll(selectAll)  {
	const checkboxes 
		= document.getElementsByName('checkbox');
  
	checkboxes.forEach((checkbox) => {
	checkbox.checked = selectAll.checked;
	})
}

// 모달 닫기
$(document).ready(function() {
	// x 아이콘 클릭 시 모달 닫기
	$(".closeB").click(function() {
		$(".modal1").hide();
	});
});