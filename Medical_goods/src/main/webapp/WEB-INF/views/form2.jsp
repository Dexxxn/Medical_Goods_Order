<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="main_contents_section"> <!-- 메인내용 들어갈 자리 시작 -->
	<div id="page_title_section"><p id="form2_title_name"></p></div>
	
	<div id="formAll">
<div id="form_wrap">
		<div class="mainForm">	
			<div>
				<label id="requestLabel">요청일자</label>
				<input id="requestDate" class="textAlign" type="date" name="requestDate">
			</div>
		<!-- 	<div>
				<label>희망 입고일자</label>
				<input id="receiptDate" type="date" class="textAlign" name="receiptDate">
				<input id="receiptDate" type="text" class="textAlign"  name="receiptDate" value="" readonly> 
			</div> -->
			<div>
				<label>입고받을 진료과</label>
				<select id="dept" name="dept" class="textAlign"><option>선택</option><option>병동A</option><option>병동B</option><option>병동C</option><option>처치실</option><option>수술실</option></select>
			</div>
		<%-- 	<div>
				<label>담당자</label>
				<input id="manager" type="text" class="textAlign"  name="name" value="" readonly> value="${dept_manager_name.name}"
			</div> --%>

		</div><!-- mainForm -->
				<div class="basicB top">
					<button id="form2_search" onclick="requestList()">찾기</button>
					<button>e-mail</button>
					<button  onclick="openModal()">요청 조회</button> <!-- class="modalShow" -->
					
				</div>
</div><!-- wrap -->
	</div>

</div> 
 <div id="modalContainer"></div> 



<style>
/* 페이지 제목 */
 #page_title_section{margin:0 0 10px 290px; background-color:#f5f5f5; width:150px; height:25px; text-align:center;}
 #form2_title_name{font-size: 16px; font-weight:bold; line-height: 1.5; text-align:center;}
 #requestLabel{margin-left:2px;}
 #manager{width:130px;}
 #dept{width:130px; height:26px;}
 
 /* 폼 */
#formAll{position: relative; width: 700px; margin-left: 280px;}
.mainForm{justify-content: space-between;display: flex;flex-wrap: wrap;background-color: #f6f9fa;padding: 15px 15px 10px 15px;margin-left: 4px;}
.mainForm .textAlign{text-align:center;}
.mainForm div:nth-child(1), .mainForm div:nth-child(2){margin-bottom: 5px;}
.mainForm label{width: 140px;}
.mainForm input{width: 130px;height: 26px;}
#main_contents_section{position: relative; width: 1200px; margin-top:160px;}
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$("#table_form").on("submit", function(event) {
	  event.preventDefault();
	});



//요청조회 -요청리스트 모달 open
 function openModal() {
	  $.ajax({
	    url: "requestListmodal",
	    success: function(data) {
	      $("#modalContainer").html(data);
	      $(".modal-overlay").show();
	      $(".requestListModal").show();
	      $("#table_only_form").remove();
	      $(".form_container").remove();
	      $("main_contents_section").remove();
	    }
	  });
	}

	$(document).on("click", ".closeB", function() {
	  $(".modal-overlay").hide();
	  $(".requestListModal").hide();
	}); 


</script>

