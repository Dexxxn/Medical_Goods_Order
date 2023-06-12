<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="tableAll">
		<div class="basicB top">
			<button>찾기</button>
			<button>정렬</button>
			<button>재고 불러오기</button>
		</div>
		<div style="width: 800px;">
			<table class="table checkbox" id="publicTable" border="1">
			    <thead>
			        <tr>
			            <th><input type="checkbox" name="checkbox" name="checkbox" onclick="selectAll(this)"></th>
			            <th>의약품 코드</th>
			            <th>의약품 명</th>
			            <th>규격</th>
	   		            <th>수량</th>
	  		            <th>특이사항</th>
			        </tr>
			    </thead>
			    <tbody>
			        <tr>
			            <td><input type="checkbox" name="checkbox"></td>
			            <td>00001</td>
			            <td>Prohaskdfafsdfsdfafa</td>
			            <td>3box</td>
			            <td>30</td>
			            <td>유통기한 확인 요망</td>
			        </tr>
			        <tr>
			            <td><input type="checkbox" name="checkbox"></td>
			            <td>00002</td>
			            <td>Prohaska</td>
			            <td>1box</td>
			            <td>30</td>
			            <td>유통기한 확인 요망</td>
			        </tr>
			        <tr>
			            <td><input type="checkbox" name="checkbox"></td>
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
		<div class="basicB">
			<button class="pointB">전체 적용</button>
			<button>닫기</button>
		</div>
		<br><br>
	</div>
			
	<button id="modalShow" style="margin-left: 280px;">모달 열기</button>
			
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

	//checkbox 전체 선택 기능
	function selectAll(selectAll)  {
		const checkboxes 
			= document.getElementsByName('checkbox');
	  
		checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
		})
	};
/* 	
	// 재고 리스트 불러오기
	$(document).ready(function() {
	    $.ajax({
	        url: '/inventory-status',
	        type: 'GET',
	        dataType: 'json',
	        success: function(response) {
	            var data = response.data;
	            var str = "";
	            
	            for (var i = 0; i < data.list.length; i++) {
	                str += "<tr>";
	                str += "<td><input type='checkbox' name='checkbox' onclick='selectAll(this)'></td>";
	                str += "<td>" + data.list[i].item_id + "</td>";
	                str += "<td>" + data.list[i].item_name + "</td>";
	                str += "<td>" + data.list[i].unit + "</td>";
	                str += "<td>" + data.list[i].current_amount + "</td>";
	                str += "</tr>";
	            }
	            	
	            $("#publicTable tbody").html(str);
	            
	            //showIndexPage(data.index, page);
	        },
	        error: function(xhr, status, error) {
	            // Ajax 요청이 실패한 경우 처리할 코드를 작성합니다.
	            alert("실패");
	        }
	    });
	}); */
</script>	
