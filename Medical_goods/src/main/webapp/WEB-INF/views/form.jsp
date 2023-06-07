<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div id="main_contents_section"> <!-- 메인내용 들어갈 자리 시작 -->
		
		<div id="mainframe">
			<div class="posit">
				<label>일자</label><input type="date" class="date_width" id="dateMargin">
			
				<label>희망입고일자</label><input type="date" class="date_width">
			
			</div>
					
			<div class="posit">
				<label>입고받을 진료과</label>
					<select class="sel_h">
						<option>선택</option>
						<option>수술실</option>
						<option>처치실</option>
						<option>병동 A</option>
						<option>병동 B</option>
						<option>병동 C</option>
					</select><input type="text" class="in_width" placeholder="병동A" readonly>
			
			
				<label>발주담당자</label>
					<select class="sel_h">
						<option>선택</option>
						<option>정기원</option>
						<option>이성언</option>
						<option>장희영</option>
					</select><input type="text" class="in_width" placeholder="김민수" readonly>
			</div>
			
		</div><!-- mainframe  -->
		
		
	</div><!-- main_contents_section 메인내용 들어갈 자리 끝  -->