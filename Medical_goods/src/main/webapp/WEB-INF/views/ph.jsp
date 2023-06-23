<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ include file = "header.jsp" %> --%>
 <script src="resources/js/ph.js" type="text/javascript"></script> 



<div class="page-wrapper">
	<div class="ph-1" style="padding:70px 25px">
			<h3 class="text-themecolor" style="line-height:40px; font-size:21px; margin-top:30px; margin-bottom:30px;">담당자 별 구매이력 조회</h3>
		<div class="ph-2" style="border:1px; background-color:white; font-size:15px; color:black">
			<table>
				<tr><td style="font-size:25px; color:#035AA6;margin-bottom:20px">Purchase history</td></tr>
				<tr>
					<td style="color:#035AA6">부서</td>
					<td><select id="Select_dept" style="background-color:#f6f9fa" name="dept" >
							  <option>선택</option>
							  <option value="병동A">병동A</option>
							  <option value="병동B">병동B</option>
							  <option value="병동C">병동C</option>
							  <option value="처치실">처치실</option>
							  <option value="수술실">수술실</option>
							  <option value="총무팀A">총무팀</option>
							</select></td>
				</tr>
				<tr>
					<td style="color:#035AA6">담당자</td>
					<td><select id="Select_name" style="background-color:#f6f9fa" name="name">
							
							</select></td>
				</tr>
				<tr>
					<td style="color:#035AA6">날짜</td>
					<td><input class="date" type="date" name="startday" style="background-color:#f6f9fa"></td>
				</tr>
			</table>
		</div>
		<div class="ph-3">
			<a href="#" id="searchLink">
  				<button class="btn" id="searchButton">검색</button>
			</a>
		</div>
	</div>
</div>
<style>
.ph-2{padding:20px 40px}
td{padding:10px 20px}
.btn{padding:5px 20px}
.ph-3{padding-top:30px}
</style>
 <%-- <%@ include file = "footer.jsp" %>  --%>