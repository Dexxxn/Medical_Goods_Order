<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ include file = "header.jsp" %>     --%>

<!-- <p class="mention">공지사항 페이지 입니다.</p> -->

	<section class="notice">
		  <div class="page-title">
		        <div class="container">
		            <h3 id="notice__table_h3">공지사항</h3>
		        </div>
		    </div>
		
		    <!-- board seach area -->
		    <div id="board-search">
		        <div class="container">
		            <div class="search-window">
		                <form action="">
		                    <div class="search-wrap">
		                        <label for="search" class="blind">공지사항 내용 검색</label>
		                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
		                        <button type="submit" class="btn btn-dark">검색</button>
		                 
		                    </div>
		                </form>
		            </div>
		        </div>
		    </div>
		   
		  <!-- board list area -->
		    <div id="board-list">
		        <div class="container">
		            <table class="board-table">
		                <thead>
		                <tr>
		                    <th scope="col" class="th-num">번호</th>
		                    <th scope="col" class="th-title">제목</th>
		                    <th scope="col" class="th-date">작성자</th>
		                    <th scope="col" class="th-date">등록일</th>
		                    <th scope="col" class="th-date">조회수</th>
		                </tr>
		                </thead>
		                <tbody>
		                <tr>
		                    <td>6</td>
		                    <th>
		                      <a href="#!">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
		                      <p>테스트</p>
		                    </th>
		                    <td>김자바 원장</td>
		                    <td>2017.07.13</td>
		                    <td>210</td>
		                </tr>
		                <tr>
		                    <td>5</td>
		                    <th><a href="#!">공지사항 안내입니다.</a></th>
		                    <td>김영희 간호부장</td>
		                    <td>2017.06.15</td>
		                    <td>55</td>
		                </tr>
		                <tr>
		                    <td>4</td>
		                    <th><a href="#!">공지사항 안내입니다.</a></th>
		                    <td>박철수 과장</td>
		                    <td>2017.06.15</td>
		                    <td>63</td>
		                </tr>
		                <tr>
		                    <td>3</td>
		                    <th><a href="#!">공지사항 안내입니다.</a></th>
		                    <td>박철수 과장</td>
		                    <td>2017.06.15</td>
		                    <td>63</td>
		                </tr>
		                <tr>
		                    <td>2</td>
		                    <th><a href="#!">공지사항 안내입니다.</a></th>
		                    <td>박철수 과장</td>
		                    <td>2017.06.15</td>
		                    <td>63</td>
		                </tr>
		                <tr>
		                    <td>1</td>
		                    <th><a href="#!">공지사항 안내입니다.</a></th>
		                    <td>박철수 과장</td>
		                    <td>2017.06.15</td>
		                    <td>63</td>
		                </tr>
		
		
		                
		                
		                </tbody>
		            </table>
		        </div>
		    </div>
		<input type="button" value="글쓰기" id="boardWrite_btn" onclick="" >
		</section>

<style>
	table {
		 border-collapse: collapse;
		 border-spacing: 0;
		}
		section.notice {
		  padding: 230px 0;
		  margin-right: 140px;
		}
		
		.page-title {
		  margin-bottom: 60px;
		  width:100%;
		}
		.page-title #notice__table_h3 {
		  font-size: 28px;
		  color: #333333;
		  font-weight: 400;
		  text-align: center;
		}
		
		#board-search .search-window {
		  width: 1200px;
		  padding: 15px 0;
		  background-color: #f9f7f9;
		}
		#board-search .search-window .search-wrap {
		  position: relative;
		/*   padding-right: 124px; */
		  margin: 0 auto;
		  width: 80%;
		  max-width: 564px;
		}
		#board-search .search-window .search-wrap input {
		  height: 40px;
		  width: 100%;
		  font-size: 14px;
		  padding: 7px 14px;
		  border: 1px solid #ccc;
		}
		#board-search .search-window .search-wrap input:focus {
		  border-color: #333;
		  outline: 0;
		  border-width: 1px;
		}
		#board-search .search-window .search-wrap .btn {
		  position: absolute;
		  right: 0;
		  top: 0;
		  bottom: 0;
		  width: 108px;
		  padding: 0;
		  font-size: 16px;
		}
		
		.board-table {
		  font-size: 13px;
		  width: 1200px;
		  border-top: 1px solid #ccc;
		  border-bottom: 1px solid #ccc;
		}
		
		.board-table a {
		  color: #333;
		  display: inline-block;
		  line-height: 1.4;
		  word-break: break-all;
		  vertical-align: middle;
		}
		.board-table a:hover {
		  text-decoration: underline;
		}
		.board-table th {
		  text-align: center;
		}
		
		.board-table .th-num {
		  width: 100px;
		  text-align: center;
		}
		
		.board-table .th-date {
		  width: 200px;
		}
		
		.board-table th, .board-table td {
		  padding: 14px 0;
		}
		
		.board-table tbody td {
		  border-top: 1px solid #e7e7e7;
		  text-align: center;
		}
		
		.board-table tbody th {
		  padding-left: 28px;
		  padding-right: 14px;
		  border-top: 1px solid #e7e7e7;
		  text-align: left;
		}
		
		.board-table tbody th p{
		  display: none;
		}
		
		.btn {
		  display: inline-block;
		  padding: 0 30px;
		  font-size: 15px;
		  font-weight: 400;
		  background: transparent;
		  text-align: center;
		  white-space: nowrap;
		  vertical-align: middle;
		  -ms-touch-action: manipulation;
		  touch-action: manipulation;
		  cursor: pointer;
		  -webkit-user-select: none;
		  -moz-user-select: none;
		  -ms-user-select: none;
		  user-select: none;
		  border: 1px solid transparent;
		  text-transform: uppercase;
		  -webkit-border-radius: 0;
		  -moz-border-radius: 0;
		  border-radius: 0;
		  -webkit-transition: all 0.3s;
		  -moz-transition: all 0.3s;
		  -ms-transition: all 0.3s;
		  -o-transition: all 0.3s;
		  transition: all 0.3s;
		}
		
		.btn-dark {
		  background: #555;
		  color: #fff;
		}
		
		.btn-dark:hover, .btn-dark:focus {
		  background: #373737;
		  border-color: #373737;
		  color: #fff;
		}
		
		.btn-dark {
		  background: #555;
		  color: #fff;
		}
		
		.btn-dark:hover, .btn-dark:focus {
		  background: #373737;
		  border-color: #373737;
		  color: #fff;
		}
		
		/* reset */
		
		/* * {
		  list-style: none;
		  text-decoration: none;
		  padding: 0;
		  margin: 0;
		  box-sizing: border-box;
		} */
		.clearfix:after {
		  content: '';
		  display: block;
		  clear: both;
		}
		.container {
		  width: 1000px;
		  margin: 0 auto;
		}
		.blind {
		  position: absolute;
		  overflow: hidden;
		  clip: rect(0 0 0 0);
		  margin: -1px;
		  width: 1px;
		  height: 1px;
		}
		
		#boardWrite_btn{  background: #f5f5f5;
		  color: black;
		  border-color: #f5f5f5;
		  margin-top:30px;
		  margin-left:1400px;}
		
		#boardWrite_btn:hover{ background: #373737;
		  border-color: #373737;
		  color: #fff;}

</style>

<%--  <%@ include file = "footer.jsp" %>  --%>
