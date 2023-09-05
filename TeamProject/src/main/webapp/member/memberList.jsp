<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/newfile.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>member/memberList.jsp</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 
<%
List<MemberDTO> memberList=(List<MemberDTO>)request.getAttribute("memberList");
PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
%>
<!-- 게시판 -->
<article>
<h1>List Us</h1>
<table id="memberList">
<tr><th class="memberNum">번호</th>
	<th class="memberId">아이디</th>
    <th class="memberPassword">비밀번호</th>
    <th class="memberName">이름</th>
    <th class="memberNickname">닉네임</th>
    <th class="memberBirthday">생년월일</th>
    <th class="memberGender">성별</th>
    <th class="memberPhoneNum">전화번호</th>
    <th class="memberEmail">이메일</th>
    <th class="memberType">회원유형</th>
    <th class="businessNum">사업자번호</th></tr>
 <%
 // 날짜 => 원하는 포맷으로 변경하면 => 문자열 결과 리턴 
//  SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
 for(int i=0;i<memberList.size();i++){
	 MemberDTO memberDTO =memberList.get(i);
	 %>
<tr><td><%=memberDTO.getMemberNum() %></td>
	<td><%=memberDTO.getMemberId() %></td>
    <td><%=memberDTO.getMemberPassword() %></td>
    <td><%=memberDTO.getMemberName() %></td>
    <td><%=memberDTO.getMemberNickname() %></td>
    <td><%=memberDTO.getMemberBirthday() %></td>
    <td><%=memberDTO.getMemberGender() %></td>
    <td><%=memberDTO.getMemberPhoneNum() %></td>
    <td><%=memberDTO.getMemberEmail() %></td>
    <td><%=memberDTO.getMemberType() %></td>
    <td><%=memberDTO.getBusinessNum() %></td></tr>
	 <%
 }
 %>
</table>
 
<div class="clear"></div>
<div id="page_control">
<%
// 시작페이지 1페이지 prev 없음 
// 시작페이지 11,21,31, prev 보임 
if(pageDTO.getStartPage() > pageDTO.getPageBlock()){
	%>
	<a href = "memberList.me?pageNum=<%=pageDTO.getStartPage()-pageDTO.getPageBlock() %>">Prev</a>
	<%
}	
%>
<%
for(int i = pageDTO.getStartPage(); i<=pageDTO.getEndPage(); i++){
	%>
	<a href = "memberList.me?pageNum=<%=i %>"><%=i %></a>
	<%
}	
	%>
	
<%
//끝페이지번호  전체페이지수 비교 => 전체페이지수 크면 => Next보임
if(pageDTO.getEndPage() < pageDTO.getPageCount()){
	%>
	<a href="memberList.me?pageNum=<%=pageDTO.getStartPage()+pageDTO.getPageBlock()%>">Next</a>
	<%
}
%>
</div>
</article>        
<div class="clear"></div>

<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>