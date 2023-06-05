<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>모달창 jsp</title>
	
	<link href="/resources/css/modal.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/0f537ad086.js" crossorigin="anonymous"></script>
</head>
<body>

	<!-- 모달창 기본 틀 -->
	<div class="modal">
		<div class="header">
			상단 제목
			<i class="fas fa-light fa-x"></i>
			<i class="fas fa-thin fa-arrows-rotate"></i>
		</div>
		<div class="main">
			<p>내용이 들어갑니당</p>	
			<button>찾기</button>
			<button>정렬</button>
			<button>재고 불러오기</button>
			
			<table class="table" border="1">
			    <thead>
			        <tr>
			            <th><input type="checkbox"></th>
			            <th>의약품 코드</th>
			            <th>의약품 명</th>
			            <th>규격</th>
	   		            <th>수량</th>
	  		            <th>특이사항</th>
			        </tr>
			    </thead>
			    <tbody>
			        <tr>
			            <td><input type="checkbox"></td>
			            <td>00001</td>
			            <td>Prohaska</td>
			            <td>ml</td>
			            <td>30</td>
			            <td>유통기한 확인 요망</td>
			        </tr>
			        <tr>
			            <td><input type="checkbox"></td>
			            <td>00001</td>
			            <td>Prohaska</td>
			            <td>ml</td>
			            <td>30</td>
			            <td>유통기한 확인 요망</td>
			        </tr>
			        <tr>
			            <td><input type="checkbox"></td>
			            <td>00001</td>
			            <td>Prohaska</td>
			            <td>ml</td>
			            <td>30</td>
			            <td>유통기한 확인 요망</td>
			        </tr>
	
			    </tbody>
			</table>
		</div>			
	</div>

</body>
</html>