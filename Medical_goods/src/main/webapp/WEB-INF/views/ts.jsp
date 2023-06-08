<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "header.jsp" %>

<div class="page-wrapper">
	<div class="ts-1" style="padding:70px 25px">
		<div class="ts-2">
			<h2 class="text-themecolor" style="line-height:30px; font-size:30px; margin-top:30px; margin-bottom:30px;">거래 명세서</h2>
		</div>
		<div class="ts-3" style="background-color:white; color:black">
		<p>거래 명세서</p>
			<div style="width:30%;float:left;">
			<table class="ts-4"style="border:1px solid; background-color:white; font-size:15px; color:black ">
				<tr><td>업체명(supplier)</td></tr>
				<tr><td>주소(address)</td></tr>
				<tr><td>전화번호(TEL)aaaaaaaaaaaaaaaaaaaa</td></tr>
			</table>
			</div>
			<div style="width:50%;float:right;">
			<table class="ts-5" border="2" style="border:1px solid; background-color:white; font-size:15px; color:black ">
				<tr>
				<td rowspan="4">공급자</td>
				<td>일련번호</td>
				<td>inventory-(date)</td>
				<td>TEL</td>
				<td>items-(TEL)</td>
				</tr>
				<tr>
				<td>사업자등록번호</td>
				<td>items-(CRN)</td>
				<td>성명</td>
				<td>대표자</td>
				</tr>
				<tr>
				<td>상호</td>
				<td colspan="3">items-(supplier)</td>
				</tr>
				<tr>
				<td>주소</td>
				<td colspan="3">items-(address)</td>
				</tr>
			</table>
			</div>
			<div class="ts-6" style="width:50%; float:left;" >
			<table border="3">
				<tr><td>금액: </td></tr>
			</table>
			</div>
			<div class="ts-7">
			<table border="2" style="border:1px solid; background-color:white; font-size:15px; color:black ">
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
			</div>
			<div class="ts-8">
			<table border="3">
				<tr>
					<td>수량</td>
					<td>총수량</td>
					<td>공급가액</td>
					<td>총 공급가액</td>
					<td>부가세</td>
					<td>총 부가세</td>
					<td>합계</td>
					<td>총 단가</td>
					<td>인수</td>
					<td> </td>					
				</tr>
			</table>
			</div>
		</div>		
	</div>
</div> 
 
 <style>
<!--
.ts-6{padding-top:75px;padding-bottom:40px}
.ts-7{padding-bottom:50px}
.ts-4{padding-top:15px;padding-bottom:15px;padding-left:20px;}
td{padding:20px 30px;text-align:center;}
p{padding-top:30px;padding-bottom:15px;padding-left:100px;font-size:19px; font-weight:bold;}
-->
</style>
 <%@ include file = "footer.jsp" %>