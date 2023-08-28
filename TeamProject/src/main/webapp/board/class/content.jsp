<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.ClassBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Shop</title> 
</head>


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
.product-content{
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

ul.tabs{
  margin: 0px;
  padding: 0px;
  list-style: none;
}
ul.tabs li{
  background: none;
  color: #222;
  display: inline-block;
  padding: 10px 15px;
  cursor: pointer;
}

ul.tabs li.current{
  background: #ededed;
  color: #222;
}

.tab-content{
  display: none;  
  padding: 15px 0;
  border-top:3px solid #eee;
}

.tab-content.current{
  display: inherit;
}
  </style>
  <meta charset="utf-8">
  <link rel="stylesheet" href="shopcss.css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">

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
        <h3>클래스 제목</h3> 
        
 <%

ClassBoardDTO boardDTO = (ClassBoardDTO)request.getAttribute("boardDTO");
%>       

 <div class="container">
 
  <ul class="tabs">
    <li class="tab-link current" data-tab="tab-1">클래스 내용</li>
    <li class="tab-link" data-tab="tab-2">클래스 정보</li>
    <li class="tab-link" data-tab="tab-3">클래스 리뷰</li>
  </ul>
 
  <div id="tab-1" class="tab-content current">
<div class="product-content">
           
<table id="class-content">
<tr><td>글번호</td><td><%=boardDTO.getClassNum() %></td></tr>
<tr><td>제목</td><td><%=boardDTO.getClassSubject() %></td></tr>
<tr><td>글쓴이</td><td><%=boardDTO.getHostId() %></td></tr>
<tr><td>글쓴날짜</td><td><%=boardDTO.getClassIssueDate() %></td></tr>
<tr><td>지역</td><td><%=boardDTO.getClassLocation() %></td></tr>
<tr><td>카테고리</td><td><%=boardDTO.getClassCategory() %></td></tr>    
<tr><td>내용</td><td><%=boardDTO.getClassContent() %></td></tr>    
<tr><td>가격</td><td><%=boardDTO.getClassPrice() %></td></tr>    
<tr><td>이미지파일</td><td><%=boardDTO.getClassFile() %></td></tr>    
</table>
        
<input type="button" value="클래스 목록" class="btn" onclick = "location.href='classList.cbo'">
<input type="button" value="예약하기" class="btn" 
       					onclick="location.href='classWrite.cbo'">       					

</div>
  </div>
  
  <div id="tab-2" class="tab-content">
  클래스 정보
  </div>
  
  <div id="tab-3" class="tab-content">
  클래스 리뷰 
   </div>
 
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


<script type="text/javascript" 
        src="script/jquery-3.7.0.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   
  $('ul.tabs li').click(function(){
    var tab_id = $(this).attr('data-tab');
 
    $('ul.tabs li').removeClass('current');
    $('.tab-content').removeClass('current');
 
    $(this).addClass('current');
    $("#"+tab_id).addClass('current');
  })
 
})

</script>


</body>
</html>