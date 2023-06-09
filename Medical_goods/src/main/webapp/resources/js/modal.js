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



// ajax
$("#replyPage").on("click",function(e){
	alert("aaa")
	var bnoValue=$("input[name='bno']").val();
	var pageValue = $(this).attr("href");
	console.log(bnoValue)
	console.log(pageValue)
	list({bno:bnoValue,page:pageValue});
})

//비동기식 경우, vo역할을 하는 것이 json
function list(param){// list함수 선언 시작
	//alert(bno);
	var bno = param.bno;
	var page = param.page;
	
	console.log(bno)
	console.log(page)
	
	$.getJSON("/replies/"+bno+"/"+page+".json",function(data){
		console.log(data.replycnt)
		console.log(data.list)
		
		var str="";
		
		for(var i=0;i<data.list.length;i++){
			str+="<li>"+data.list[i].id+"</li>"
			str+="<li><textarea id='replycontent"+data.list[i].rno+"'>"+data.list[i].reply+"</textarea></li>"
			str+="<li>"
			str+="<input class='update' type='button' value='수정' data-rno="+data.list[i].rno+">"
			str+="<input class='remove' type='button' value='삭제' data-rno="+data.list[i].rno+">"
			str+="</li>"
		}
		
		$("#replyUL").html(str);
		
		showReplyPage(data.replycnt,page);
	});
}// list함수 선언 끝