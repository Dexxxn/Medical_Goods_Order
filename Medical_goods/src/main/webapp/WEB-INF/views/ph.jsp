<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "header.jsp" %>

<div class="page-wrapper">
	<div class="ph-1" style="padding:70px 25px">
			<h3 class="text-themecolor" style="line-height:40px; font-size:21px; margin-top:30px; margin-bottom:30px;">담당자 별 구매이력 조회</h3>
		<div class="ph-2" style="border:1px; background-color:white; font-size:15px; color:black">
			<table>
				<tr><td style="font-size:25px; color:#035AA6;margin-bottom:20px">Purchase history</td></tr>
				<tr>
					<td style="color:#035AA6">부서</td>
					<td><select id="deptSelect" style="background-color:#f6f9fa">
							  <option value="blanck"> </option>
							  <option value="dept1">병동A</option>
							  <option value="dept2">병동B</option>
							  <option value="dept3">병동C</option>
							  <option value="dept3">처치실</option>
							  <option value="dept3">수술실</option>
							</select></td>
				</tr>
				<tr>
					<td style="color:#035AA6">담당자</td>
					<td><select id="categorySelect" style="background-color:#f6f9fa">
							  <option value="blanck"> </option>
							  <option value="manager1">정기원</option>
							  <option value="manager2">이성언</option>
							  <option value="manager3">장희영</option>
							</select></td>
				</tr>
				<tr>
					<td style="color:#035AA6">날짜</td>
					<td><input class="date" type="date" name="startday" style="background-color:#f6f9fa"></td>
				</tr>
			</table>
		</div>
		<div class="ph-3">
		<a href="/ph_detail"><button class="btn" id="searchButton">검색</button></a>
		</div>
	</div>
</div>
<style>
td{padding:10px 20px}
.btn{padding:5px 20px}
.ph-3{padding-top:30px}
</style>
<%@ include file = "footer.jsp" %>