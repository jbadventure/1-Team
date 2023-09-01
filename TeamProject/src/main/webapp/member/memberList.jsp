<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/memberList.jsp</title>
</head>
<body>
<%
List<MemberDTO> memberList=(List<MemberDTO>)request.getAttribute("memberList");
%>
<article>
<h1>List Us</h1>
<table id="memberList">
<tr><th class="memberId">아이디</th>
    <th class="memberPassword">비밀번호</th>
    <th class="memberName">이름</th>
    <th class="memberNickname">닉네임</th>
    <th class="memberBirthday">생년월일</th>
    <th class="memberGender">성별</th>
    <th class="memberPhoneNum">전화번호</th>
    <th class="memberEmail">이메일</th>
    <th class="memberType">회원유형</th>
    <th class="businessNum">사업자번호</th>
    <th class="date">가입일자</th></tr>
 <%
 // import="java.text.SimpleDateFormat"
 // 날짜 => 원하는 포맷으로 변경하면 => 문자열 결과 리턴 
//  SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
 for(int i=0;i<memberList.size();i++){
	 MemberDTO memberDTO =memberList.get(i);
	 %>
<tr><td><%=memberDTO.getMemberId() %></td>
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
</body>
</html>