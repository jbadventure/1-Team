<%@page import="com.itwillbs.domain.OrdersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link href="css/body.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 

<div id = bodycontainer>
<div id = bodycontent>

<h3>예약상세정보</h3>
<%
request.setCharacterEncoding("utf-8");
OrdersDTO ordersDTO = (OrdersDTO)request.getAttribute("ordersDTO"); 
%>

<table id="class-content">
<tr><td><h5> <%=ordersDTO.getOrdersId() %>님의 예약정보를 확인하세요 </h5></td></tr>
<tr><td>결제번호 <%=ordersDTO.getOrdersNum() %></td></tr>
<tr><td>
    <% if(ordersDTO.getClassFile() == null){ %>
                <img src="images/logo-198x66.png" width="107" height="71">
    <% }else{ %>           
            	<img src="upload/<%=ordersDTO.getClassFile() %>" width="107" height="71">
    <% } %>
</td></tr>
<tr><td>클래스제목 <%=ordersDTO.getClassSubject() %></td></tr>
<tr><td>예약날짜 <%=ordersDTO.getOrdersDate() %></td></tr>
<tr><td>예약인원 <%=ordersDTO.getOrdersAmount() %></td></tr>
<tr><td>총 결제금액 <%=ordersDTO.getTotalPrice() %></td></tr>
<tr><td>결제일시 <%=ordersDTO.getPayDate() %></td></tr>
<tr><td>결제방법 <%=ordersDTO.getPayMethod() %></td></tr>
</table>
<br>
<button onclick = "location.href='myReserveList.or'">나의예약리스트보기버튼</button><br> 

</div>
</div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>