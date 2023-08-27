<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.ClassBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
  <title>Shop</title> 
  <style type="text/css">
  .navbar{
    height: 60px;
    padding-left: 30px;
    padding-right: 30px;

}

.hero-header{
    height: 450px;
    background-image: url("images/wine.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center center;
    }
      
.navbar #logo{
    line-height: 60px;
}

.navbar #menu{
    float: right;
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.navbar #menu li{
    float: left;
    margin-left: 50px;
    line-height: 60px;
}

.navbar #menu li a{
    color: #545454;
    font-size: 13px;
    text-decoration: none;
}
.product-list{
    width: 735px;
    margin-left: auto;
    margin-right: auto;
}
.products h3{
    font-size: 24px;
    color: #545454;
    margin-top:60px;
    margin-bottom: 60px;
    text-align: center;
}

.product{
    display: block;
    width: 225px;
    text-align: center;
    text-decoration:none;
    color: black;
    float:left;
    margin-left: 10px;
    margin-right: 10px;
    margin-bottom: 30px;
}

.product-name{
    margin-top: 20px;
    margin-bottom: 4px;
}

.clearfix{
    clear: both;
}
.footer{
    text-align: center;
    margin-top: 40px;
    margin-bottom: 40px;
}

.footer a{
    margin-left: 10px;
    margin-right: 10px;
    text-decoration:none;
}
  </style>
  <meta charset="utf-8">
  <link rel="stylesheet" href="shopcss.css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
</head>
<body>

    <div class="navbar">
        <a href="#" id="logo">
            <img src="images/logo-198x66.png" height="60">
        </a>

        <ul id="menu">
            <li><a href="#"><b>Contact</b></a></li>
            <li><a href="#"><b>Login</b></a></li>
        </ul>
    </div>

    <div class="hero-header"></div>

    <div class="products">
        <h3>클래스 목록</h3>
<%
List<ClassBoardDTO> boardList =(List<ClassBoardDTO>)request.getAttribute("boardList");
PageDTO pageDTO = (PageDTO)request.getAttribute("pageDTO");
String memberId = (String)session.getAttribute("memberId");
%>
        <div class="product-list">
        
        <%
for(int i=0; i<boardList.size(); i++){
	ClassBoardDTO boardDTO = boardList.get(i);
	%>
             <a href="classContent.cbo?classNum=<%=boardDTO.getClassNum() %>" class="product">
                <img src="images/cat-space.gif" width="225" height="225px">
                <div class="product-name">
                	제목 : <%=boardDTO.getClassSubject() %>
                </div>
                <div class="product-price">
                	금액 : <%=boardDTO.getClassPrice() %>
                </div>
            </a>        
          
<%
}
%>

   <input type="button" value="클래스 등록" class="btn" 
       					onclick="location.href='classWrite.cbo'">
  <input type="button" value="클래스 수정" class="btn" 
       					onclick="location.href='classUpdate.cbo'">
  <input type="button" value="클래스 삭제" class="btn" 
       					onclick="location.href='classDelete.cbo'">
       					
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
            <div class="clearfix"></div>
        </div>

        <div class="footer">
            <a href="http://faceboo.com">
                <img src="https://bakey-api.codeit.kr/files/629/images/facebook.png" height="20">
            </a>
            <a href="http://faceboo.com">
                <img src="https://bakey-api.codeit.kr/files/629/images/instagram.png" height="20">
            </a>
            <a href="http://faceboo.com">
                <img src="https://bakey-api.codeit.kr/files/629/images/twitter.png" height="20">
            </a>
        </div>
    </div>
</body>
</html>