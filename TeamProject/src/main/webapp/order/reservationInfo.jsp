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
  <link href="css/reservationInfo.css" rel="stylesheet" type="text/css">  
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 

<div id = bodycontainer>
<div id = content_frame>

<%
request.setCharacterEncoding("utf-8");
OrdersDTO ordersDTO = (OrdersDTO)request.getAttribute("ordersDTO"); 
%>




<br><h2>예약완료되었습니다!</h2>
<h4> 예약정보를 확인하세요 </h4><br><br>

    <% if(ordersDTO.getClassFile() == null){ %>
                <img src="images/logo-198x66.png" class="content_image" width="107" height="71">
    <% }else{ %>           
            	<img src="upload/<%=ordersDTO.getClassFile() %>" class="content_image" width="107" height="71">
    <% } %>
<div id="class-content" >
<table>
<tr><td id="subject"><%=ordersDTO.getClassSubject() %></td></tr>
<tr><td></td></tr>
<tr><td>예약날짜 <%=ordersDTO.getOrdersDate() %></td></tr>
<tr><td>예약인원 <%=ordersDTO.getOrdersAmount() %></td></tr>
</table>
</div>
<div id="class-content-l" >
</div>
<div id="class-content-p" >
<table>
<tr><td>결제일시 <%=ordersDTO.getPayDate() %></td></tr>
<tr><td>결제방법 <%=ordersDTO.getPayMethod() %></td></tr>
</table>
</div>
<div id="class-content-l" >
</div>
<div id="class-content-p" >
<table>
<tr><td> 총 결제금액 <%=ordersDTO.getTotalPrice() %></td></tr>
</table>
</div><br>

<input type="button" onclick="location.href='myReserveList.or'" value="예약내역" id="btn">


<!-- <div id="btn"> -->
<!-- <button onclick = "location.href='myReserveList.or'">예약내역</button> -->
<!-- <button onclick = "location.href='classList.cbo'">클래스목록</button> -->
<!-- </div> -->

</div>
</div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>