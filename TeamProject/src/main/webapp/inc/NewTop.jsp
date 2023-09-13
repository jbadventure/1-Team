<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@page import="com.itwillbs.domain.ClassBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="TopContainer">
<header>

<%
List<ClassBoardDTO> boardList =(List<ClassBoardDTO>)request.getAttribute("boardList");
MemberDTO memberDTO=(MemberDTO)request.getAttribute("memberDTO");
String memberId = (String)session.getAttribute("memberId");
%>
		<div id="logo">
			<a href="main.me"><h1><img src="images/logo-198x66.png"></h1></a>
		</div>
		<nav> 
<% // 상단바 로그인세션에 따라 다르게보이게  
if(memberId == null){ %>				
			<ul id="topMenu">
				<li><a href="/TeamProject/noticeList.nbo" >공지사항</a></li>
			    <li><a href="/TeamProject/questionList.qbo">FAQ</a></li>
				<li><a href="/TeamProject/classList.cbo">카테고리</a></li>
				<li><a id="table_search">
					<form action="listSearch.cbo" method="get">
					<input type="text" name="search" class="search" placeholder="지금 생각나는 취미를 검색하세요!">
					<input type="submit" value="검색" class="btn">
					</form>
					</a></li>
				<li><a href="/TeamProject/ghselect.me">회원가입</a></li>
				<li><a href="/TeamProject/login.me" >로그인</a></li>
			</ul> 
<% }else if(memberId.equals("admin")){ %>			
			<ul id="topMenu">
				<li><a href="/TeamProject/noticeList.nbo" >공지사항</a></li>
			    <li><a href="/TeamProject/questionList.qbo">FAQ</a></li>
				<li><a href="/TeamProject/classList.cbo">카테고리</a></li>
				<li><a id="table_search">
					<form action="listSearch.cbo" method="get">
					<input type="text" name="search" class="search" placeholder="지금 생각나는 취미를 검색하세요!">
					<input type="submit" value="검색" class="btn">
					</form>
					</a></li>
				<li><a href="/TeamProject/logout.me" >로그아웃</a></li>
				<li><a href="/TeamProject/memberList.me" >회원목록</a></li>
			</ul>
<% } else { %>
			<ul id="topMenu">
				<li><a href="/TeamProject/noticeList.nbo" >공지사항</a></li>
			    <li><a href="/TeamProject/questionList.qbo">FAQ</a></li>
				<li><a href="/TeamProject/classList.cbo">카테고리</a></li>
				<li><a id="table_search">
					<form action="listSearch.cbo" method="get">
					<input type="text" name="search" class="search" placeholder="지금 생각나는 취미를 검색하세요!">
					<input type="submit" value="검색" class="btn">
					</form>
					</a></li>
				<li><a href="/TeamProject/logout.me" >로그아웃</a></li>
				<li><a href="/TeamProject/info.me">마이페이지</a></li>
			</ul>
<% } %>			
		</nav>
	</header>
</div>