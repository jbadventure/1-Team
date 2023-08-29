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
  
<!--배경css--> 
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
.products h4{
    font-size: 24px;
    color: #545454;
    margin-top:15px;
    margin-bottom: 15px;
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
<!--탭css -->
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
<!--모달창 css-->
* {
  padding:0;
  margin:0;
  box-sizing: border-box;
}
#btnWrap {
  width: 500px;
  margin: 100px auto;
}
#popupBtn {
  width: 150px;
  height: 50px;
  padding: 10px 5px;
}
#modalWrap {
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  display: none;
}
#modalBody {
  width: 500px;
  height: 300px;
  padding: 30px 30px;
  margin: 0 auto;
  border: 1px solid #777;
  background-color: #fff;
}
#closeBtn {
  float:right;
  font-weight: bold;
  color: #777;
  font-size:15px;
  cursor: pointer;
}
 </style>
  <meta charset="utf-8">
  <link rel="stylesheet" href="shopcss.css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">

<body>

    <div class="navbar">
        <a href="main.me" id="logo"><!--로고-->
            <img src="images/logo-198x66.png" height="60">
        </a>

        <ul id="menu"><!--상단우측-->
            <li><a href="#"><b>Contact</b></a></li>
            <li><a href="#"><b>Login</b></a></li>
        </ul>
    </div>

    <div class="hero-header"></div>

    <div class="products">
        <h3>클래스 제목</h3> 
        
 <%
String memberId = (String)session.getAttribute("memberId");
ClassBoardDTO boardDTO = (ClassBoardDTO)request.getAttribute("boardDTO");
%>       

 <div class="container">
 
  <ul class="tabs"><!--탭메뉴-->
    <li class="tab-link current" data-tab="tab-1">클래스 내용</li>
    <li class="tab-link" data-tab="tab-2">클래스 정보</li>
    <li class="tab-link" data-tab="tab-3">클래스 리뷰</li>
  </ul>
 
  <div id="tab-1" class="tab-content current"><!--탭1내용-->
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
<tr><td>이미지파일</td><td><img src="upload/<%=boardDTO.getClassFile() %>" width="320" height="212"></td></tr>    
</table>
<%
// 로그인 필수
// 로그인, 글쓴이 일치하면 => 글수정, 글삭제 보이기
if(memberId != null){
	if(memberId.equals(boardDTO.getHostId())){
		%>    
		<input type="button" value="클래스 수정" class="btn" 
       					onclick="location.href='classUpdate.cbo?classNum=<%=boardDTO.getClassNum()%>'">
  		<input type="button" value="클래스 삭제" class="btn" 
       					onclick="location.href='classDelete.cbo?classNum=<%=boardDTO.getClassNum()%>'">
		<%
	}else{
		%>
		<input type="button" value="예약하기" class="btn" onclick="location.href='classWrite.cbo'"> 
		<% 
	 }
	 %>
<%
}else{
%>
	<div id="btnWrap">
  <button id="popupBtn">예약하기</button>
</div>

<!-- 모달->입력값 전송 -->
<form action = "pay.pa" method="post" id="fr">
<div id="modalWrap">
    <div id="modalBody">  
    <div class="container" align="center">  
     <h4>예약정보확인</h4> 
       <div>예약일</div><input type="date" id="datePicker" min="" max="" value=""><br>
       <br>
	<div>예약인수</div>
	<select id="peopleCount">
            <!-- 1부터 10까지 옵션 생성 -->
            <option value="1">1명</option>
            <option value="2">2명</option>
            <option value="3">3명</option>
            <option value="4">4명</option>
            <option value="5">5명</option>
            <option value="6">6명</option>
            <option value="7">7명</option>
            <option value="8">8명</option>
            <option value="9">9명</option>
            <option value="10">10명</option>
        </select><br>
        <br>
	<div>총 결제금액 <br> classPrice파라미터값 *셀렉트값 </div><br>
<input type="submit" value="결제하기" class="btn">

<span id="closeBtn">창닫기</span>
    </div>
</div>
</div>
<%	
}
%>
</form>

<input type="button" value="클래스 목록으로 돌아가기" class="btn" onclick = "location.href='classList.cbo'">
</div>
  </div>
  
  <div id="tab-2" class="tab-content"><!--탭2내용-->
  클래스 정보
  </div>
  
  <div id="tab-3" class="tab-content"><!--탭3내용-->
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

// !탭 
$(document).ready(function(){
   
  $('ul.tabs li').click(function(){
    var tab_id = $(this).attr('data-tab');
 
    $('ul.tabs li').removeClass('current');
    $('.tab-content').removeClass('current');
 
    $(this).addClass('current');
    $("#"+tab_id).addClass('current');
  })
})

// !모달기능

const btn = document.getElementById('popupBtn');
const modal = document.getElementById('modalWrap');
const closeBtn = document.getElementById('closeBtn');

btn.onclick = function() {
  modal.style.display = 'block';
}
closeBtn.onclick = function() {
  modal.style.display = 'none';
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

// !달력날짜선택
//Get today's date
const today = new Date();

// Calculate the date for tomorrow
const tomorrow = new Date(today);
tomorrow.setDate(today.getDate() + 1);

// Calculate the date 28 days from today
const maxDate = new Date(today);
maxDate.setDate(today.getDate() + 28);

// Format the dates in 'YYYY-MM-DD' format
const formattedTomorrow = tomorrow.toISOString().split('T')[0];
const formattedMaxDate = maxDate.toISOString().split('T')[0];

// Set the minimum and maximum values for the input
const datePicker = document.getElementById('datePicker');
datePicker.min = formattedTomorrow;
datePicker.max = formattedMaxDate;

//모달-셀렉트박스 인원선택 
const peopleCount = document.getElementById("peopleCount");
    

confirmBtn.addEventListener("click", () => {
        const selectedCount = peopleCount.value;
        alert(`선택된 인원 수: ${selectedCount}`);
        modal.style.display = "none";
    });

</script>


</body>
</html>