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
      
      var headerData = ["의약품 코드", "의약품명", "구매처명", "규격", "단위", "단가", "발주수량", "공급가액", "부가세", "품목 총액",
      	  "담당자","희망입고일자","의약품별 요청 / 특이사항" ];
      
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
  //여기부터~~`
  var selectedSupplier = ""; // 선택된 체크박스의 구매처 저장 변수
  var selectedSupplierList = []; // 선택된 체크박스의 구매처 리스트

  
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

    // 선택된 구매처 값을 구매처 리스트에 추가
    selectedSupplierList.push(item.supplier);
    // 중복 제거를 위해 구매처 리스트를 Set 객체로 변환
    var uniqueSupplierList = [...new Set(selectedSupplierList)];

    // 선택된 구매처가 2개 이상일 경우, "거래처 재확인 필요" 알림 표시
    if (uniqueSupplierList.length > 1) {
      //alert("거래처 재확인 필요");
    	warning();
    	
    	
      var emailButton = document.getElementById("selectRequestList");
      emailButton.onclick = null; // 이메일 버튼 클릭 시 실행할 함수를 null로 설정하여 작동하지 않도록 함
      return;
    }
    
  // 첫 번째 선택된 구매처 값을 저장
  if (selectedSupplier === "") {
    selectedSupplier = item.supplier;
  }
 });
  
  // 체크된 체크박스가 없을 경우 nonechecked() 함수 실행
  if (selectedItems.length === 0) {
    nonechecked();
    return;
  }
  
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
	    
	    var totalQuantity = 0; // 총 수량을 저장할 변수
	    var totalPrice = 0; // 총액을 저장할 변수
	    
	    
	  
		   
	    for (var i = 0; i < selectedItems.length; i++) {
	      var item = selectedItems[i];
	      
	      // 테이블에 새로운 행 추가
	      var $row = $("<tr></tr>");
	      $row.append("<td>" + (i + 1) + "</td>"); // no
	      $row.append("<td  style='background-color: pink;'>" + item.supplier + "</td>"); // 구매처
	      $row.append("<td>" + item.item_id + "</td>"); // 의약품코드
	      $row.append("<td>" + item.item_name + "</td>"); // 의약품명
	      $row.append("<td>" + item.unit_price + "</td>"); // 단가
	      $row.append("<td>" + item.order_quantity + "</td>"); // 발주수량
	      $row.append("<td>" + item.total_amount + "</td>"); // 품목 총액
	      $row.append("<td>" + item.significant + "</td>"); // 특이사항
	      
	      $reqListTable.append($row); // 테이블에 행 추가
	      
	   // 총 수량과 총액 계산
	      totalQuantity += parseInt(item.order_quantity);
	      totalPrice += parseFloat(item.total_amount);
	    }

	 // 테이블에 총 수량과 총액을 추가하는 행 추가
	    var $totalRow = $("<tr></tr>");
	    $totalRow.append('<td colspan="5" class="header-cell" style="font-weight:bold; background-color:#f5f5f5;">총 수량 & 총액</td>');
	    $totalRow.append('<td class="total-quantity" style="text-align: center;">' + totalQuantity + '</td>');
	    $totalRow.append('<td class="total-price" style="text-align: center; color:red;">' + numberWithCommas(totalPrice) + '</td>');
	    $totalRow.append('<td></td>');
	    
	    function numberWithCommas(number) {
	    	  return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    	}
	    
	    $reqListTable.append($totalRow); // 테이블에 총 수량과 총액을 추가하는 행 추가
	    
	    

	
	    
	    // 버튼 클릭 시 sendEmailAlert() 함수 실행
	    var emailButton = document.getElementById("selectRequestList");
	    emailButton.onclick = function() {
	      sendEmailAlert(selectedSupplier);
	    };  
	 
	    

  });
}




//"거래처 재확인 필요" modal_alert 띄우기
function warning() {
  $.ajax({
    url: "modal_alert_sendEmail", // modal_alert.jsp 파일 경로
    success: function(data) {
	      $("#modalContainer").html(data);
	      $(".modal-overlay").show();
	      $(".modal1").show();
	     

	      var mentText = '거래처 재확인 필요!';
	      $(".ment").html(mentText).css("margin", "93px auto");
	      $(".basicB.bottom").hide(); // 하단 버튼 삭제
	    }
	  });
	}

	$(document).on("click", ".closeB", function() {
	  $(".modal-overlay").hide();
	  $(".modal1").hide();
	}); 
	
	
	

	//체크박스 선택 없이 전체적용 버튼 클릭하면 modal_alert 띄우기
	function nonechecked() {
	  $.ajax({
	    url: "modal_alert_sendEmail", // modal_alert.jsp 파일 경로
	    success: function(data) {
		      $("#modalContainer").html(data);
		      $(".modal-overlay").show();
		      $(".modal1").show();
		     

		      var mentText = '선택한 데이터가 없습니다.<br>체크박스 선택하세용~';
		      $(".ment").html(mentText).css({
		    	  "margin": "71px auto",
		    	  "width": "69%"
		    	});
		      
		      $(".basicB.bottom").hide(); // 하단 버튼 삭제
		    }
		  });
		}

		$(document).on("click", ".closeB", function() {
		  $(".modal-overlay").hide();
		  $(".modal1").hide();
		}); 

