<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="main_contents_section"> <!-- 메인내용 들어갈 자리 시작 -->
	<div id="page_title_section"><p id="title_name"></p></div>
	
	<div id="formAll">
<div id="form_wrap">
		<div class="mainForm">	
			<div>
				<label>사용일자</label>
				<input id="searchDate" type="date" name="date">
			</div>
			<div>
				<label>진료과</label>
				<input id="dept" type="text" name="dept" value="${login.dept}">
			</div>
			<div>
				<label>담당자</label>
				<input id="manager" type="text" name="name" value="${login.name}">
			</div>
			<div>
				<label>특이사항</label>
				<input id="signi" type="text" name="significant" >
			</div>
<!-- 		이런식으로 div 추가/변경...
			<div>
				<label>거래처</label>
				<input type="text">
			</div> -->
		</div><!-- mainForm -->
				<div class="basicB top">
					<input type="button" value="조회" onclick="useList()">
					<input type="button" value="등록" id='modalOpen'>
				</div>
</div><!-- wrap -->
	</div>

</div> 

<style>
/* 페이지 제목 */
 #page_title_section{margin:0 0 10px 290px; background-color:#f5f5f5; width:150px; height:25px; text-align:center;}
 #title_name{font-size: 16px; font-weight:bold; line-height: 1.5; text-align: center;}
</style>

