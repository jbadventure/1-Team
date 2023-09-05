<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8"> 
    <link rel="icon" href="images/favicon.ico?v=2" type="image/x-icon">
    
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Roboto:100,300,300i,400,500,600,700,900%7CRaleway:500">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/fonts.css">
    <link rel="stylesheet" href="css/style.css">
    
    <header class="section page-header">
    
    <%
    String memberId = (String)session.getAttribute("memberId");
 
 // 상단바 로그인세션에 따라 다르게보이게  
 if(memberId == null){
 %>       
      <ul id="menu">
            <li><a href="#"><b>Contact</b></a></li>
            <li><a href="login.me"><b>Login</b></a></li>
        </ul>
    </div>
<%
}else{   
%>
	<ul id="menu">
            <li><a href="#"><b>Contact</b></a></li>
            <li><a href="info.me"><b><%=memberId %>님</b></a></li>
             <li><a href="logout.me"><b>logout</b></a></li>
        </ul>
 <%	
}
%>

 
<div class="rd-navbar-brand"><a class="brand" href="index.html"><img class="brand-logo-dark" src="images/logo-198x66.png" alt="" width="198" height="66"/></a></div>
<ul>
	<li><a href="noticeList.nbo">공지사항</a></li>
	<li><a href="noticeList.nbo">자주묻는질문</a></li>
	<li><a href="noticeList.nbo">Q&A</a></li>
	<div class="rd-nav-item"><input type="search" placeholder="지금 생각나는 취미를 검색하세요." class="rd-nav-searchbar"></div>
	<li><a href="ghselect.me">회원가입</a></li>
	<li><a href="login.me">로그인</a></li>
	</ul>
	
	</header>
    
   