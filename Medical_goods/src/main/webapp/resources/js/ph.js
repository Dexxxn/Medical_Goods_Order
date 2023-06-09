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
