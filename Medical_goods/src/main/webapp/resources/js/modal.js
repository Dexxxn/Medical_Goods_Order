// 천의 자리 콤마찍기
function numberWithCommas(number) {
	  return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 재고 현황 리스트
function invenList(url) {
    // Ajax 요청 보내기
    $.ajax({
        url: url,
        async: true,
        type: "POST",
        dataType: "json", // 데이터 형식을 JSON으로 설정
        cache: false
    }).done(function(data) {
        // Contents 영역 삭제
        $("#formAll").remove();

        // 중복된 물품을 하나의 행에 표시하기 위한 객체 생성
        var itemStocks = {};

        // 부서별 재고를 계산하여 itemStocks 객체에 저장
        for (var i = 0; i < data.length; i++) {
            var itemId = data[i].item_id;
            var itemName = data[i].item_name;
            var standard = data[i].standard;
            var unit = data[i].unit;
            var dept = data[i].dept;
            var currentAmount = data[i].current_amount;

            if (!itemStocks[itemName]) {
                itemStocks[itemName] = {
                    itemCode: itemId,
                    standard: standard,
                    unit: unit,
                    deptA: 0,
                    deptB: 0,
                    deptC: 0,
                    deptD: 0,
                    deptE: 0
                };
            }

            if (dept === '병동A') {
                itemStocks[itemName].deptA += currentAmount;
            } else if (dept === '병동B') {
                itemStocks[itemName].deptB += currentAmount;
            } else if (dept === '병동C') {
                itemStocks[itemName].deptC += currentAmount;
            } else if (dept === '수술실') {
                itemStocks[itemName].deptD += currentAmount;
            } else if (dept === '처치실') {
                itemStocks[itemName].deptE += currentAmount;
            }
        }

        // Contents 영역 교체
        var str = ""; 

        // 중복된 물품을 하나의 행에 표시하고 해당 물품이 있는 부서에 대해서만 재고를 표시
        for (var itemName in itemStocks) {
            var item = itemStocks[itemName];
            var totalAmount = item.deptA + item.deptB + item.deptC + item.deptD + item.deptE;

            str += "<tr>";
            str += "<td>" + item.itemCode + "</td>";
            str += "<td>" + itemName + "</td>";
            str += "<td>" + item.standard + "</td>";
            str += "<td>" + item.unit + "</td>";
            str += "<td class='quantity'>" + totalAmount + "</td>";
            str += "<td class='quantity'>" + (item.deptA || 0) + "</td>";
            str += "<td class='quantity'>" + (item.deptB || 0) + "</td>";
            str += "<td class='quantity'>" + (item.deptC || 0) + "</td>";
            str += "<td class='quantity'>" + (item.deptD || 0) + "</td>";
            str += "<td class='quantity'>" + (item.deptE || 0) + "</td>";
            str += "</tr>";
        }

        // thead에 열 추가
        $(".table.only thead tr").append("<th>병동A</th>");
        $(".table.only thead tr").append("<th>병동B</th>");
        $(".table.only thead tr").append("<th>병동C</th>");
        $(".table.only thead tr").append("<th>수술실</th>");
        $(".table.only thead tr").append("<th>처치실</th>");

        // 테이블 요소 선택
        var table = document.querySelector(".table");
        var quantityHeader = table.querySelector("thead th:nth-child(5)"); // 수량 헤더 선택
        quantityHeader.innerHTML = "합계";

        var quantityHeader = table.querySelector("thead th:nth-child(6)");
        $(quantityHeader).remove();

        // tbody 값 대체
        $(".table.only tbody").html(str);
        // 데이터가 많으니 길이 조정
        $(".table-container").css({
            width: '1200px'
        });

    });

}


//사용 입력 품목 리스트
function useList() {
    // 선택한 날짜 가져오기
    var selectedDate = $("#searchDate").val();
    // 선택한 부서 가져오기
    var selectedDept = $("#dept").val(); // 예시에서는 'dept'라는 id를 가진 요소로 가정
    
    // 사용 입력 품목 리스트 조회 URL
    var url = "/useList?date=" + encodeURIComponent(selectedDate) + "&dept=" + encodeURIComponent(selectedDept); // 예시 URL
    
    // Ajax 요청 보내기
    $.ajax({
        url: url,
        async: true,
        type: "POST",
        dataType: "json", // 데이터 형식을 JSON으로 설정
        cache: false
    }).done(function(data) {
        // Contents 영역 삭제

        // Contents 영역 교체
        //console.log(data)
        var str = "";
        
        if (data.length === 0) {
            str = '<tr><td colspan="6" style="text-align:center;">조회 결과가 없습니다.</td></tr>';
        } else {
            for (var i = 0; i < data.length; i++) {
                str += "<tr>";
                str += "<td>" + data[i].item_id + "</td>";
                str += "<td>" + data[i].item_name + "</td>";
                str += "<td>" + data[i].standard + "</td>";
                str += "<td>" + data[i].unit + "</td>";
                str += "<td id='quantityUsedCell' class='quantity'>" + data[i].quantity_used + "</td>";
                str += "<td>" + data[i].significant + "</td>";
                str += "</tr>";
            }
        }
      
        // tbody 값 대체
        $(".table.only tbody").html(str);
           
        
    });

}

// 모달 열기
$(document).on("click", "#modalOpen", function() {
    $.ajax({
        url: "/modal", // URL of the purchase.jsp page
        type: "GET",
        success: function(data) {
            // Update the content of the chartContent element with the response from purchase.jsp
        	$("body").append(data);
        },
        error: function(xhr, status, error) {
            alert("An error occurred while loading the page. Error: " + error);
            console.log("XHR status: " + status);
            console.log("Error details: " + error);
        }
    });		
})

//모달 열기 버튼 클릭 이벤트 핸들러
$(document).on("click", "#modalOpen", function() {
    if ($(".modal1").length > 0) {
        // 기존 모달 창을 닫고 삭제
        $(".modal1").hide();
        $(".modal-overlay").hide();
        $(".modal1").remove();
        $(".modal-overlay").remove();
    }
    

	// 선택한 부서 가져오기
	var selectedDept = $("#dept").val();
	// 사용 입력 품목 리스트 조회 URL
	var url = "/modal?dept=" + encodeURIComponent(selectedDept); // 예시 URL
	
    // 비동기식으로 모달 페이지를 불러와서 열기
    $.ajax({
        url: url,
        type: "POST",
        dataType: "json",
        async: true,
        cache: false
        
    }).done(function(data) {
    	console.log(data)
    	
        // 모달 페이지를 추가한 후 열기
        $(".modal1").show();
        $(".modal-overlay").show();
        // 모달 닫고 요소 삭제(모달 재생성위해)
        $(".closeB").click(function() {
        	$(".modal1").hide();
            $(".modal-overlay").hide();
        });
        // table.jsp 삭제
        $("#table_form").remove();
        $(".modal1 .basicB.top input").remove();
        
        var str1 = "";
        
        for (var i = 0; i < data.length; i++) {
            str1 += "<tr>";
            str1 += "<td><input type='hidden' name='formvo["+i+"].item_id' value='"+data[i].item_id+"'>" + data[i].item_id + "</td>";
            str1 += "<td><input type='hidden' name='formvo["+i+"].item_name' value='"+data[i].item_name+"'>" + data[i].item_name + "</td>";
            str1 += "<td><input type='hidden' name='formvo["+i+"].standard' value='"+data[i].standard+"'>" + data[i].standard + "</td>";
            str1 += "<td><input type='hidden' name='formvo["+i+"].unit' value='"+data[i].unit+"'>" + data[i].unit + "</td>";
            str1 += "<td id='quantityUsedCell' class='quantity'>" +
            		"<input type='text' name='formvo["+i+"].quantity_used' value='0'></td>";
            str1 += "<td><textarea name='formvo["+i+"].significant' id='significantCell'></textarea></td>";
            str1 += "</tr>";
        }
        
        //
        $(".modal_title").html("자가사용입력");
        //
        $(".modal1 #title_name").html("자가사용입력>등록");
        
        // tbody 값 대체
        $(".modal1 .table.only tbody").html(str1);
        

        $(".modal1 .modalBtn").html("<input class='pointB submit' type='button' value='전체 적용'><input class='closeB' type='button' value='닫기'>");
        

        $(".modal1 .submit").click(function() {

            // 선택한 날짜 가져오기
            var selectedDate = $(".modal1 #searchDate").val();
            
        	if (confirm(selectedDate + " 해당 일자의 사용수량을 등록하시겠습니까?")) {
                // 확인 버튼을 눌렀을 때 실행되는 코드
        		$(".modal1 #table_only_form").attr("method", "POST"); // POST로 설정
        		$(".modal1 #table_only_form").attr("action", "/useInsert").submit(); // 폼 제출
                $(".modal1").remove();
                $(".modal-overlay").remove();
            } else {
                // 아니오 버튼을 눌렀을 때 실행되는 코드
                // 아무 동작 없음
            }

        });
    });
});

//모달 열기
$(document).on("click", "#orderModalOpen", function() {
    $.ajax({
        url: "/orderModal", // URL of the purchase.jsp page
        type: "GET",
        success: function(data) {
            // Update the content of the chartContent element with the response from purchase.jsp
        	$("body").append(data);
        },
        error: function(xhr, status, error) {
            alert("An error occurred while loading the page. Error: " + error);
            console.log("XHR status: " + status);
            console.log("Error details: " + error);
        }
    });		
})

			
// 선택한 checkbox 값을 저장할 배열
var selectedItems = [];

// 발주요청 품목 리스트
function orderRequest() {
/*    // 선택한 날짜 가져오기
    var selectedDate = $("#searchDate").val();
    // 선택한 부서 가져오기
    var selectedDept = $("#dept").val(); // 예시에서는 'dept'라는 id를 가진 요소로 가정
    
    // 사용 입력 품목 리스트 조회 URL
    var url = "/useList?date=" + encodeURIComponent(selectedDate) + "&dept=" + encodeURIComponent(selectedDept); // 예시 URL
*/
	// 선택한 부서 가져오기
	var selectedDept = $("#dept").val();
	// 사용 입력 품목 리스트 조회 URL
	var url = "/orderModal?dept=" + encodeURIComponent(selectedDept); // 예시 URL


    // Checkbox 변경 이벤트 감지
	$(document).on("change", ".table.checkbox tbody input[type='checkbox']", function() {
	    var checkbox = $(this);
	    var isChecked = checkbox.prop("checked");
	    var td = checkbox.closest("td");
	    var tr = td.closest("tr");
	    var item_id = tr.find("td:eq(1)").text();
	    var item_name = tr.find("td:eq(2)").text();
	    var standard = tr.find("td:eq(3)").text();
	    var unit = tr.find("td:eq(4)").text();
	    var supplier = tr.find("td:eq(5)").text();
	    var unit_price = tr.find("td:eq(6)").text();
	    var minimum_purchase_quantity = tr.find("td:eq(7)").text();
	    var current_amount = tr.find("td:eq(8)").text();
	    var safe_stock_quantity = tr.find("td:eq(9)").text();
	    var significant = tr.find("td:eq(10)").text();

	    // 선택한 checkbox 값이 변경되었을 때
	    if (isChecked) {
	        // 이미 선택된 항목인지 확인하여 중복 추가 방지
	        var isAlreadySelected = selectedItems.some(function(item) {
	            return item.item_id === item_id;
	        });

	        if (!isAlreadySelected) {
	            selectedItems.push({
	            	item_id: item_id,
	            	item_name: item_name,
	                standard: standard,
	                unit: unit,
	                supplier: supplier,
	                unit_price: unit_price,
	                minimum_purchase_quantity: minimum_purchase_quantity,
	                current_amount: current_amount,
	                safe_stock_quantity: safe_stock_quantity,
	                significant: significant
	            });
	        }
	    } else {
	        // 선택을 해제한 경우 selectedItems 배열에서 해당 품목 제거
	        selectedItems = selectedItems.filter(function(item) {
	            return item.item_id !== item_id;
	        });
	    }

	    //console.log(selectedItems);
	});
	
    // Ajax 요청 보내기
    $.ajax({
        url: url,
        async: true,
        type: "POST",
        dataType: "json", // 데이터 형식을 JSON으로 설정
        cache: false
    }).done(function(data) {
        // Contents 영역 삭제
    	$(".form_container2").remove();
    	$(".basicB.top input").remove();
    	$(".basicB button").remove();
    	
        // Contents 영역 교체
        //console.log(data);
        var str = "";
        
        if (data.length === 0) {
            str = '<tr><td colspan="6" style="text-align:center;">조회 결과가 없습니다.</td></tr>';
        } else {
            for (var i = 0; i < data.length; i++) {
                str += "<tr>";
                str += "<td><input type='checkbox' name='checkbox'></td>";
                str += "<td>" + data[i].item_id + "</td>";
                str += "<td>" + data[i].item_name + "</td>";
                str += "<td>" + data[i].standard + "</td>";
                str += "<td>" + data[i].unit + "</td>";
                
                str += "<td>" + data[i].itemsVO.supplier + "</td>";
                str += "<td class='quantity'>" + numberWithCommas(data[i].itemsVO.unit_price) + "</td>";
                str += "<td class='quantity'>" + data[i].itemsVO.minimum_purchase_quantity + "</td>";
                
                // 현재고 < 안전재고면 배경 붉게
                if (data[i].current_amount <= data[i].safe_stock_quantity) {
                    str += "<td class='quantity' style='background-color: #FFA7A7;'>" + data[i].current_amount + "</td>";
                } else {
                    str += "<td class='quantity'>" + data[i].current_amount + "</td>";
                }
                
                str += "<td class='quantity'>" + data[i].safe_stock_quantity + "</td>";
                str += "<td>" + data[i].significant + "</td>";
                str += "</tr>";
            }
        }
        
        $(".basicB.top").append("<input type='button' value='조회' style='margin: 4px;'>");
        $(".basicB.top").append("<input type='button' value='안전재고 이하 선택'>");
        
        // thead에 열 추가
        $(".table.checkbox thead tr").append("<th>거래처</th>");
        $(".table.checkbox thead tr").append("<th>가격</th>");
        $(".table.checkbox thead tr").append("<th>최소주문수량</th>");
        $(".table.checkbox thead tr").append("<th>현 재고</th>");
        $(".table.checkbox thead tr").append("<th>안전재고</th>");
        $(".table.checkbox thead tr").append("<th>특이사항</th>");
           
        // tbody 값 대체
        $(".table.checkbox tbody").html(str);
        
        // 
        $(".basicB.order").append("<input type='button' value='선택 적용' id='orderModalOpen' class='pointB'>");

        
    });

}



//모달 열기 버튼 클릭 이벤트 핸들러
$(document).on("click", "#orderModalOpen", function() {
    if ($(".modal1").length > 0) {
        // 기존 모달 창을 닫고 삭제
        $(".modal1").hide();
        $(".modal-overlay").hide();
        $(".modal1").remove();
        $(".modal-overlay").remove();
    }
    

	// 선택한 부서 가져오기
	var selectedDept = $("#dept").val();
	// 사용 입력 품목 리스트 조회 URL
	var url = "/orderModal?dept=" + encodeURIComponent(selectedDept); // 예시 URL
	
    // 비동기식으로 모달 페이지를 불러와서 열기
    $.ajax({
        url: url,
        type: "POST",
        dataType: "json",
        async: true,
        cache: false
        
    }).done(function(data) {
    	console.log(selectedItems);
    	console.log(data);
        // 모달 페이지를 추가한 후 열기
        $(".modal1").show();
        $(".modal-overlay").show();
        // 모달 닫고 요소 삭제(모달 재생성위해)
        $(".closeB").click(function() {
        	$(".modal1").hide();
            $(".modal-overlay").hide();
        });
        // table.jsp 삭제
        $(".modal1 #table_form").remove();
        $(".modal1 .basicB.top input").remove();
        // name 속성값(date) 변경
        $('.modal1 #searchDate').attr('name', 'requestDate');
        
        var str1 = "";
        
        for (var i = 0; i < selectedItems.length; i++) {
            str1 += "<tr>";
            str1 += "<td><input type='hidden' name='formordervo["+i+"].item_id' value='"+selectedItems[i].item_id+"'>" + selectedItems[i].item_id + "</td>";
            str1 += "<td><input type='hidden' name='formordervo["+i+"].item_name' value='"+selectedItems[i].item_name+"'>" + selectedItems[i].item_name + "</td>";
            str1 += "<td><input type='hidden' name='formordervo["+i+"].standard' value='"+selectedItems[i].standard+"'>" + selectedItems[i].standard + "</td>";
            str1 += "<td><input type='hidden' name='formordervo["+i+"].unit' value='"+selectedItems[i].unit+"'>" + selectedItems[i].unit + "</td>";
            str1 += "<td><input type='hidden' name='formordervo["+i+"].supplier' value='"+selectedItems[i].supplier+"'>" + selectedItems[i].supplier + "</td>"; 
            str1 += "<td class='quantity'><input type='hidden' name='formordervo["+i+"].unit_price' value='"+numberWithCommas(selectedItems[i].unit_price)+"' >" + selectedItems[i].unit_price + "</td>";
            str1 += "<td class='quantity'><input type='hidden'>" + selectedItems[i].minimum_purchase_quantity + "</td>";
            str1 += "<td class='quantity'><input type='hidden'>" + selectedItems[i].current_amount + "</td>";
            str1 += "<td class='quantity'><input type='hidden'>" + selectedItems[i].safe_stock_quantity + "</td>";
            str1 += "<td id='quantityUsedCell' class='quantity'>" +
            		"<input type='text' name='formordervo["+i+"].order_quantity' value='0'></td>";
            str1 += "<td><textarea name='formordervo["+i+"].significant' id='significantCell'></textarea></td>";
            str1 += "</tr>";
        }
        
        //
        $(".modal_title").html("발주요청서");
        //
        $(".modal1 #title_name").html("발주요청서>작성");
        
        // thead에 열 추가        
        var $fourthTh = $("<th>거래처</th>");
        $(".modal1 .table.only tr").find("th:eq(3)").after($fourthTh);
        var $fifthTh = $("<th>가격</th>");
        $(".modal1 .table.only tr").find("th:eq(4)").after($fifthTh);
        var $sixthTh = $("<th>최소주문수량</th>");
        $(".modal1 .table.only tr").find("th:eq(5)").after($sixthTh);
        var $seventhTh = $("<th>현 재고</th>");
        $(".modal1 .table.only tr").find("th:eq(6)").after($seventhTh);
        var $eighthTh = $("<th>안전재고</th>");
        $(".modal1 .table.only tr").find("th:eq(7)").after($eighthTh);
        
        // tbody 값 대체
        $(".modal1 .table.only tbody").html(str1);
        

        $(".modal1 .modalBtn").html("<input class='pointB submit' type='button' value='발주 요청'><input class='closeB' type='button' value='닫기'>");
        

        $(".modal1 .submit").click(function() {

            // 선택한 날짜 가져오기
            var selectedDate = $(".modal1 #searchDate").val();
            
        	if (confirm(selectedDate + " 총무과에 발주요청을 하시겠습니까?")) {
                // 확인 버튼을 눌렀을 때 실행되는 코드
        		$(".modal1 #table_only_form").attr("method", "POST"); // POST로 설정
        		$(".modal1 #table_only_form").attr("action", "/orderInsert").submit(); // 폼 제출
                $(".modal1").remove();
                $(".modal-overlay").remove();
            } else {
                // 아니오 버튼을 눌렀을 때 실행되는 코드
                // 아무 동작 없음
            }

        });
    });
});
