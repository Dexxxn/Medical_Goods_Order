<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>

<div class="page-wrapper">
  <div class="ts-1" style="padding:70px 25px">
    <div class="ts-2">
      <h3 class="text-themecolor" style="line-height:30px; font-size:25px; margin-top:30px; margin-bottom:30px;">거래 명세서</h3>
    </div>
    <div class="ts-3" style="background-color:white; color:black">
      <p>거래 명세서</p>
      <div style="width:30%;float:left;">
        <table class="ts-4"style="border:1px solid; background-color:white; font-size:15px; color:black ">
          <tr><td>KSHospital</td></tr>
          <tr><td>서울특별시 서대문구 신촌동 연세로 50-1</td></tr>
          <tr><td>02-2228-1004</td></tr>
        </table>
      </div>
      <div style="width:50%;float:right;">
        <table class="ts-5" border="2" style="border:1px solid; background-color:white; font-size:15px; color:black ">
          <tr>
            <td rowspan="4">공급자</td>
            <td>일련번호</td>
            <td>${inventoryList1[0].date}</td>
            <td>TEL</td>
            <td>${inventoryList1[0].items.getTEL()}</td>
          </tr>
          <tr>
            <td>사업자등록번호</td>
            <td>${inventoryList1[0].items.getCRN()}</td>
            <td>성명</td>
            <td>대표자</td>
          </tr>
          <tr>
            <td>상호</td>
            <td colspan="3">${inventoryList1[0].items.getSupplier()}</td>
          </tr>
          <tr>
            <td>주소</td>
            <td colspan="3">${inventoryList1[0].items.getAddress()}</td>
          </tr>
        </table>
      </div>
      <div class="ts-6" style="width:50%; float:left;">
        <table border="3">
          <tr>
            <td id="totalAmount">금액: </td>
          </tr>
        </table>
      </div>
      <div class="ts-7">
        <table border="2" id="inventoryTable" class="ts-10" style="border:1px solid; background-color:white; font-size:15px; color:black ">
          <tr>
            <td>일자</td>
            <td>품목명</td>
            <td>수량</td>
            <td>단가</td>
            <td>공급가액</td>
            <td>부가세</td>
            <td>금액</td>
          </tr>
          <c:forEach items="${inventoryList1}" var="inventory">
            <tr>
              <td>${inventory.date}</td>
              <td>${inventory.item_name}</td>
              <td>${inventory.enter_quantity}</td>
              <td>${inventory.items.unit_price}</td>
              <td>${(inventory.enter_quantity * inventory.items.unit_price)}</td>
              <td>${(inventory.enter_quantity * inventory.items.unit_price) * 0.1}</td>
              <td>${(inventory.enter_quantity * inventory.items.unit_price) + ((inventory.enter_quantity * inventory.items.unit_price) * 0.1)}</td>
            </tr>
          </c:forEach>
        </table>
      </div>
      <div class="ts-8">
  <table border="3">
    <tr>
      <td>수량</td>
      <td id="totalQuantity"></td>
      <td>단가</td>
      <td id="totalUnitPrice"></td>
      <td>공급가액</td>
      <td id="totalSupplyAmount"></td>
      <td>부가세</td>
      <td id="totalVAT"></td>
      <td>담당자</td>
      <td>${inventoryList1[0].name}</td>					
    </tr>
  </table>
</div>
    </div>
    <div class="ts-9">
      <button class="btn" id="printButton">인쇄</button>		
    </div>
  </div>
</div>

<script>
  document.addEventListener("DOMContentLoaded", function() {
    var totalAmount = 0;
    var amounts = document.querySelectorAll("#inventoryTable td:nth-child(7)");
    amounts.forEach(function(amount) {
      var cellAmount = parseFloat(amount.innerText.replace(/,/g, '')); // 쉼표(,)를 제거한 후 숫자로 변환
      if (!isNaN(cellAmount)) {
        totalAmount += cellAmount;
      }
    });
    var formattedTotalAmount = totalAmount.toLocaleString(); // 숫자를 천 단위마다 쉼표(,)로 구분하여 포맷팅
    document.getElementById("totalAmount").innerText = "총액: " + formattedTotalAmount + "원";
  });
  
  document.addEventListener("DOMContentLoaded", function() {
	  var totalQuantity = 0;
	  var totalUnitPrice = 0;
	  var totalSupplyAmount = 0;
	  var totalVAT = 0;
	  
	  var rows = document.querySelectorAll("#inventoryTable tr"); // 테이블의 모든 행 선택
	  rows.forEach(function(row) {
	    var quantity = parseFloat(row.cells[2].innerText); // 수량 셀 (3번째 열)
	    var unitPrice = parseFloat(row.cells[3].innerText); // 단가 셀 (4번째 열)
	    var supplyAmount = parseFloat(row.cells[4].innerText); // 공급가액 셀 (5번째 열)
	    var vat = parseFloat(row.cells[5].innerText); // 부가세 셀 (6번째 열)
	    
	    if (!isNaN(quantity)) {
	      totalQuantity += quantity;
	    }
	    
	    if (!isNaN(unitPrice)) {
	      totalUnitPrice += unitPrice;
	    }
	    
	    if (!isNaN(supplyAmount)) {
	      totalSupplyAmount += supplyAmount;
	    }
	    
	    if (!isNaN(vat)) {
	      totalVAT += vat;
	    }
	  });
	  
	  document.getElementById("totalQuantity").innerText = totalQuantity;
	  document.getElementById("totalUnitPrice").innerText = totalUnitPrice.toLocaleString();
	  document.getElementById("totalSupplyAmount").innerText = totalSupplyAmount.toLocaleString();
	  document.getElementById("totalVAT").innerText = totalVAT.toLocaleString();
	});
</script>

<style>
  .ts-3 { padding: 20px 40px; }
  .ts-6 { padding-top: 90px; padding-bottom: 60px; }
  .ts-7 { padding-bottom: 50px; }
  .ts-9 { padding-top: 30px; }
  .ts-4 { padding-top: 15px; padding-bottom: 15px; padding-left: 20px; }
  td { padding: 20px 30px; text-align: center; }
  p { padding-top: 37px; padding-bottom: 15px; padding-left: 73px; font-size: 30px; font-weight: bold; }
  .btn { padding: 5px 20px; }
</style>

<%@ include file="footer.jsp" %>