// 모달 열기
$(document).ready(function() {
	$("#modalShow").click(function() {
		$(".modal1").show();
		$(".modal-overlay").show();
	});
});

// 모달 닫기
$(document).ready(function() {
	// x 아이콘 클릭 시 모달 닫기
	$(".closeB").click(function() {
		$(".modal1").hide();
	});
});


/*function link(url){

    // ajax option

    var ajaxOption = {

            url : url,

            async : true,

            type : "POST",

            dataType : "html",
            cache : false

    };

    

    $.ajax(ajaxOption).done(function(data){

        // Contents 영역 삭제
    	$('#publicTable').children().remove();

        $('.table.only table tbody').children().remove();

        // Contents 영역 교체
        var str = "";
        for (var i = 0; i < data.list.length; i++) {
            str += "<tr>";
            str += "<td>" + data.list[i].item_id + "</td>";
            str += "<td>" + data.list[i].item_name + "</td>";
            str += "<td>" + data.list[i].unit + "</td>";
            str += "<td>" + data.list[i].current_amount + "</td>";
            str += "</tr>";
        };
        	
        $(".table.only").html(str);

    });

}
*/

function list(url) {
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


/*

// 재고 리스트 불러오기
$(document).ready(function() {
    $.ajax({
        url: '/modal',
        type: 'GET',
        dataType: 'html',
        success: function(response) {
            var data = response.data;
            var str = "";
            
            for (var i = 0; i < data.list.length; i++) {
                str += "<tr>";
                str += "<td><input type='checkbox' name='checkbox' onclick='selectAll(this)'></td>";
                str += "<td>" + data.list[i].item_id + "</td>";
                str += "<td>" + data.list[i].item_name + "</td>";
                str += "<td>" + data.list[i].unit + "</td>";
                str += "<td>" + data.list[i].current_amount + "</td>";
                str += "</tr>";
            }
            	
            $("#publicTable tbody").html(str);
            
            //showIndexPage(data.index, page);
        },
        error: function(xhr, status, error) {
            // Ajax 요청이 실패한 경우 처리할 코드를 작성합니다.
            alert("실패");
        }
    });
});*/