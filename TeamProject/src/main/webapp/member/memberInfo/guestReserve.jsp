<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.ClassBoardDTO"%>
<%@page import="java.util.List"%>
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
List<ClassBoardDTO> boardList =(List<ClassBoardDTO>)request.getAttribute("boardList");
PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
String memberId = (String)session.getAttribute("memberId");
%>
<%
request.setCharacterEncoding("utf-8");
String classSubject = request.getParameter("classSubject");
String classPrice = request.getParameter("classPrice");
String reservationNum = request.getParameter("reservationNum");
String reservationId = request.getParameter("reservationId");
String reservationDate = request.getParameter("reservationDate");
String reservationAmount = request.getParameter("reservationAmount");
String payDate = request.getParameter("payDate");
String payMethod = request.getParameter("payMethod");
%>

<table id="class-content">
<tr><td><h4> 예약정보를 확인하세요 </h4></td></tr>
<tr><td>예약번호 <%=reservationNum %></td></tr>
<tr><td>예약아이디 <%=reservationId %></td></tr>
<tr><td>클래스제목 <%=classSubject %></td></tr>
<tr><td>예약날짜 <%=reservationDate %></td></tr>
<tr><td>예약인원 <%=reservationAmount %></td></tr>
<tr><td>총 결제금액 <%=classPrice %> * <%=reservationAmount %></td></tr>
<tr><td>결제일 <%=payDate %></td></tr>
<tr><td>결제방법 <%=payMethod %></td></tr>
</table>
<br>
나의예약리스트보기버튼 <br> 
클래스목록으로돌아가기 <br>


        <h3>클래스 목록</h3>
        
        <%
for(int i=0; i<boardList.size(); i++){
	ClassBoardDTO boardDTO = boardList.get(i);
	%>
             <a href="classContent.cbo?classNum=<%=boardDTO.getClassNum() %>" class="product">
     <%      
      		if(boardDTO.getClassFile() == null){
     %>
                <img src="images/cat-space.gif" width="225" height="225px">
     <%		}else{
     %>           
            	<img src="upload/<%=boardDTO.getClassFile() %>" width="225" height="225px">
     <%			 }
     %>

                	제목 : <%=boardDTO.getClassSubject() %>
                </div>
                	금액 : <%=boardDTO.getClassPrice() %>
                </div>
            </a>        
          
<%
}
%>

</body>
</html>