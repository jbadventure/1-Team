<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <header>
    <%
    String memberId = (String)session.getAttribute("memberId");
    %>
        <div class="navbar">
        <a href="main.me" id="logo">
            <img src="images/logo-198x66.png" height="60">
        </a>
     <%
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
    <div class="hero-header"></div>
    </header>