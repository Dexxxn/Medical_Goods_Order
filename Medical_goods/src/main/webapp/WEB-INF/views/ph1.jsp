<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="resources/js/ph.js" type="text/javascript"></script> 
 <%@ include file = "header.jsp" %> 
<div class="page-wrapper">
	<div class="ph1-1" style="padding:70px 25px">
		<h3 class="text-themecolor" style="line-height:40px; font-size:21px; margin-top:30px; margin-bottom:30px;"><span id="purchaseDate">ooo님 구매이력 (oooo년 oo월 oo일)</span></h3>
		<div class="ph1-2" style="border:1px; background-color:white; font-size:15px; color:black">
			<table class="ph1-3" id= "inventoryTable" border="2" style="border:1px solid; background-color:white; font-size:15px; color:black ">
				<tr>
				<td>일자</td>
				<td>품목명</td>
				<td>업체명</td>
				<td>수량</td>
				<td>단가</td>
				<td>공급가액</td>
				<td>부가세</td>
				<td>금액</td>
				</tr>
				<c:forEach items="${inventoryList}" var="inventory">
				<tr>
	            <td>${inventory.date}</td>
	            <td>${inventory.item_name}</td>
	            <td>${inventory.items.getSupplier()}</td>
	            <td>${inventory.enter_quantity}</td>
	            <td>${inventory.items.getUnit_price()}원</td>
	            <td>${(inventory.enter_quantity * inventory.items.unit_price)}원</td>
	            <td>${(inventory.enter_quantity * inventory.items.unit_price) * 0.1}원</td>
	            <td>${(inventory.enter_quantity * inventory.items.unit_price) + ((inventory.enter_quantity * inventory.items.unit_price) * 0.1)}원</td>
        		</tr>
				</c:forEach>
			</table>
			<div class="ph1-4">
			<table border="3">
				<tr><td id="totalAmount">총액: </td></tr>
			</table>
			</div>			
		</div>
		<div class="ph1-5">
		<a href="/ph"><button class="btn" id="backButton">뒤로가기</button></a>
		</div>
	</div>
</div>
<script>
    // JavaScript를 사용하여 총액 계산 및 표시
    var totalAmount = 0;
    var amounts = document.querySelectorAll("#inventoryTable td:nth-child(8)"); // 금액 열의 모든 셀을 선택
    amounts.forEach(function(amount) {
        var cellAmount = parseFloat(amount.innerText.replace(/,/g, '')); // 쉼표(,)를 제거한 후 숫자로 변환
        if (!isNaN(cellAmount)) {
            totalAmount += cellAmount;
        }
    });
    var formattedTotalAmount = totalAmount.toLocaleString(); // 숫자를 천 단위마다 쉼표(,)로 구분하여 포맷팅
    document.getElementById("totalAmount").innerText = "총액: " + formattedTotalAmount + "원";
    
    var urlParams = new URLSearchParams(window.location.search);
    var selectedName = urlParams.get("name");
    var selectedDate = urlParams.get("date");
    $("#purchaseDate").text(selectedName + "님 구매이력 (" + selectedDate + ")");
</script>
<style>
td{padding:15px 66px;text-align:center;}
.ph1-2{padding-top:30px;padding-bottom:40px;}
.ph1-3{margin-top:30px;margin-bottom:40px;}
.btn{padding:5px 20px}
.ph1-5{padding-top:30px}
</style>
 <%@ include file = "footer.jsp" %> 