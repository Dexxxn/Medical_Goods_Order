<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 모달창 기본 틀 -->
<div class="modal-overlay"></div>
<div class="modal1" id="messageAlert" style="width:370px; height:270px; margin-top: 400px;">
	<div class="header">
		알림
		<div style="display:flex;">
			<div><i class="fas fa-light fa-x closeB"></i></div>
		</div>
	</div>
	<div class="main">
	<p class="ment">거래처 "~~~"으로 메일을 &nbsp; 전송하시겠습니까?</p>
		<div class="basicB bottom">
			<hr style="display: block;">
			<button class="pointB" onclick="okbutton()">확인</button>
			<button class="closeB">취소</button>
		</div>
	</div>			
</div>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
//버튼 클릭 시 폼 전송 방지
$("button").click(function(event) {
  event.preventDefault();
});

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
	
	
	//이메일 전송완료 확인창
	function okbutton() {
		  $.ajax({
		    url: "modal_alert_ok", // modal_alert.jsp 파일 경로
		    success: function(data) {
			      $("#modalContainer").html(data);
			      $(".modal-overlay").show();
			      $(".modal1").show();
			      $(".ment").text("이메일 전송 완료"); //내용 변경
			     
			    }
			  });
			}

			$(document).on("click", ".closeB", function() {
			  $(".modal-overlay").hide();
			  $(".modal1").hide();
			}); 
	
</script>

<style>
#messageAlert{top:5%;}
p.ment {
  display: block;
  width: 50%; /* 원하는 너비 값 */
  margin: 45px auto;
  font-size:20px; font-weight:bold;
}
/* .ment{margin:20px; font-size:20px; font-weight:bold;} */
</style>