<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/assets/images/favicon.png">
    <title>KSH병원 발주 프로세스</title>
    <!-- Bootstrap Core CSS -->
    <link href="/resources/assets/node_modules/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/assets/node_modules/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet">
    <!-- This page CSS -->
    <!-- chartist CSS -->
    <link href="/resources/assets/node_modules/morrisjs/morris.css" rel="stylesheet">
    <!--c3 CSS -->
    <link href="/resources/assets/node_modules/c3-master/c3.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/index.css" rel="stylesheet">
    <link href="/resources/css/chart.css" rel="stylesheet">
    <link href="/resources/css/notice.css" rel="stylesheet">
    <link href="/resources/css/form.css" rel="stylesheet">
    <!-- Dashboard 1 Page CSS -->
    <link href="/resources/css/pages/dashboard1.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="/resources/css/colors/default.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://ajax.googlseapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/0f537ad086.js" crossorigin="anonymous"></script>
	
	<!-- 모달 & 테이블 -->
	<link href="/resources/css/modal.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/0f537ad086.js" crossorigin="anonymous"></script>
	<script src="/resources/js/modal.js" type="text/javascript"></script>
	
	<!-- 안전재고통계(chart) ajax 연결 -->
	<script src="/resources/js/chart.js" type="text/javascript"></script>
<!-- 	<script src="/resources/js/ph.js" type="text/javascript"></script>  ph.jsp 상단에 표기 -->
	<!-- 발주계획서 작성 js -->
	<script src="/resources/js/order.js" type="text/javascript"></script>

</head>

<body class="fix-header fix-sidebar card-no-border">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">Admin Wrap</p>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-light">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-header">
                    <div id="logo_posit">
                    <a class="navbar-brand" href="/index">
                        <!-- Logo icon --><b>
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <img src="/resources/assets/images/logo-icon.png" alt="homepage" class="dark-logo" id="logo_png"/>
                            <!-- Light Logo icon -->
                            <img src="/resources/assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                        </b>
                 
                     <span id="mainLogo">KSHospital</span> </a> 
                     </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up waves-effect waves-dark" href="javascript:void(0)"><i class="fa fa-bars"></i></a> </li>
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <li class="nav-item hidden-xs-down search-box"> <a class="nav-link hidden-sm-down waves-effect waves-dark" href="javascript:void(0)"><i class="fa fa-search"></i></a>
                            <form class="app-search">
                                <input type="text" class="form-control" placeholder="Search & enter"> <a class="srh-btn"><i class="fa fa-times"></i></a></form>
                        </li>
                    </ul>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav my-lg-0">
                        <!-- ============================================================== -->
                        <!-- Profile -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown u-pro">
                            <a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="hidden-md-down"><b>${login.name}</b>님 Have a good day!</span> </a>
                        </li>
                    </ul>
                </div>
            </nav>
              <!-- ============================================================== -->
                  <!-- 탭 -->
                  <div class="top_bar"><a id="notice_anchor">공지사항</a></div>
                <div id="background_invisible">  
                <div id="rearrange">
	                <div class="pageTab" ><span class="tab_span"></span><div class="icon_posit"><i class="fas fa-light fa-x"></i></div></div>
                </div>
	                <div><hr id="line" /></div>
                </div>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li> <a class="waves-effect waves-dark" aria-expanded="false"><i class="fa fa-tachometer"></i><span class="hide-menu">자산관리</span></a>
                        	<span class="detailPage_nav" onclick="invenList('/table_only')" id="invenList">재고현황-희,읽</span>
                        	<span class="detailPage_nav" onclick="useList('/useList')" id="useList" >사용입력-희,읽</span> <!-- data-href="/usage-input" -->
                        </li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false"><i class="fa fa-smile-o"></i><span class="hide-menu">발주관리</span></a>
                        	<span class="detailPage_nav" id="" >발주요청서-희,읽</span> <!--  data-href="/purchase-request"  -->
                        </li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false"><i class="fa fa-user-circle-o"></i><span class="hide-menu">구매관리</span></a>
                        	<span class="detailPage_nav" id="purchase_planning" onclick="requestList('/purchasePlan')">발주계획서 작성</span>
                 <span class="detailPage_nav" id="purchase_order">발주내역서 조회</span>
                        	<span class="detailPage_nav" id="purHisPageButton">구매이력 조회</span>
                        </li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false"><i class="fa fa-table"></i><span class="hide-menu">서류관리</span></a>
                 <span class="detailPage_nav" id="spePageButton">거래 명세서-원</span>
                        </li>
                        <li> <a class="waves-effect waves-dark" aria-expanded="false"><i class="fa fa-globe"></i><span class="hide-menu">조정관리</span></a>
                  <span class="detailPage_nav"  id="chartPageButton">안전재고통계</span>
                        </li>
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        
        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
// 사이드메뉴 드롭다운 
 $(document).ready(function() {
  // Hide detailPage_nav spans on page load
  $('.detailPage_nav').hide();

  // Toggle detailPage_nav spans when hide-menu span is clicked
  $('.hide-menu').click(function() {
    var detailPageNav = $(this).closest('li').find('.detailPage_nav');

    if (detailPageNav.is(':visible')) {
        detailPageNav.each(function(index) {
          $(this).slideUp(30 * (index + 1));
        });
      } else {
        detailPageNav.each(function(index) {
          $(this).slideDown(90 * (index + 1));
        });
      }
    });
  });

//상단 pageTab들
	$(document).ready(function() {
						  // 페이지 로드 시 pageTab div를 숨김
						  $("#rearrange .pageTab").hide();

						  // 이미 생성된 pageTab의 텍스트를 저장하는 배열
						  var createdTabs = [];

						  // 각 .detailPage_nav 요소 클릭 시 .pageTab div 동적 생성
						  $("nav.sidebar-nav li .detailPage_nav").click(function(event) {
						    event.preventDefault(); // 기본 동작 중지

						    var text = $(this).text(); // 클릭한 .detailPage_nav 요소의 텍스트 내용 가져오기
						    //var href = $(this).data("href"); // Read the data-href attribute value
						     //var pageUrl = ""; // 페이지의 URL을 지정해야 함
						    
						    // 이미 pageTab이 존재하는지 확인
						    if (!isPageTabExist(text)) {
						      var pageTab = $("<div>", { class: "pageTab" }); // 새로운 .pageTab div 생성
						      var tabSpan = $("<span>", { class: "tab_span", text: text }); // 새로운 .tab_span span 생성 및 텍스트 설정
						      var iconDiv = $("<div>", { class: "icon_posit" }); // 새로운 .icon_posit div 생성
						      var icon = $("<i>", { class: "fas fa-light fa-x" }); // 새로운 아이콘 생성
						      iconDiv.append(icon); // iconDiv에 icon 추가
						      pageTab.append(tabSpan, iconDiv); // pageTab에 tabSpan과 iconDiv 추가
						      $("#rearrange").append(pageTab); // #rearrange에 pageTab 추가

						      // 아이콘 클릭 시 해당 탭 숨기기 및 배열에서 제거
						      icon.click(function() {
						        var pageTab = $(this).closest(".pageTab");
						       // var mainContents = $("#mainContents");
						        pageTab.hide();
						        removePageTab(pageTab);
						        //removeMainContents(mainContents);
						        //연결된 index의 <div id="mainContents"> 의 내용도 지우기?
						      });

						      // 생성된 pageTab의 텍스트를 배열에 추가s
						      createdTabs.push(text);
						      
					// 페이지 이동 처리
						       /*  $(this).click(function() {
						        window.location.href = href; // Use the data-href value for navigation
						        });  */
						      /* tabSpan.click(function() {
						          window.location.href = pageUrl; // 페이지의 URL로 이동
						        }); */
						     //여기서 부터 해야돼애애ㅐㅐㅐㅐㅐㅐㅐ  
						        var pur = $("#purchase_order");
						        if(text === "발주내역서 조회"){
						        	 //"발주내역서" 
									 pur.click(purchasePageOpen);
						        	 
									 //발주내역서 조회
							            function purchasePageOpen() {
							                $.ajax({
							                    url: "purchase", // URL of the purchase.jsp page
							                    type: "GET",
							                    success: function(data) {
							                        // Update the content of the chartContent element with the response from purchase.jsp
							                        $("#mainContents").html(data);
							                    },
							                    error: function(xhr, status, error) {
							                        alert("An error occurred while loading the page. Error: " + error);
							                        console.log("XHR status: " + status);
							                        console.log("Error details: " + error);
							                    }
							                });
							            }
						        } 
						        
						        
						        
						        
						    } else {
						      // 이미 pageTab이 있는 경우 깜빡이는 효과 적용
						      var tabSpan = $(this).find(".tab_span");
						      var originalColor = tabSpan.css("color");
						      var flashingColor = "red";
						      var duration = 200;
						      tabSpan.animate({ color: flashingColor }, duration, function() {
						        $(this).animate({ color: originalColor }, duration);
						      });
						    }
						  });


						  // pageTab이 이미 존재하는지 확인하는 함수
						  function isPageTabExist(text) {
						    return createdTabs.includes(text);
						  }

						  // pageTab을 배열에서 제거하는 함수
						  function removePageTab(pageTab) {
						    var text = pageTab.find(".tab_span").text();
						    var index = createdTabs.indexOf(text);
						    if (index !== -1) {
						      createdTabs.splice(index, 1);
						    }
						  }
						//삭제}); 
					
					
					
			/* sideNav- jsp (ajax 연결 ) */	
							 //삭제$(document).ready(function() { 

								 //"발주내역서" 
								 $("#purchase_order").click(purchasePageOpen);
								 // "안전재고통계" 
								 $("#chartPageButton").click(chartPageOpen);
								 // "거래명세서"
								 $("#spePageButton").click(spePageOpen); 
								 // "거래명세서" ---> 상세페이지
								 //$("#").click(spe_DetailPageOpen); 
								 // "담당자별구매이력"
								 $("#purHisPageButton").click(purchaseHisPageOpen); 
								 // "담당자별구매이력" --> 상세페이지
								 //$("#").click(purchaseHis_DetailPageOpen); 
								 // 공지사항
								 $("#notice_anchor").click(noticePageOpen);
								 //재고현황
								 $("#invenList").click(invenListPageOpen);
								//재고현황
								 $("#useList").click(useListPageOpen);
								//발주계획서 작성
								 $("#purchase_planning").click(purchasePlanPageOpen);
								 
								 
						            // Function to open the purchase page and retrieve its content
						            
						            //발주내역서 조회
						            function purchasePageOpen() {
						                $.ajax({
						                    url: "purchase", // URL of the purchase.jsp page
						                    type: "GET",
						                    success: function(data) {
						                        // Update the content of the chartContent element with the response from purchase.jsp
						                        $("#mainContents").html(data);
						                    },
						                    error: function(xhr, status, error) {
						                        alert("An error occurred while loading the page. Error: " + error);
						                        console.log("XHR status: " + status);
						                        console.log("Error details: " + error);
						                    }
						                });
						            }
						            
						            //안전재고 통계
						            function chartPageOpen() {
						                $.ajax({
						                    url: "chart", // URL of the purchase.jsp page
						                    type: "GET",
						                    success: function(data) {
						                        // Update the content of the chartContent element with the response from purchase.jsp
						                        $("#mainContents").html(data);
						                    },
						                    error: function(xhr, status, error) {
						                        alert("An error occurred while loading the page. Error: " + error);
						                        console.log("XHR status: " + status);
						                        console.log("Error details: " + error);
						                    }
						                });
						            }
						            
						            //거래명세서
						            function spePageOpen() {
						                $.ajax({
						                    url: "spe", // URL of the purchase.jsp page
						                    type: "GET",
						                    success: function(data) {
						                        // Update the content of the chartContent element with the response from purchase.jsp
						                        $("#mainContents").html(data);
						                    },
						                    error: function(xhr, status, error) {
						                        alert("An error occurred while loading the page. Error: " + error);
						                        console.log("XHR status: " + status);
						                        console.log("Error details: " + error);
						                    }
						                });
						            }
						            
						            //담당자별 구매이력
						            function purchaseHisPageOpen() {
						                $.ajax({
						                    url: "ph", // URL of the purchase.jsp page
						                    type: "GET",
						                    success: function(data) {
						                        // Update the content of the chartContent element with the response from purchase.jsp
						                        $("#mainContents").html(data);
						                    },
						                    error: function(xhr, status, error) {
						                        alert("An error occurred while loading the page. Error: " + error);
						                        console.log("XHR status: " + status);
						                        console.log("Error details: " + error);
						                    }
						                });
						            }
						           
						            // 담당자별 구매이력 ---> 상세페이지
						           /*  function purchaseHis_DetailPageOpen() {
						                $.ajax({
						                    url: "ph_detail", // URL of the purchase.jsp page
						                    type: "GET",
						                    success: function(data) {
						                        // Update the content of the chartContent element with the response from purchase.jsp
						                        $("#mainContents").html(data);
						                    },
						                    error: function(xhr, status, error) {
						                        alert("An error occurred while loading the page. Error: " + error);
						                        console.log("XHR status: " + status);
						                        console.log("Error details: " + error);
						                    }
						                });
						            } */
						            
						         // 거래명세서 ----> 상세페이지
						            function spe_DetailPageOpen() {
						                $.ajax({
						                    url: "ts", // URL of the purchase.jsp page
						                    type: "GET",
						                    success: function(data) {
						                        // Update the content of the chartContent element with the response from purchase.jsp
						                        $("#mainContents").html(data);
						                    },
						                    error: function(xhr, status, error) {
						                        alert("An error occurred while loading the page. Error: " + error);
						                        console.log("XHR status: " + status);
						                        console.log("Error details: " + error);
						                    }
						                });
						            }
						            
						            
						            //공지사항 페이지 연결
						            function noticePageOpen() {
						                $.ajax({
						                    url: "notice", // URL of the purchase.jsp page
						                    type: "GET",
						                    success: function(data) {
						                        // Update the content of the chartContent element with the response from purchase.jsp
						                        $("#mainContents").html(data);
						                    },
						                    error: function(xhr, status, error) {
						                        alert("An error occurred while loading the page. Error: " + error);
						                        console.log("XHR status: " + status);
						                        console.log("Error details: " + error);
						                    }
						                });
						            }
						            
						            //재고현황 페이지 연결
						            function invenListPageOpen() {
						                $.ajax({
						                    url: "table_only", // URL of the purchase.jsp page
						                    type: "GET",
						                    success: function(data) {
						                        // Update the content of the chartContent element with the response from purchase.jsp
						                        $("#mainContents").html(data);
						                    	// 응답으로 받은 데이터로 page_title_section의 p태그의 innerHTML 업데이트
						                        $("#title_name").html("재고현황");
						                    },
						                    error: function(xhr, status, error) {
						                        alert("An error occurred while loading the page. Error: " + error);
						                        console.log("XHR status: " + status);
						                        console.log("Error details: " + error);
						                    }
						                });
						            }
						            
						            //물품 사용입력 페이지 연결
						            function useListPageOpen() {
						                $.ajax({
						                    url: "/useList", // URL of the purchase.jsp page
						                    type: "GET",
						                    success: function(data) {
						                        // Update the content of the chartContent element with the response from purchase.jsp
						                        $("#mainContents").html(data);
						                    	// 응답으로 받은 데이터로 page_title_section의 p태그의 innerHTML 업데이트
						                        $("#title_name").html("자가사용입력");
						                    },
						                    error: function(xhr, status, error) {
						                        alert("An error occurred while loading the page. Error: " + error);
						                        console.log("XHR status: " + status);
						                        console.log("Error details: " + error);
						                    }
						                });
						            }	
						            
						            //발주계획서 작성(총무) 페이지 연결
						          /*   function purchasePlanPageOpen() {
						                $.ajax({
						                    url: "/purchasePlan", // URL of the purchase.jsp page
						                    type: "GET",
						                    success: function(data) {
						                        // Update the content of the chartContent element with the response from purchase.jsp
						                        $("#mainContents").html(data);
						                    	// 응답으로 받은 데이터로 page_title_section의 p태그의 innerHTML 업데이트
						                        $("#title_name").html("발주계획서");
						                    	
						                      	// form.jsp의 내용을 가져옴
						                        var modifiedContent = modifyFormContent(data);
						                        
						                        // Update the content of the formAll element with the modified content
						                       // $("#form_wrap").html(modifiedContent);
						                        
						                        // Clear the existing content of form_wrap
            									$("#oo").empty();
            
									            // Append the modified content to form_wrap
									            $("#form_wrap").append(modifiedContent);
						                        
						                     // form.jsp의 내용을 수정하는 함수
						                        function modifyFormContent(content) {
						                            // content를 필요에 따라 수정
						                            // 예시: <label> 내용 변경
						                            content = content.replace("<label>사용일자</label>", "<label>일자</label>");
						                            content = content.replace("<label>특이사항</label>", "<label>희망 입고일자</label>");
						                            content = content.replace("<label>담당자</label>", "<label>발주 담당자</label>");
						                            content = content.replace("<label>진료과</label>", "<label>입고받을 진료과</label>");
						                            
						                            // 예시: <input> type 속성 변경
						                            content = content.replace('<input id="searchDate" type="date">', '<input id="searchDate" type="date">');
						                            content = content.replace('<input id="dept" type="text">', '<input id="dept" type="select">');
						                            content = content.replace('<input id="manager" type="text">', '<input id="manager" type="select">');
						                            content = content.replace('<input id="signi" type="text">', '<input id="signi" type="date">');
						                            
						                            // 수정된 내용 반환
						                            return content;
						                        } 
						                     
						                     
						                     
						                    },
						                    error: function(xhr, status, error) {
						                        alert("페이지 로드 중 오류 발생. Error: " + error);
						                        console.log("XHR status: " + status);
						                        console.log("Error details: " + error);
						                    }
						                });
						            }					 */	            
						            
						          //발주계획서 작성(총무) 페이지 연결
						            function purchasePlanPageOpen() {
						                $.ajax({
						                    url: "/purchasePlan", // URL of the purchase.jsp page
						                    type: "GET",
						                    success: function(data) {
						                        // Update the content of the chartContent element with the response from purchase.jsp
						                        $("#mainContents").html(data);
						                    	// 응답으로 받은 데이터로 page_title_section의 p태그의 innerHTML 업데이트
						                        $("#form2_title_name").html("발주계획서");
						                        $("#main_contents_section").remove();
						                    },
						                    error: function(xhr, status, error) {
						                        alert("An error occurred while loading the page. Error: " + error);
						                        console.log("XHR status: " + status);
						                        console.log("Error details: " + error);
						                    }
						                });
						            }	
						            
						            // Attach the click event handler to the purchase_order element
						           
						        //});
			
						        });
</script>