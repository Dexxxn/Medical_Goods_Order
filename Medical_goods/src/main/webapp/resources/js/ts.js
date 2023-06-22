$("#searchButton").on("click", function(event) {
    event.preventDefault();
    var selectedSupplier = $("#supplierSelect").val();
    var selectedName = $("#select_name").val();
    var selectedDate = $("input[name='startday']").val();


    var requestData = {
    	supplier: selectedSupplier,
        name: selectedName,
        date: selectedDate
    };

    $.ajax({
        url: "/ts_inventory",
        method: "GET",
        data: requestData,
        success: function(response) {
            var inventoryList1 = response;
            var tableBody = $(".ts-10");
            tableBody.empty(); // 이전 결과 삭제

            inventoryList1.forEach(function(inventory) {
                var row = $("<tr></tr>");

                row.append($("<td>" + inventory.date + "</td>"));
                row.append($("<td>" + inventory.item_name + "</td>"));
                row.append($("<td>" + inventory.enter_quantity + "</td>"));
                row.append($("<td>" + inventory.items.unit_price + "</td>"));

                tableBody.append(row);
            });
        },
        error: function(error) {
            console.log("Error:", error);
        }
    });

    var url =
    	  "/ts?supplier=" +
    	  encodeURIComponent(selectedSupplier) +
    	  "&name=" +
    	  encodeURIComponent(selectedName) +
    	  "&date=" +
    	  encodeURIComponent(selectedDate);

    	window.location.href = url;
});

