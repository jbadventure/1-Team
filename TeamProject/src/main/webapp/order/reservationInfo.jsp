<%@page import="com.itwillbs.domain.PayDTO"%>
<%@page import="com.itwillbs.domain.ReserveDTO"%>
<%@page import="com.itwillbs.domain.ClassBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>예약완료되었습니다!</h3>

<%
request.setCharacterEncoding("utf-8");
ClassBoardDTO boardDTO = (ClassBoardDTO)request.getAttribute("boardDTO");
ReserveDTO reserveDTO = (ReserveDTO)request.getAttribute("reserveDTO");
PayDTO payDTO = (PayDTO)request.getAttribute("payDTO");
// String classSubject = request.getParameter("classSubject");
// int classPrice = Integer.parseInt(request.getParameter("classPrice"));
// int reservationNum = Integer.parseInt(request.getParameter("reservationNum"));
// String reservationId = request.getParameter("reservationId");
// String reservationDate = request.getParameter("reservationDate");
// int reservationAmount = Integer.parseInt(request.getParameter("reservationAmount"));
// String payDate = request.getParameter("payDate");
// String payMethod = request.getParameter("payMethod");
// // int payPrice = classPrice*reservationAmount;
%>

<table id="class-content">
<tr><td><h4> 예약정보를 확인하세요 </h4></td></tr>
<tr><td>예약번호 <%=reserveDTO.getReservationNum() %></td></tr>
<tr><td>예약아이디 <%=reserveDTO.getReservationId() %></td></tr>
<tr><td>클래스제목 <%=boardDTO.getClassSubject() %></td></tr>
<tr><td>예약날짜 <%=reserveDTO.getReservationDate() %></td></tr>
<tr><td>예약인원 <%=reserveDTO.getReservationAmount() %></td></tr>
<%-- <tr><td>총 결제금액 <%=payPrice %></td></tr> --%>
<tr><td>결제일 <%=payDTO.getPayDate() %></td></tr>
<tr><td>결제방법 <%=payDTO.getPayMethod() %></td></tr>
</table>
<br>
나의예약리스트보기버튼 <br> 
클래스목록으로돌아가기 <br>

select r.reservationNum , r.reservationId, r.reservationDate, r.reservationAmount, c.classNum , p.payDate, p.payMethod
from reservation r join class c 
on r.classNum = c.classNum 
join pay p 
on r.reservationNum = p.reservationNum
where r.reservationNum = 2;

</body>
</html>