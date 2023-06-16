<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 모달창 기본 틀 -->
	<!-- 모달 창이 열려 있을 때 -->
	<div class="modal-overlay"></div>
	<div class="requestListModal" style="width:750px; height:550px;">
		<div class="header">
			상단 제목
			<div style="display:flex;">
				<div><i class="fas fa-thin fa-arrows-rotate"></i></div>
				<div><i class="fas fa-light fa-x closeB"></i></div>
			</div>
		</div>
	<div class="main">
			<form id="">
	
	<div class="tableAll" id="CheckboxTable">
		<div class="table-container">
			<table class="table checkbox" id="reqListTable" border="1">
			    <thead>
			        <tr>
			            <th><input type="checkbox" name="checkbox" onclick="selectAll(this)"></th>
			            <th>요청일자</th>
			            <th>요청한 진료과</th>
			            <th>요청한 담당자</th>
	   		            <th>거래처명</th>
	  		            <th>의약품명</th>
	  		            <th>희망입고일자</th>
	  		            <th>수량합계</th>
	  		            <th>종결여부</th>
			        </tr>
			    </thead>
			    <tbody>
			        <tr>
			            <td><input type="checkbox" name="checkbox"></td>
			            <td>2023-06-16</td>
			            <td>A병동</td>
			            <td>이성언</td>
			            <td>(주)화이자</td>
			            <td>네오트레이스 외 14건</td>
			            <td>2023-06-23</td>
			            <td>1,200</td>
			            <td>종결</td>
			        </tr>
			        <tr>
			            <td><input type="checkbox" name="checkbox"></td>
			            <td>2023-06-16</td>
			            <td>A병동</td>
			            <td>이성언</td>
			            <td>(주)화이자</td>
			            <td>네오트레이스 외 14건</td>
			            <td>2023-06-23</td>
			            <td>1,200</td>
			            <td>종결</td>
			        </tr>
			        <tr>
			            <td><input type="checkbox" name="checkbox"></td>
			            <td>2023-06-16</td>
			            <td>A병동</td>
			            <td>이성언</td>
			            <td>(주)화이자</td>
			            <td>네오트레이스 외 14건</td>
			            <td>2023-06-23</td>
			            <td>1,200</td>
			            <td>종결</td>
			        </tr>
			    </tbody>
			</table>
		</div>
		<hr>
		<div class="basicB">
			<button class="pointB" id="selectRequestList">전체 적용</button>
			<button>닫기</button>
		</div>
		<br><br>
	</div>
</form>			
		</div>			
	</div>

<style>

*{
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

body{
	font-size: 14px;
}

th, td{
	height: 30px;
}

.requestListModal i{
	color: #fff;
	font-size: 14px;
	margin: 0 10px;
	cursor: pointer;
}

button, input[type="button"]{
	padding: 2px;
	border: 1px solid #BDBDBD;
	cursor: pointer;
}

hr {
	margin: 6px 0;
	border-top:1px solid rgba(0,0,0,.1)
}

.tableAll{
	margin-top: 10px;
	margin-left: 280px;
}

.basicB button{
	margin: 4px;
}

.pointB{
	color: #fff;
	background-color: #035AA6;
	border: 1px solid #034AA6;
}



.bottom{
	position: fixed;
	bottom: 0;
	width: 100%;
}

.requestListModal{
	background-color: #fff;
	z-index: 200;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	border: 1px solid #035AA6;
	border-top: none;
	box-shadow: 0 0 15px gray;
}

.modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.2); /* 불투명한 배경색 */
    z-index: 100; /* 다른 요소보다 상위에 표시되도록 설정 */
    display: none;
  }

.header{
	display: flex;
	justify-content: space-between;
	color: #fff;
	background-color: #035AA6;
	padding: 5px;
	padding-right: 0px; 
}

.header div{
	border-left: 1px solid #034AA6;
}

.main #main_contents_section, .main #page_title_section, .main #formAll, .main .tableAll{
	margin: 0px;
} 

.main .table-container{
	width: 740px;
 	height: 325px;
	overflow-y: scroll;
	overflow-x: hidden;
}

.table{
	width: 99%;
	margin: 4px;
	border-collapse: collapse;
}

.table th{
	color: #5D5D5D;
	padding: 3px 10px;
	background-color: #F2F2F2;
}

.table td{
	padding: 3px;
}

.table.checkbox td:first-child{
	text-align: center;
}

.table.checkbox td:nth-child(5){
	text-align: right;
}

.table.only td:nth-child(4),
.table.only td:nth-child(5),
.table.only td:nth-child(6),
.table.only td:nth-child(7),
.table.only td:nth-child(8),
.table.only td:nth-child(9){
	text-align: right;
}

.table-container{
	width: 1000px;
 	height: 540px;
	overflow-y: scroll;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

//checkbox 전체 선택 기능
function selectAll(selectAll)  {
	const checkboxes 
		= document.getElementsByName('checkbox');
  
	checkboxes.forEach((checkbox) => {
	checkbox.checked = selectAll.checked;
	})

</script>