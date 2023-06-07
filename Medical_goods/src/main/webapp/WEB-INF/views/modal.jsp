<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- 모달창 기본 틀 -->
	<div class="modal">
		<div class="header">
			상단 제목
			<div style="display:flex;">
				<div><i class="fas fa-thin fa-arrows-rotate"></i></div>
				<div><i class="fas fa-light fa-x"></i></div>
			</div>
		</div>
		<div class="main">
			<p>내용이 들어갑니당</p>
			<p>1</p>
			<div class="btn top">
				<button>찾기</button>
				<button>정렬</button>
				<button>재고 불러오기</button>
			</div>
			<div>
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
				            <td>Prohaskdfafsdfsdfafa</td>
				            <td>3box</td>
				            <td>30</td>
				            <td>유통기한 확인 요망</td>
				        </tr>
				        <tr>
				            <td><input type="checkbox"></td>
				            <td>00002</td>
				            <td>Prohaska</td>
				            <td>1box</td>
				            <td>30</td>
				            <td>유통기한 확인 요망</td>
				        </tr>
				        <tr>
				            <td><input type="checkbox"></td>
				            <td>00003</td>
				            <td>Prohaska</td>
				            <td>1box</td>
				            <td>30</td>
				            <td>유통기한 확인 요망</td>
				        </tr>
		
				    </tbody>
				</table>
			</div>
			<hr>
			<div class="btn bottom">
				<button class="pointB">전체 적용</button>
				<button>닫기</button>
			</div>
		</div>			
	</div>
