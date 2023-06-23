<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ include file = "header.jsp" %>   --%>  
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
.chart-container {width: 100%;height: 0;padding-bottom: 75%;} .text-center {margin-top: 10px;}
#prevBtn, #nextBtn {padding: 10px 20px;margin: 0 5px;background-color: #4CAF50;border: none;color: white;cursor: pointer;}
#prevBtn:hover, #nextBtn:hover {background-color: #45a049;}
/* 안전재고 통계 테이블 */#safetyStockTable{width:1400px; height:250px;background-color:#fff;text-align:center;margin:50px;border:1px solid black;}
#safetyStockTable .SST_tr{border:1px solid black;}
#safetyStockTable .SST_tr td{border:1px solid black;}
#safetyStockTable .SST_tr .item_th{width:160px;}
#safetyStockTable .SST_th{width:90px;}
#safetyStockTable .SST_tr .resultTD{font-weight:bold;background-color:#FFFF99;}
#numRow{width:50px;}
</style>
   <div class="page-wrapper">
            <div class="container-fluid">
                <div class="row page-titles">
                    <div class="col-md-5 align-self-center"><h3 class="text-themecolor">안전재고수 통계</h3></div>
                </div>
             <div class="row">
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex no-block">
                                    <div><h5 class="card-title m-b-0">Chart</h5></div>
<div class="ml-auto">
<ul class="list-inline text-center font-12">
    <li><button onclick="showChart('병동A')" data-dept="병동A"><i class="fa fa-circle text-success"></i>병동A</button></li>
    <li><button onclick="showChart('병동B')" data-dept="병동B"><i class="fa fa-circle text-info"></i>병동B</button></li>
    <li><button onclick="showChart('병동C')" data-dept="병동C"><i class="fa fa-circle text-primary"></i>병동C</button></li>
    <li><button onclick="showChart('처치실')" data-dept="처치실"><i class="fa fa-circle text-h1"></i>처치실</button></li>
    <li><button onclick="showChart('수술실')" data-dept="수술실"><i class="fa fa-circle text-h2"></i>수술실</button></li>                                         
</ul>
</div>
</div>
            <div class="chart-container" style="position: relative;">
                 <canvas id="chart"></canvas>
            </div>
                           </div>
                       </div>
                   </div>
<!-- 안전재고수 통계 결과 테이블 -->                  
<table border="1" id="safetyStockTable">
  	<tr class="SST_tr">
  		<th id="numRow">No</th><th class="item_th">품목</th><th class="item_th">품목코드</th><th class="SST_th">사용량</th><th class="SST_th">안전재고수</th><th class="SST_th">사용증감률</th><th class="SST_th">조정 안전재고수</th>
  	</tr>
  	<tr class="SST_tr">
  		<td>1</td><td>Metoclopramide</td><td>50400011</td><td>224</td><td>200</td><td style="color:red; font-weight:bold">+12%</td><td class="resultTD">210</td>
  	</tr>
  	<tr class="SST_tr">
  		<td>2</td><td>estrogen</td><td>50800221</td><td>211</td><td>105</td><td style="color:red; font-weight:bold">+101.90%</td><td class="resultTD">200</td>
  	</tr>
  	<tr class="SST_tr">
  		<td>3</td><td>estrogen1</td><td>50800231</td><td>188</td><td>100</td><td style="color:red; font-weight:bold">+88%</td><td class="resultTD">170</td>
  	</tr>
  	<tr class="SST_tr">
  		<td>4</td><td>Clindamycin</td><td>50800211</td><td>98</td><td>91</td><td style="color:red; font-weight:bold">+7.69%</td><td class="resultTD">95</td>
  	</tr>
  	<tr class="SST_tr">
  		<td>5</td><td>Ursodeoxycholic Acid</td><td>50100020</td><td>75</td><td>80</td><td style="color:blue; font-weight:bold">-6.25%</td><td class="resultTD">75</td>
  	</tr>
  	
  </table>
</div> 
</div>
</div>

<script>
   function getRandomColor() {
	    var letters = "0123456789ABCDEF";
	    var color = "#";
	    for (var i = 0; i < 6; i++) {
	        color += letters[Math.floor(Math.random() * 16)];
	    }
	    return color;
	}

    var chart;

    function drawChart(data) {
        var labels = data.labels;
        var datasets = data.datasets;

        if (chart) {
            chart.destroy();
        }

        var ctx = document.getElementById("chart").getContext("2d");
        chart = new Chart(ctx, {
            type: "line",
            data: {
                labels: labels,
                datasets: datasets
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        display: true,
                        title: {
                            display: true,
                            text: "날짜"
                        }
                    },
                    y: {
                        display: true,
                        title: {
                            display: true,
                            text: "사용 수량"
                        }
                    }
                }
            }
        });
    }

    function showChart(department) {
    	
    	var userDepartment = "${sessionScope.department}"; // 세션에 저장된 사용자의 병동 정보 가져오기
        console.log("페이지에서 가져온 병동 정보: " + userDepartment);

        // 병동 권한 확인
         if (userDepartment !== department) {
        var departmentName;
        switch (department) {
            case '병동A':
                departmentName = "병동 A";
                break;
            case '병동B':
                departmentName = "병동 B";
                break;
            case '병동C':
                departmentName = "병동 C";
                break;
            case '처치실':
                departmentName = "처치실";
                break;
            case '수술실':
                departmentName = "수술실";
                break;
            default:
                departmentName = department;
        }
        alert(departmentName + "에 대한 열람 권한이 없습니다.");
        return;
    }
        
        $.ajax({
            url: "getDataServlet",
            method: "GET",
            data: { dept: department },
            success: function (response) {
                var data = JSON.parse(response);

                // 랜덤 색상 배열 생성
                var randomColors = [];
                for (var i = 0; i < data.datasets.length; i++) {
                    randomColors.push(getRandomColor());
                }

                // 각 물품에 대한 datasets 구성
                var datasets = [];
                for (var i = 0; i < data.datasets.length; i++) {
                    var dataset = {
                        label: data.datasets[i].label,
                        data: data.datasets[i].data,
                        borderColor: randomColors[i],
                        backgroundColor: randomColors[i] + "33"
                    };
                    datasets.push(dataset);
                    
                }

                // 그래프 그리기
                var chartData = {
                    labels: data.labels,  // 수정: 날짜 데이터로 변경
                    datasets: datasets
                };
                drawChart(chartData);
            }
        });
    }
</script>             