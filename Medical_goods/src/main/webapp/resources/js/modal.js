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
    	
        // Contents 영역 교체
        //console.log(data)
        var str = "";
        
        var currentAmountDeptA = [];
        var currentAmountDeptB = [];
        var currentAmountDeptC = [];
        var currentAmountDeptD = [];
        var currentAmountDeptE = [];
        var currentAmountTotal = [];
        
        for (var i = 0; i < data.length; i++) {
            if (data[i].dept === '병동A') {
                currentAmountDeptA.push(data[i].current_amount);
            } else if (data[i].dept === '병동B') {
                currentAmountDeptB.push(data[i].current_amount);
            } else if (data[i].dept === '병동C') {
                currentAmountDeptC.push(data[i].current_amount);
            } else if (data[i].dept === '수술실') {
                currentAmountDeptD.push(data[i].current_amount);
            } else if (data[i].dept === '처치실') {
                currentAmountDeptE.push(data[i].current_amount);
            }
        }
        
        for (var i = 0; i < data.length; i++) {
            str += "<tr>";
	            str += "<td>" + data[i].item_id + "</td>";
	            str += "<td>" + data[i].item_name + "</td>";
	            str += "<td>" + data[i].standard + "</td>";
	            str += "<td>" + data[i].unit + "</td>";
	            str += "<td class='quantity'><b>" + (currentAmountDeptA[i] + currentAmountDeptB[i] + currentAmountDeptC[i] + currentAmountDeptD[i] + currentAmountDeptE[i]) + "</b></td>";
	            str += "<td class='quantity'>" + currentAmountDeptA[i] + "</td>";
	            str += "<td class='quantity'>" + currentAmountDeptB[i] + "</td>";
	            str += "<td class='quantity'>" + currentAmountDeptC[i] + "</td>";
	            str += "<td class='quantity'>" + currentAmountDeptD[i] + "</td>";
	            str += "<td class='quantity'>" + currentAmountDeptE[i] + "</td>";
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
            str1 += "<td><input type='text' name='formvo["+i+"].significant'></td>";
            str1 += "</tr>";
        }

        
/*        str1 += "<tr>";
        str1 += "<td><input type='hidden' name='item_id' value='"+data[0].item_id+"'>" + data[0].item_id + "</td>";
        str1 += "<td><input type='hidden' name='item_name' value='"+data[0].item_name+"'>" + data[0].item_name + "</td>";
        str1 += "<td><input type='hidden' name='standard' value='"+data[0].standard+"'>" + data[0].standard + "</td>";
        str1 += "<td><input type='hidden' name='unit' value='"+data[0].unit+"'>" + data[0].unit + "</td>";
        str1 += "<td id='quantityUsedCell' class='quantity'>" +
        		"<input type='text' name='quantity_used' value='0'></td>";
        str1 += "<td><input type='text' name='significant'></td>";
        str1 += "</tr>";*/
        
        //
        $(".modal_title").html("자가사용입력");
        //
        $(".modal1 #title_name").html("자가사용입력>사용수량등록");
        
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

// 발주요청 품목 리스트
function orderList() {
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
	var url = "/modal?dept=" + encodeURIComponent(selectedDept); // 예시 URL
		
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
    	
        // Contents 영역 교체
        console.log(data)
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
        
        // thead에 열 추가
        $(".table.checkbox thead tr").append("<th>현 재고</th>");
        $(".table.checkbox thead tr").append("<th>안전재고</th>");
        $(".table.checkbox thead tr").append("<th>특이사항</th>");
           
        // tbody 값 대체
        $(".table.checkbox tbody").html(str);
        
      
        
    });

}
