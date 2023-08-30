<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.ClassBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="shopcss.css">
  <link href="css/newfile.css" rel="stylesheet" type="text/css">
  <link href="css/tabs.css" rel="stylesheet" type="text/css">
   <link href="css/modal.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
 <title>Shop</title> 
</head>

<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 

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
<tr><td>이미지파일</td><td>
    <%      
      		if(boardDTO.getClassFile() == null){
     %>
                <img src="images/logo-198x66.png" width="320" height="212" name="thumnail">
     <%		}else{
     %>           
            	<img src="upload/<%=boardDTO.getClassFile() %>" width="320" height="212" name="thumnail">
     <%			 }
     %>
</td></tr>
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
			<div id="btnWrap"><button id="popupBtn">예약하기</button></div>
                 <!-- 모달->입력값 전송 -->
              <form action = "pay.pa" method="post" id="fr">
               <div id="modalWrap">
                 <div id="modalBody">  
                  <div class="container" align="center">  
                   <h4>상세예약정보입력</h4>
      	            <div>예약 클래스 제목 : <%=boardDTO.getClassSubject() %></div>
      	            <input type="hidden" name ="thumnail"  id="thumnail" value="thumnail"><!-- classFile값 전달 -->
      				<input type="hidden" name ="classSubject"  id="classSubject" value="<%=boardDTO.getClassSubject() %>"><!-- classSubject값 전달 -->
      				<input type="hidden" name ="classNum"  id="classNum" value="<%=boardDTO.getClassNum() %>"><!-- classNum값 전달 -->
      				<input type="hidden" name ="classPrice"  id="classPrice" value="<%=boardDTO.getClassPrice() %>"><!-- classPrice값 전달 -->
      				<input type="hidden" name ="reservationId"  id="reservationId" value="<%=boardDTO.getClassNum() %>"><!-- reservationId값 전달 -->
                   <div>예약일</div><input type="date" name="reservationDate" id="datePicker" min="" max="" value=""><br><br>
	               <div>예약인수</div>	<select name ="reservationAmount"  id="peopleCount">
                                                          <!-- 1부터 10까지 옵션 생성 -->
                                                          <option value="1">1명</option>
                                                          <option value="2">2명</option>
                                                          <option value="3">3명</option>
                                                          <option value="4">4명</option>
                                                          <option value="5">5명</option>
                                                     </select><br><br>
<%--         <%String reservationAmount = request.getParameter("reservationAmount"); %> --%>
<%-- 		 <div>총 결제금액 <br> <%=boardDTO.getClassPrice() %> * <%=reservationAmount %> </div><br> --%>
                  <input type="submit" value="결제하기" class="btn">
             <span id="closeBtn">창닫기</span>
             </div></div></div>
  <%	
  }
 %>
</form>
	
<%
} else {
%>
				<div id="btnWrap"><button id="popupBtn">예약하기</button></div>
                 <!-- 모달-->
               <div id="modalWrap">
                 <div id="modalBody">  
                  <div class="container" align="center">  
                  <h5>로그인 정보가 없습니다</h5>
                  <button onclick = "location.href='login.me'">로그인 페이지로 이동</button>
                               <span id="closeBtn">창닫기</span>
             </div></div></div>
<%
}
%>


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