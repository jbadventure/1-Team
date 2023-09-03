<%@page import="com.itwillbs.domain.ReserveDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my reservation</title>
</head>
<body>
<%
String reservationId = request.getParameter("reservationId");
List<ReserveDTO> reserveList = (List<ReserveDTO>)request.getAttribute("reserveList");
%>
<%
for(int i=0; i<reserveList.size(); i++){
	ReserveDTO reserveDTO = reserveList.get(i);
	%>
	<table id="class-content">
	<tr><td><h4> 나의 예약 목록 </h4></td></tr>
	<tr><td>예약번호 <%=reserveDTO.getReservationNum() %></td></tr>
	<tr><td>예약아이디 <%=reserveDTO.getReservationId() %></td></tr>
<%-- 	<tr><td>클래스제목 <%=boardDTO.getClassSubject() %></td></tr> --%>
	<tr><td>예약날짜 <%=reserveDTO.getReservationDate() %></td></tr>
	<tr><td>예약인원 <%=reserveDTO.getReservationAmount() %></td></tr>
<%-- 	<tr><td>총 결제금액 <%=payDTO.getPayPrice() %></td></tr> --%>
<%-- 	<tr><td>결제일 <%=payDTO.getPayDate() %></td></tr> --%>
<%-- 	<tr><td>결제방법 <%=payDTO.getPayMethod() %></td></tr> --%>
	</table>
<%
}
%>	
</body>
</html>