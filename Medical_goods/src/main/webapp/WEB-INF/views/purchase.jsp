 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 발주내역서 조회  -->
    
    <%-- <%@ include file = "spe.jsp" %> --%>
    
    <%@ include file = "header.jsp" %>

<div class="page-wrapper">

	<div class="container-a" style="padding: 70px 25px; ">
	
		<div class="row-page-title">
			<div class="page-title">
				<h3 class="text-themecolor" style="line-height:30px; font-size:21px;">발주내역서 검색</h3>
			</div>
		
		<div class="page-search">
			<div class="search-table" style="border:1px; background-color:white; font-size:15px; color:black" >
				<table>
					<tr><td class="tb-top"style="font-size:25px; color:#035AA6">Purchase statement</td></tr>
					<tr>
						<td style="color:#035AA6">검색 일자</td>
						<td><input class="date" type="date" name="startday" style="background-color:#f6f9fa"></td>
						<td><input type="button" value="초기화" onclick="resetDate()"></td>						
					</tr>
					<tr>
						<td style="color:#035AA6">물품코드</td>
						<td><input type="text" style="background-color:#f6f9fa"></td>						
					</tr>
					<tr>
						<td style="color:#035AA6">물품명</td>
						<td><input type="text" style="background-color:#f6f9fa"></td>						
					</tr>
					<tr>
						<td style="color:#035AA6">담당자</td>
						<td><input type="text" style="background-color:#f6f9fa"></td>						
					</tr>
					<tr>
						<td style="color:#035AA6">카테고리</td>
						<td><select id="categorySelect" style="background-color:#f6f9fa">
							  <option value="all">전체</option>
							  <option value="injection">주사</option>
							  <option value="internal">내복</option>
							  <option value="external">외용</option>
							</select></td>										
					</tr>
				</table>
				
			</div>
			<button class="btn" id="searchButton">검색</button> <button class="btn" id="printButton">인쇄</button>
		</div>
		</div>
	</div>
</div>
<style>

.tb-top{margin-bottom:20px}
.search-table{padding:40px 40px}
td{padding:10px 20px}
.date{width:100%}
.btn{padding:5px 20px}
.row-page-title{margin-top:30px}
</style>

<script>

function resetDate() {
	  document.getElementById('startday').value = '';
	}

</script>

<%@ include file = "footer.jsp" %>