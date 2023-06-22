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
		const checkboxes = document.getElementsByName('checkbox');
	  
		checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked; }) };
	
	// 모달 닫기
	$(document).ready(function() {
		// x 아이콘 클릭 시 모달 닫기
		$(".closeB").click(function() {
			$(".modal1").hide();
			$(".modal-overlay").hide();//추가한 코드
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
      
      $("#modalclose").show(); // #modalclose 버튼 표시
      $("#defaultBtn").hide(); // 확인 버튼 숨기기


      
      var selectedItems = []; // 선택된 체크박스 값들을 저장할 배열
      // 선택된 체크박스 요소들을 탐색
	  $("#publicTable tbody input[name='checkbox']:checked").each(function() {
	    var $row = $(this).closest("tr");
	    var item = {
	      item_id: $row.find("td:eq(1)").text(),
	      item_name: $row.find("td:eq(2)").text(),
	      supplier: $row.find("td:eq(3)").text(),
	      standard: $row.find("td:eq(4)").text(),
	      unit: $row.find("td:eq(5)").text(),
	      unit_price: $row.find("td:eq(6)").text(),
	      order_quantity: $row.find("td:eq(7)").text(),
	      supply_value: $row.find("td:eq(8)").text(),
	      vat: $row.find("td:eq(9)").text(),
	      total_amount: $row.find("td:eq(10)").text(),
	      name: $row.find("td:eq(11)").text(),
	      receiptDate: $row.find("td:eq(12)").text(),
	      significant: $row.find("td:eq(13)").text()
	    };
	    selectedItems.push(item); // 선택된 체크박스 값을 배열에 추가
	  });
      
      //여기시도-성공!!!
	  $("#publicTable tbody input[name='checkbox']:checked").closest("tr").find("input[name='checkbox']").remove().end().css('background-color', '#FAEBD7');
      
      // Send AJAX request to server to update DB
      $.ajax({
        url: "/updateOrders",  // adjust this line to the actual server URL
        type: "POST",
        data: JSON.stringify(selectedItems), //서버로던질 리스트
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
</script>
<style> #messageAlert{top:5%;} p.ment {display: block;width: 50%; margin: 45px auto;font-size:20px; font-weight:bold;} #modalclose{display:none;} </style>