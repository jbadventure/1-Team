<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.ClassBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
<!--   <link href="css/body.css" rel="stylesheet" type="text/css"> -->
  <link href="css/product.css" rel="stylesheet" type="text/css">
  <link rel="icon" href="images/favicon.ico?v=2" type="image/x-icon">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
  <title>palette</title> 
  <meta charset="utf-8">
  <link rel="stylesheet" href="shopcss.css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 
<div id = bodycontainer>
<div id = content_frame>
<%
List<ClassBoardDTO> boardList =(List<ClassBoardDTO>)request.getAttribute("boardList");
PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
String memberId = (String)session.getAttribute("memberId");
%>

    <div class="products">
        <h3>나의 클래스 관리</h3>

        <div class="product-list">
        
        <%
for(int i=0; i<boardList.size(); i++){
	ClassBoardDTO boardDTO = boardList.get(i);
	 // 로그인한 사용자의 글만 필터링하여 표시
    if (boardDTO.getHostId().equals(memberId)) {
	%>
             <a href="classContent.cbo?classNum=<%=boardDTO.getClassNum() %>" class="product">
     <%      
      		if(boardDTO.getClassFile() == null){
     %>     <img src="images/logo_board.png" >
    <%	}else{ %>           
            	<img src="upload/<%=boardDTO.getClassFile() %>">
     <%	 }  %>
                <div class="product-name">
                	제목 : <%=boardDTO.getClassSubject() %>
                </div>
                <div class="product-price">
                	금액 : <%=boardDTO.getClassPrice() %>
                </div>
            </a>        
<%
		}
}
%>
</div>
   <input type="button" value="클래스 등록" class="classbo_btn" 
       					onclick="location.href='classWrite.cbo'">
       					
 <div id="page_control">
<%
// 시작페이지 1페이지 prev 없음 
// 시작페이지 11,21,31, prev 보임 
if(pageDTO.getStartPage() > pageDTO.getPageBlock()){
	%>
	<a href = "classList.cbo?pageNum=<%=pageDTO.getStartPage()-pageDTO.getPageBlock() %>">Prev</a>
	<%
}	
%>
<%
for(int i = pageDTO.getStartPage(); i<=pageDTO.getEndPage(); i++){
	%>
	<a href = "classList.cbo?pageNum=<%=i %>"><%=i %></a>
	<%
}	
	%>
	
<%
//끝페이지번호  전체페이지수 비교 => 전체페이지수 크면 => Next보임
if(pageDTO.getEndPage() < pageDTO.getPageCount()){
	%>
	<a href="classList.cbo?pageNum=<%=pageDTO.getStartPage()+pageDTO.getPageBlock()%>">Next</a>
	<%
}
%>

</div>
</div>
</div>
</div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>