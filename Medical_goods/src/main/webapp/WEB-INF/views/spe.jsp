 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더 inclue 하면 안됨!!!  -->    
<%-- <%@ include file = "header.jsp" %> --%>
<script src="resources/js/ts.js" type="text/javascript"></script>
<div class="page-wrapper">

	<div class="container-a" style="padding: 70px 25px; ">
	
		<div class="row-page-title">
			<div class="page-title">
				<h3 class="text-themecolor" style="line-height:30px; font-size:21px;">거래명세서 검색</h3>
			</div>
		
		<div class="page-search">
			<div class="search-table" style="border:1px; background-color:white; font-size:15px; color:black" >
				<table>
					<tr><td class="tb-top"style="font-size:25px; color:#035AA6">Trading statement</td></tr>
					<tr>
						<td style="color:#035AA6">업체명</td>
						<td><select id="supplierSelect" style="background-color:#f6f9fa" name="supplier">
							  <option>선택</option>
							  <option value="크리스탈지노믹스(주)">크리스탈지노믹스(주)</option>
							  <option value="(주)인트로바이오파마">(주)인트로바이오파마</option>							  
							</select></td>										
					</tr>
					<tr>
						<td style="color:#035AA6">담당자</td>
						<td><input type="text" id="select_name" style="background-color:#f6f9fa" name="name"></td>						
					</tr>	
					<tr>
						<td style="color:#035AA6">검색 일자</td>
						<td><input class="date" type="date" name="startday" style="background-color:#f6f9fa"></td>												
					</tr>				
				</table>
				
			</div>
			<div class="spe-1">
		<a href="#" id=searchLink1>	<button class="btn" id="searchButton">검색</button></a> 			
		
			</div>
		</div>
		</div>
	</div>
</div>
<style>
.spe-1{padding-top:30px;padding-right:15px}

.tb-top{margin-bottom:20px}
.search-table{padding:40px 40px}
td{padding:10px 20px}
.date{width:100%}
.btn{padding:5px 20px}
.row-page-title{margin-top:30px}
</style>


<%-- <%@ include file = "footer.jsp" %> --%>
