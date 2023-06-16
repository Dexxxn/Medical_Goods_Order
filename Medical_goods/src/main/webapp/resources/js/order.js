
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
          str += "<td>" + (data[i].significant || "") + "</td>";//의약품별 요청 및 특이사항 //DB에서 해당 데이터가 null상태면 공백으로!
          str += "</tr>";
      }
      
   // 기존의 thead 삭제
      $("#publicTable thead").remove();
      
      var headerData = [
      	  "의약품 코드", "의약품명", "구매처명", "규격", "단위", "단가", "발주수량", "공급가액", "부가세", "품목 총액",
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