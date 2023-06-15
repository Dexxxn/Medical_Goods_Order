/**
 * 총무과 - 발주계획서 작성 (성언)
 * 
 * function list(url) {
    // Ajax 요청 보내기
    $.ajax({
        url: url,
        async: true,
        type: "POST",
        dataType: "json", // 데이터 형식을 JSON으로 설정
        cache: false
    }).done(function(data) {
        // Contents 영역 삭제
        $('#CheckboxTable').children().remove();
        //$('.table.only').children().remove();

        // Contents 영역 교체
        console.log(data)
        var str = "";
        
        for (var i = 0; i < data.length; i++) {
            str += "<tr>";
            str += "<td>" + data[i].item_id + "</td>";
            str += "<td>" + data[i].item_name + "</td>";
            str += "<td>" + data[i].unit + "</td>";
            str += "<td>" + data[i].current_amount + "</td>";
            str += "</tr>";
        }
         	
        $(".table.only tbody").html(str);
    });
}


 * 
 * 
 * 
 */
// 사용 입력 품목 리스트
function requestList(url) {
    // Ajax 요청 보내기
    $.ajax({
        url: url,
        async: true,
        type: "POST",
        dataType: "json", // 데이터 형식을 JSON으로 설정
        cache: false
    }).done(function(data) {
        // Contents 영역 삭제
    	.remove();
        // Contents 영역 교체
    	
    	
    	
    	
        console.log(data);
        
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
        
    });

}

