<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ include file = "header.jsp" %> --%>
<div class="page-wrapper">
	<div class="ph1-1" style="padding:70px 25px">
		<h3 class="text-themecolor" style="line-height:40px; font-size:21px; margin-top:30px; margin-bottom:30px;"><span id="purchaseDate">ooo님 구매이력 (oooo년 oo월 oo일)</span></h3>
		<div class="ph1-2" style="border:1px; background-color:white; font-size:15px; color:black">
			<table class="ph1-3" border="2" style="border:1px solid; background-color:white; font-size:15px; color:black ">
				<tr>
				<td>일자</td>
				<td>품목명</td>
				<td>수량</td>
				<td>단가</td>
				<td>공급가액</td>
				<td>부가세</td>
				</tr>
				<tr>
				<td>입고일자(inventory-date)</td>
				<td>inventory-item_name</td>
				<td>inventory-enter_quantity</td>
				<td>items-unit_price</td>
				<td>items-supply_value</td>
				<td>items-VAT</td>
				</tr>
			</table>
			<div class="ph1-4">
			<table border="3">
				<tr><td>금액: </td></tr>
			</table>
			</div>			
		</div>
		<div class="ph1-5">
		<a href="/ph"><button class="btn" id="backButton">뒤로가기</button></a>
		</div>
	</div>
</div>

<style>
td{padding:15px 66px;text-align:center;}
.ph1-2{padding-top:30px;padding-bottom:40px;}
.ph1-3{margin-top:30px;margin-bottom:40px;}
.btn{padding:5px 20px}
.ph1-5{padding-top:30px}
</style>
<%-- <%@ include file = "footer.jsp" %> --%>