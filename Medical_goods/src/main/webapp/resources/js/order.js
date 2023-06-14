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


  /*  $.ajax({
        url: "form.jsp", // form.jsp의 URL
        type: "GET",
        success: function(data) {
            // form.jsp의 내용을 가져옴
            var modifiedContent = modifyFormContent(data);
            
            // Update the content of the formAll element with the modified content
            $("#formAll").html(modifiedContent);
        },
        error: function(xhr, status, error) {
            alert("페이지 로드 중 오류 발생. Error: " + error);
            console.log("XHR status: " + status);
            console.log("Error details: " + error);
        }
    });

    // form.jsp의 내용을 수정하는 함수
    function modifyFormContent(content) {
        // content를 필요에 따라 수정
        // 예시: <label> 내용 변경
        content = content.replace("<label>사용일자</label>", "<label>일자</label>");
        content = content.replace("<label>특이사항</label>", "<label>희망 입고일자</label>");
        content = content.replace("<label>담당자</label>", "<label>발주 담당자</label>");
        content = content.replace("<label>진료과</label>", "<label>입고받을 진료과</label>");
        
        // 예시: <input> type 속성 변경
        content = content.replace('<input id="searchDate" type="date">', '<input id="searchDate" type="date">');
        content = content.replace('<input id="dept" type="text">', '<input id="dept" type="select">');
        content = content.replace('<input id="manager" type="text">', '<input id="manager" type="select">');
        content = content.replace('<input id="signi" type="text">', '<input id="signi" type="date">');
        
        // 수정된 내용 반환
        return content;
    }
*/