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
			<button class="pointB" id="defaultBtn" onclick="okbutton();">확인</button>
			<button class="pointB" id="modalclose" onclick="modalClose();">확인</button>
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
			$(".modal-overlay").hide();//추가한 코드
		});
		
	});
	
//+++++++++++++++++++++++++++++++++++++++++++++++++아래에 기능추가(DB업데이트 및 색깔 변화)
	//이메일 전송완료 확인창
	/* function okbutton() {
		  $.ajax({
		    url: "modal_alert_ok", // modal_alert.jsp 파일 경로
		    success: function(data) {
			      $("#modalContainer").html(data);
			      $(".modal-overlay").show();
			      $(".modal1").show();
			      $(".ment").text("이메일 전송 완료"); //내용 변경
			      
			      	$("#modalclose").show(); // #modalclose 버튼 표시
			        $("#defaultBtn").hide(); // 확인 버튼 숨기기
			    }
			  });
			}

			$(document).on("click", ".closeB", function() {
			  $(".modal-overlay").hide();
			  $(".modal1").hide();
			  
			});  */
	
			//이메일 전송완료 확인창
			function okbutton() {
			  $.ajax({
			    url: "modal_alert_ok", // modal_alert.jsp 파일 경로
			    success: function(data) {
			      $("#modalContainer").html(data);
			      $(".modal-overlay").show();
			      $(".modal1").show();
			      $(".ment").text("이메일 전송 완료"); //내용 변경
			      
			      $("#modalclose").show(); // #modalclose 버튼 표시
			      $("#defaultBtn").hide(); // 확인 버튼 숨기기

			      // Apply color change
			      $("#publicTable tbody input[name='checkbox']:checked").closest("tr").css('background-color', 'blue');

			      // Prepare data for server
			      var itemIds = [];
			      $("#publicTable tbody input[name='checkbox']:checked").each(function() {
			        var $row = $(this).closest("tr");
			        var itemId = $row.find("td:eq(1)").text();  // adjust this line to get the actual item_id
			        itemIds.push(itemId);
			      });
			      
			      // Send AJAX request to server to update DB
			      $.ajax({
			        url: "/updateOrders",  // adjust this line to the actual server URL
			        type: "POST",
			        data: JSON.stringify(itemIds),
			        contentType: "application/json",
			        success: function(response) {
			          console.log("DB Update Success");
			        },
			        error: function(jqXHR, textStatus, errorThrown) {
			          console.log("DB Update Failed: ", textStatus);
			        }
			      });
			    }
			  });
			}

			$(document).on("click", ".closeB", function() {
			  $(".modal-overlay").hide();
			  $(".modal1").hide();
			});
			
//--------------------------------------------------------------------------------
	//"확인" 클릭시 모달창 닫고 색깔 변화!!! (보류..)
/* 		function modalClose() {
			$(".modal1").hide();
			$(".modal-overlay").hide();
			
//start		// 체크된 체크박스 항목을 다른 테이블로 이동하여 구분하여 뷰에 표시
			  var $publicTable = $("#publicTable tbody");
			  var $selectedTable = $("#selectedTable tbody");

			  $selectedTable.empty(); // 이전에 선택된 항목들을 비우기

			  $publicTable.find("input[name='checkbox']:checked").each(function() {
			    var $row = $(this).closest("tr");

			    // 선택된 항목을 복사하여 다른 테이블로 이동
			    var $newRow = $row.clone();
			    $selectedTable.append($newRow);

			    // 선택된 항목의 스타일 변경
			    $row.css("background-color", "#FAEBD7");
			    $row.find("input[name='checkbox']").remove();
			  });

			  // 선택된 항목들을 구분하는 행 추가
			  var $selectedRow = $("<tr></tr>");
			  $selectedRow.append("<td colspan='13' style='background-color: #FAEBD7;'>선택된 항목</td>");
			  $selectedTable.prepend($selectedRow);
			  
			  
//end	
		} */
	
	
	
	
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
#modalclose{display:none;}
</style>