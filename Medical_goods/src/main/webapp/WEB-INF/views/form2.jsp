<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="main_contents_section"> <!-- 메인내용 들어갈 자리 시작 -->
	<div id="page_title_section"><p id="form2_title_name"></p></div>
	
	<div id="formAll">
<div id="form_wrap">
		<div class="mainForm">	
			<div>
				<label>일자</label>
				<input id="searchDate" class="textAlign" type="date" name="">
			</div>
			<div>
				<label>희망 입고일자</label>
				<input id="receiptDate" type="date" class="textAlign" name="receiptDate">
			</div>
			<div>
				<label>입고받을 진료과</label>
				<select id="dept" name="dept" class="textAlign"><option>병동A</option><option>병동B</option><option>병동C</option><option>처치실</option><option>수술실</option></select>
			</div>
			<div>
				<label>담당자</label>
				<select id="manager" name="name" class="textAlign"><option></option><option></option></select>
			</div>
<!-- 		이런식으로 div 추가/변경...
			<div>
				<label>거래처</label>
				<input type="text">
			</div> -->
		</div><!-- mainForm -->
				<div class="basicB top">
					<button>찾기</button>
					<button>정렬</button>
					<button>재고 불러오기</button>
					<button class="modalShow">모달 열기</button>
				</div>
</div><!-- wrap -->
	</div>

</div> 

<style>
/* 페이지 제목 */
 #page_title_section{margin:0 0 10px 290px; background-color:#f5f5f5; width:150px; height:25px; text-align:center;}
 #form2_title_name{font-size: 16px; font-weight:bold; line-height: 1.5; text-align:center;}

 #manager{width:130px;}
 #dept{width:130px;}
 
 /* 폼 */
#formAll{
	position: relative;
	width: 700px;
	margin-left: 280px;
}

.mainForm{
	justify-content: space-between;
	display: flex;
	flex-wrap: wrap;
	background-color: #f6f9fa;
	padding: 15px 15px 10px 15px;
	margin-left: 4px;
}
 .mainForm .textAlign{text-align:center;}
.mainForm div:nth-child(1), .mainForm div:nth-child(2){
	margin-bottom: 5px;
}

.mainForm label{
	width: 140px;
}

.mainForm input{
	width: 130px;
	height: 26px;
}

#main_contents_section{position: relative; width: 1200px; margin-top:160px;}
</style>

