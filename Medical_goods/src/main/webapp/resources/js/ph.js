$(document).ready(function(){
	
	$("#Select_dept").on("change",function(){
		var deptValue = $("select[name='dept']").val();
		console.log(deptValue);
		list({dept:deptValue});
	})
	function list(param){
		
		var dept = param.dept;
		console.log(dept)
		
		$.getJSON("/ph/"+dept+".json",function(data){
			console.log(data)
			
			var str="";
			
			str +="<option>"+"선택"+"</option>"
			for(var i=0; i<data.length; i++){
				str += "<option>"+data[i].name+"</option>"
			}
			
			$("#Select_name").html(str);
		});
	}
})
$(document).ready(function() {
  $("#searchLink").on("click", function(event) {
    event.preventDefault();

    var selectedDept = $("#Select_dept").val();
    var selectedName = $("#Select_name").val();
    var selectedDate = $("input[name='startday']").val();

    var url = "/ph_detail?dept=" + selectedDept + "&name=" + selectedName + "&date=" + selectedDate;
    window.location.href = url;
  });
});
$(document).ready(function() {
	  var urlParams = new URLSearchParams(window.location.search);

	  var selectedName = urlParams.get("name");
	  var selectedDate = urlParams.get("date");

	  $("#purchaseDate").text(selectedName + "님 구매이력 (" + selectedDate + ")");
	});
