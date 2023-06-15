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
        console.log(data)
        var str = "";
        
        for (var i = 0; i < data.length; i++) {
            str += "<tr>";
            str += "<td>" + data[i].item_id + "</td>";
            str += "<td>" + data[i].item_name + "</td>";
            str += "<td>" + data[i].unit + "</td>";
            str += "<td>" + data[i].current_amount + "</td>";
            str += "<td>" + data[i].current_amount + "</td>";
            str += "<td>" + data[i].current_amount + "</td>";
            str += "<td>" + data[i].current_amount + "</td>";
            str += "<td>" + data[i].current_amount + "</td>";
            str += "<td>" + data[i].current_amount + "</td>";
            str += "</tr>";
        }
        
        // thead에 열 추가
        $(".table.only thead tr").append("<th>병동A</th>");
        $(".table.only thead tr").append("<th>병동B</th>");
        $(".table.only thead tr").append("<th>병동C</th>");
        $(".table.only thead tr").append("<th>수술실</th>");
        $(".table.only thead tr").append("<th>처치실</th>"); 	
        // tbody 값 대체
        $(".table.only tbody").html(str);
        // 데이터가 많으니 길이 조정
        $(".table-container").css({
        	width: '1200px'
        });
        
    });

}

// 사용 입력 품목 리스트
function useList(url) {
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
        
        for (var i = 0; i < data.length; i++) {
            str += "<tr>";
            str += "<td>" + data[i].item_id + "</td>";
            str += "<td>" + data[i].item_name + "</td>";
            str += "<td>" + data[i].unit + "</td>";
            str += "<td>" + data[i].quantity_used + "</td>";
            str += "<td>" + data[i].significant + "</td>";
            str += "</tr>";
        }
        
        // thead에 열 추가
        $(".table.only thead tr").append("<th>특이사항</th>");
        
        // tbody 값 대체
        $(".table.only tbody").html(str);
        
        // 등록 버튼 생성
    	$(".basicB.top").append("<input type='button' id='modalOpen' value='등록'>");
    	// 모달 창 열기
        $(document).on("click", "#modalOpen", function() {
            // 비동기식으로 모달 페이지를 불러와서 열기
            $.ajax({
                url: "/modal",
                async: true,
                cache: false
            }).done(function(modalContent) {
                // 모달 페이지를 추가한 후 열기
                $("body").append(modalContent);
                $(".modal1").modal("show");
                $(".modal-overlay").show();
                // 모달 닫고 요소 삭제(모달 재생성위해)
                $(".closeB").click(function() {
                    $(".modal1").hide();
                    $(".modal-overlay").hide();
                    $(".modal1").remove(); // 모달 페이지 삭제
                    $(".modal-overlay").remove(); // 모달 오버레이 삭제
                });
                // table.jsp 삭제
                $("#oo").remove();
                // thead에 열 추가
                $(".table.only thead tr").append("<th>특이사항</th>");
                // tbody 값 대체
                $(".table.only tbody").html(str);
            });
        });
    });

}

/*    	
// 모달 열기
$(document).ready(function() {
	$("#modal").click(function() {
		$(".modal1").show();
		$(".modal-overlay").show();
	});
});
// 모달 닫기
$(document).ready(function() {
	// x 아이콘 클릭 시 모달 닫기
	$(".closeB").click(function() {
		$(".modal1").hide();
		$(".modal-overlay").hide();
	});
});
*/