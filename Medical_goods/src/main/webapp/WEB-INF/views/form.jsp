<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="main_contents_section"> <!-- 메인내용 들어갈 자리 시작 -->
	<div id="page_title_section"><p id="title_name"></p></div>
	
	<div id="formAll">

		<div class="mainForm">	
			<div>
				<label>사용일자</label>
				<input id="searchDate" type="date">
			</div>
				<div>
				<label>진료과</label>
				<input id="dept" type="text">
			</div>
			<div>
				<label>담당자</label>
				<input id="manager" type="text">
			</div>
			<div>
				<label>특이사항</label>
				<input id="signi" type="text">
			</div>
<!-- 		이런식으로 div 추가/변경...
			<div>
				<label>거래처</label>
				<input type="text">
			</div> -->
		</div>
		<div class="basicB top">
			<button>찾기</button>
			<button>정렬</button>
			<button>재고 불러오기</button>
			<button class="modalShow">모달 열기</button>
		</div>
	</div>

</div> 

<!-- main_contents_section 메인내용 들어갈 자리 끝 --> 

<!--     
    <div id="main_contents_section"> 메인내용 들어갈 자리 시작
		
		<div id="mainframe">
			<div class="posit">
			<div class="connect">
				<label class="label_margin">일자</label><input type="date" class="date_width" id="dateMargin">
			</div>
			<div class="connect">
				<label class="label_margin">희망입고일자</label><input type="date" class="date_width">
			</div>
				
				<div class="connect"><label class="label_margin">입고받을 진료과</label>
					<select class="sel_h">
						<option>선택</option>
						<option>수술실</option>
						<option>처치실</option>
						<option>병동 A</option>
						<option>병동 B</option>
						<option>병동 C</option>
					</select><input type="text" class="in_width" placeholder="병동A" readonly>
				</div>
				<div class="connect">
				<label class="label_margin">발주담당자</label>
					<select class="sel_h">
						<option>선택</option>
						<option>정기원</option>
						<option>이성언</option>
						<option>장희영</option>
					</select><input type="text" class="in_width" placeholder="김민수" readonly>
				</div>
			</div>
			
		</div>mainframe 
		
	</div>main_contents_section 메인내용 들어갈 자리 끝 

<div id="chart_show"></div>
 -->

<style>
 #page_title_section{margin:0 0 10px 290px; background-color:#f5f5f5; width:150px; height:25px; text-align:center;}
 #title_name{font-size: 16px; font-weight:bold; line-height: 1.5;}
</style>

