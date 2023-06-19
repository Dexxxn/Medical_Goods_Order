
// 진료과, 요청일자 "찾기" 클릭 시 데이터 테이블로 가져오기
function requestList() {
	
	var selectedDept = $("#dept").val();
	var selectedRequestDate = $("#requestDate").val();
	
	var url =  "/purchasePlan?dept=" + selectedDept + "&requestDate=" + selectedRequestDate;
		
  // Ajax 요청 보내기
  $.ajax({
      url: url,
      async: true,
      type: "POST",
      dataType: "json", // 데이터 형식을 JSON으로 설정
      cache: false
  }).done(function(data) {
      // Contents 영역 삭제
  	//$("#formAll").remove();
      // Contents 영역 교체
  	
  	
      console.log(data)
      
 
     var str = "";
      for (var i = 0; i < data.length; i++) {
          str += "<tr>";
          str += "<td><input type='checkbox' name='checkbox'></td>"; // 체크박스 추가
          str += "<td>" + data[i].item_id + "</td>"; //의약품코드
          str += "<td>" + data[i].item_name + "</td>"; //의약품명
          str += "<td>" + data[i].supplier + "</td>"; //구매처명
          str += "<td>" + data[i].standard + "</td>"; //규격
          str += "<td>" + data[i].unit + "</td>"; //단위(EA / BOX)
          str += "<td>" + data[i].unit_price + "</td>"; //단가
          str += "<td>" + data[i].order_quantity + "</td>"; //발주수량
          str += "<td>" + data[i].supply_value + "</td>"; //공급가액
          str += "<td>" + data[i].vat + "</td>";//부가세
          str += "<td>" + data[i].total_amount + "</td>";//1품목총액(공급가액 + 부가세)
          str += "<td>" + data[i].name + "</td>";//1품목총액(공급가액 + 부가세)
          str += "<td>" + data[i].receiptDate + "</td>";//1품목총액(공급가액 + 부가세)
          str += "<td>" + (data[i].significant || "") + "</td>";//의약품별 요청 및 특이사항 //DB에서 해당 데이터가 null상태면 공백으로!
          str += "</tr>";
      }
      
   // 기존의 thead 삭제
      $("#publicTable thead").remove();
      
      var headerData = [
      	  "의약품 코드", "의약품명", "구매처명", "규격", "단위", "단가", "발주수량", "공급가액", "부가세", "품목 총액","담당자","희망입고일자",
      	  "의약품별 요청 / 특이사항"
      	];
      
   // 동적으로 thead의 열 추가
      var $theadRow = $("<tr></tr>");
      $theadRow.append("<th><input type='checkbox' name='checkbox' onclick='selectAll(this)'></th>");
      for (var x = 0; x < headerData.length; x++) {
        $theadRow.append("<th>" + headerData[x] + "</th>");
      }
      
   // thead 추가
      $("#publicTable").prepend("<thead></thead>");
      $("#publicTable thead").append($theadRow);

      
      // tbody 값 대체
      $("#publicTable tbody").html(str);
      $(".table-container").css({
      	width: '1400px'
      });
  });
}		




//전체 적용 버튼 클릭 시 선택된 체크박스 값을 모달로 전송
function opendetailModal() {
  var selectedItems = []; // 선택된 체크박스 값들을 저장할 배열
  
  // 체크된 체크박스 요소들을 탐색
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
  
  // AJAX를 통해 선택된 체크박스 값들을 모달로 전송
  $.ajax({
    url: "/requestList", // 모달로 전송할 URL
    type: "POST",
    dataType: "html",
    data: JSON.stringify(selectedItems), // 선택된 체크박스 값을 JSON 형식으로 전송
    contentType: "application/json",
    cache: false
  }).done(function(response) {
    // 모달로 전송 후의 처리 작업
    // ...
	  console.log(response)
	  
	  
      
	  $("#modalContainer").html(response);
	  $(".modal-overlay").show();
	  $(".requestListModal").show();
	  
	  
	    // 선택된 값들을 테이블에 추가
	    var $reqListTable = $("#reqListTable tbody");
	    $reqListTable.empty(); // 기존의 tbody 내용 제거
	    
	    for (var i = 0; i < selectedItems.length; i++) {
	      var item = selectedItems[i];
	      
	      // 테이블에 새로운 행 추가
	      var $row = $("<tr></tr>");
	      $row.append("<td>" + (i + 1) + "</td>"); // no
	      $row.append("<td>" + item.supplier + "</td>"); // 구매처
	      $row.append("<td>" + item.item_id + "</td>"); // 의약품코드
	      $row.append("<td>" + item.item_name + "</td>"); // 의약품명
	      $row.append("<td>" + item.unit_price + "</td>"); // 단가
	      $row.append("<td>" + item.order_quantity + "</td>"); // 발주수량
	      $row.append("<td>" + item.total_amount + "</td>"); // 품목 총액
	      $row.append("<td>" + item.significant + "</td>"); // 특이사항
	      
	      $reqListTable.append($row); // 테이블에 행 추가
	    }
	    
	    
	  /*  //여기부터~~`
	    var selectedSupplier = ""; // 선택된 체크박스의 구매처 저장 변수
	    
	    // 첫 번째 선택된 구매처 값을 저장
	    if (selectedSupplier === "") {
	      selectedSupplier = item.supplier;
	    }
	 // 선택된 구매처 값을 활용하여 sendEmailAlert() 함수 실행
	    sendEmailAlert(selectedSupplier);
  */
	    
	    
	    //여기부터~~`
	    var selectedSupplier = ""; // 선택된 체크박스의 구매처 저장 변수

	    // 첫 번째 선택된 구매처 값을 저장
	    if (selectedItems.length > 0) {
	      selectedSupplier = selectedItems[0].supplier;
	    }

	    // 선택된 구매처 값을 활용하여 sendEmailAlert() 함수 실행
	    function callSendEmailAlert() {
	      sendEmailAlert(selectedSupplier);
	    }

	    //callSendEmailAlert();
	    
	    
	    
	    
	    
  
  });
}

