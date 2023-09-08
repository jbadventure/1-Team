<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@page import="com.itwillbs.domain.ClassBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
<header>

<%
List<ClassBoardDTO> boardList =(List<ClassBoardDTO>)request.getAttribute("boardList");
MemberDTO memberDTO=(MemberDTO)request.getAttribute("memberDTO");
String memberId = (String)session.getAttribute("memberId");
%>
		<div id="logo">
			<a href="test8.html"><h1>로고</h1></a>
		</div>
		<nav>
<% // 상단바 로그인세션에 따라 다르게보이게  
if(memberId == null){ %>				
			<ul id="topMenu">
				<li><a href="/TeamProject/noticeList.nbo" >공지</a></li>
			    <li><a href="/TeamProject/questionList.qbo">QnA</a></li>
				<li><a href="/TeamProject/classList.cbo">클래스</a></li>
				<li><a href="/TeamProject/ghselect.me">회원가입</a></li>
				<li><a href="/TeamProject/login.me" >로그인</a></li>
			</ul>
<%-- <% } else if(memberDTO.getMemberId().equals("admin")){ %>			 --%>
<!-- 			<ul id="topMenu"> -->
<!-- 				<li><a href="/TeamProject/noticeList.nbo" >공지</a></li> -->
<!-- 			    <li><a href="/TeamProject/questionList.qbo">QnA</a></li> -->
<!-- 				<li><a href="/TeamProject/classList.cbo">클래스</a></li> -->
<!-- 				<li><a href="/TeamProject/logout.me" >로그아웃</a></li> -->
<!-- 				<li><a href="/TeamProject/memberList.me" >회원목록</a></li> -->
<!-- 			</ul> -->
<%} else { %>
			<ul id="topMenu">
				<li><a href="/TeamProject/noticeList.nbo" >공지</a></li>
			    <li><a href="/TeamProject/questionList.qbo">QnA</a></li>
				<li><a href="/TeamProject/classList.cbo">클래스</a></li>
				<li><a href="/TeamProject/logout.me" >로그아웃</a></li>
				<li><a href="/TeamProject/info.me">마이페이지</a></li>
			</ul>
<% } %>			
		</nav>
	</header>
</div>