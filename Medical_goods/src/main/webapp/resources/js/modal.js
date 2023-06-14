// 모달 열기
$(document).ready(function() {
	$(".modalShow").click(function() {
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

// 물품 사용 입력
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
            str += "<td>" + data[i].current_amount + "</td>";
            str += "</tr>";
        }
        
        // tbody 값 대체
        $(".table.only tbody").html(str);
        
    });

}
