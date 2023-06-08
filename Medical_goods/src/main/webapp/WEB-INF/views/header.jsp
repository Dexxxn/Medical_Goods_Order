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

<script src="https://ajax.googlseapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/0f537ad086.js" crossorigin="anonymous"></script>
	
	<!-- 모달 & 테이블 -->
	<link href="/resources/css/modal.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/0f537ad086.js" crossorigin="anonymous"></script>
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
                    <a class="navbar-brand" href="/">
                        <!-- Logo icon --><b>
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <img src="/resources/assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                            <!-- Light Logo icon -->
                            <img src="/resources/assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text --><span>
                         <!-- dark Logo text -->
                         <img src="/resources/assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                         <!-- Light Logo text -->    
                         <img src="/resources/assets/images/logo-light-text.png" class="light-logo" alt="homepage" /></span> </a>
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
                            <a class="nav-link dropdown-toggle waves-effect waves-dark profile-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="/resources/assets/images/users/1.jpg" alt="user" class="" /> <span class="hidden-md-down">Mark Sanders &nbsp;</span> </a>
                        </li>
                    </ul>
                </div>
            </nav>
              <!-- ============================================================== -->
                  <!-- 탭 -->
                  <div class="top_bar"><a href="/notice" id="notice_anchor">공지사항</a></div>
                <div id="background_invisible">  
                <div id="rearrange">
	                <div class="pageTab" id="tab1"><span class="tab_span">재고현황</span><div class="icon_posit"><i class="fas fa-light fa-x"></i></div></div>
	                <div class="pageTab" id="tab2"><span class="tab_span">거래명세서</span><div class="icon_posit"><i class="fas fa-light fa-x"></i></div></div>
	                <div class="pageTab" id="tab3"><span class="tab_span">발주계획</span><div class="icon_posit"><i class="fas fa-light fa-x"></i></div></div>
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
                        <li> <a class="waves-effect waves-dark" href="#;" aria-expanded="false"><i class="fa fa-tachometer"></i><span class="hide-menu">자산관리</span></a>
                        	<a href="#;"><span class="detailPage_nav">재고현황-희,읽</span></a>
                        	<a href="#;"><span class="detailPage_nav">사용입력-희,읽</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="#;" aria-expanded="false"><i class="fa fa-user-circle-o"></i><span class="hide-menu">구매관리</span></a>
                        	<a href="#;"><span class="detailPage_nav">발주계획서 작성</span></a>
                        	<a href="/purchase_order"><span class="detailPage_nav">발주내역서 조회</span></a>
                        	<a href="#;"><span class="detailPage_nav">거래 내역 조회</span></a>
                        	<a href="#;"><span class="detailPage_nav">담당자별 구매이력-원</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="#;" aria-expanded="false"><i class="fa fa-table"></i><span class="hide-menu">서류관리</span></a>
                        	<a href="/spe"><span class="detailPage_nav">거래 명세서-원</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="#;" aria-expanded="false"><i class="fa fa-smile-o"></i><span class="hide-menu">발주관리</span></a>
                        	<a href="#;"><span class="detailPage_nav">발주요청서-희,읽</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="#;" aria-expanded="false"><i class="fa fa-globe"></i><span class="hide-menu">조정관리</span></a>
                        	<a href="/chart"><span class="detailPage_nav">안전재고 통계-희,읽</span></a>
                        </li>
                    </ul>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

// 열린 탭 창 닫기
	$(document).ready(function() {
		$("#tab1 .fa-x").click(function() {
			$("#tab1").hide();
		});
		$("#tab2 .fa-x").click(function() {
			$("#tab2").hide();
		});
		$("#tab3 .fa-x").click(function() {
			$("#tab3").hide();
		});
	});


	$(document).ready(function() {
		  // 각 span 요소 클릭 시 .pageTab div 동적 생성
		  $("nav.sidebar-nav li span").click(function(event) {
		    event.preventDefault(); // 기본 동작 중지
		    
		    var text = $(this).text(); // 클릭한 span 요소의 텍스트 내용 가져오기
		    var pageTab = $("<div>", { class: "pageTab" }); // 새로운 .pageTab div 생성
		    var tabSpan = $("<span>", { class: "tab_span", text: text }); // 새로운 .tab_span span 생성 및 텍스트 설정
		    var iconDiv = $("<div>", { class: "icon_posit" }); // 새로운 .icon_posit div 생성
		    var icon = $("<i>", { class: "fas fa-light fa-x" }); // 새로운 아이콘 생성
		    iconDiv.append(icon); // iconDiv에 icon 추가
		    pageTab.append(tabSpan, iconDiv); // pageTab에 tabSpan과 iconDiv 추가
		    $("#rearrange").append(pageTab); // #rearrange에 pageTab 추가
		    
		    // 아이콘 클릭 시 해당 탭 숨기기
		    icon.click(function() {
		      $(this).closest(".pageTab").hide();
		    });
		  });
		});

</script>
