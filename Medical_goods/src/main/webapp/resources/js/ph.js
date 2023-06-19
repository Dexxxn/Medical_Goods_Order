$(document).ready(function() {
  // 부서 선택 시 직원 리스트 업데이트
  $("#Select_dept").on("change", function() {
    var deptValue = $("select[name='dept']").val();
    list({ dept: deptValue });
  });

  function list(param) {
    var dept = param.dept;
    $.getJSON("/ph/" + dept + ".json", function(data) {
      var str = "<option>선택</option>";
      for (var i = 0; i < data.length; i++) {
        str += "<option>" + data[i].name + "</option>";
      }
      $("#Select_name").html(str);
    });
  }

  // 검색 버튼 클릭 시 구매 이력 페이지로 이동
  $("#searchLink").on("click", function(event) {
    event.preventDefault();
    var selectedDept = $("#Select_dept").val();
    var selectedName = $("#Select_name").val();
    var selectedDate = $("input[name='startday']").val();     
    var url =
      "/ph_detail?dept=" +
      encodeURIComponent(selectedDept) +
      "&name=" +
      encodeURIComponent(selectedName) +
      "&date=" +
      encodeURIComponent(selectedDate);
    window.location.href = url;
  });

  // 구매 이력 페이지 로딩 시 선택된 이름과 날짜 표시
  /*var urlParams = new URLSearchParams(window.location.search);
  var selectedName = urlParams.get("name");
  var selectedDate = urlParams.get("date");
  $("#purchaseDate").text(selectedName + "님 구매이력 (" + selectedDate + ")");*/

  // 구매 이력 페이지 로딩 시 테이블에 데이터 추가
  var requestData = {
	        dept: urlParams.get("dept"),
	        name: selectedName,
	        date: selectedDate
	    };

  // 서버에 데이터 조회 요청
  $.ajax({
    url: "/ph_inventory", // 데이터 조회를 위한 서버 API 엔드포인트
    method: "GET",
    data: requestData,
    success: function(response) {
      var inventoryList = response;
      var tableBody = $(".ph1-3");

      // 데이터를 반복하여 테이블에 추가
      inventoryList.forEach(function(inventory) {
        var row = $("<tr></tr>");

        // 각 칼럼 데이터 추가
        row.append($("<td>" + inventory.date + "</td>"));
        row.append($("<td>" + inventory.item_name + "</td>"));
        row.append($("<td>" + inventory.items.supplier + "</td>"));
        row.append($("<td>" + inventory.enter_quantity + "</td>"));
        row.append($("<td>" + inventory.items.unit_price + "</td>"));


        tableBody.append(row);
      });
    },
    error: function(error) {
      console.log("Error:", error);
    }
  });
});