// checkbox 전체 선택 기능
function selectAll(selectAll)  {
	const checkboxes 
		= document.getElementsByName('checkbox');
  
	checkboxes.forEach((checkbox) => {
	checkbox.checked = selectAll.checked;
	})
}