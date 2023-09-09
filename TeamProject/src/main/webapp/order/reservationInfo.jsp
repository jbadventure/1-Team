<%@page import="com.itwillbs.domain.OrdersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 

<h3>예약완료되었습니다!</h3>

<%
request.setCharacterEncoding("utf-8");
OrdersDTO ordersDTO = (OrdersDTO)request.getAttribute("ordersDTO"); 
%>

<table id="class-content">
<tr><td><h5> 예약정보를 확인하세요 </h5></td></tr>
<tr><td>결제번호 <%=ordersDTO.getOrdersNum() %></td></tr>
<tr><td>결제아이디 <%=ordersDTO.getOrdersId() %></td></tr>
<tr><td>클래스제목 <%=ordersDTO.getClassSubject() %></td></tr>
<tr><td>예약날짜 <%=ordersDTO.getOrdersDate() %></td></tr>
<tr><td>예약인원 <%=ordersDTO.getOrdersAmount() %></td></tr>
<tr><td>총 결제금액 <%=ordersDTO.getTotalPrice() %></td></tr>
<tr><td>결제일시 <%=ordersDTO.getPayDate() %></td></tr>
<tr><td>결제방법 <%=ordersDTO.getPayMethod() %></td></tr>
</table>
<br>
<button onclick = "location.href='main.me'">메인으로이동</button><br>
<button onclick = "location.href='classList.cbo'">클래스목록으로돌아가기</button><br>

<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>