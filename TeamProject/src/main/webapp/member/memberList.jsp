<%@page import="com.itwillbs.domain.PageDTO"%>
<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/newfile.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>member/memberList.jsp</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 
<%
List<MemberDTO> memberList=(List<MemberDTO>)request.getAttribute("memberList");
%>
<!-- 게시판 -->
<article>
<h1>List Us</h1>
<%-- <table id="memberList2">
<tr><th class="memberNum">번호</th>
	<th class="memberId">아이디</th>
    <th class="memberPassword">비밀번호</th>
    <th class="memberName">이름</th>
    <th class="memberNickname">닉네임</th>
    <th class="memberBirthday">생년월일</th>
    <th class="memberGender">성별</th>
    <th class="memberPhoneNum">전화번호</th>
    <th class="memberEmail">이메일</th>
    <th class="memberType">회원유형</th>
    <th class="businessNum">사업자번호</th></tr>
 <%
 // 날짜 => 원하는 포맷으로 변경하면 => 문자열 결과 리턴 
//  SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
 for(int i=0;i<memberList.size();i++){
	 MemberDTO memberDTO =memberList.get(i);
	 %>
<tr><td><%=memberDTO.getMemberNum() %></td>
	<td><%=memberDTO.getMemberId() %></td>
    <td><%=memberDTO.getMemberPassword() %></td>
    <td><%=memberDTO.getMemberName() %></td>
    <td><%=memberDTO.getMemberNickname() %></td>
    <td><%=memberDTO.getMemberBirthday() %></td>
    <td><%=memberDTO.getMemberGender() %></td>
    <td><%=memberDTO.getMemberPhoneNum() %></td>
    <td><%=memberDTO.getMemberEmail() %></td>
    <td><%=memberDTO.getMemberType() %></td>
    <td><%=memberDTO.getBusinessNum() %></td></tr>
	 <%
 }
 %>
</table> --%>

<input type="hidden" name="memberType" id="memberType1" value="host">
<input type="hidden" name="memberType" id="memberType2" value="guest">
<input type="button" class="btn1" onClick="self_introduction(memberType1.value)" value="host">
<input type="button" class="btn2" onClick="self_introduction(memberType2.value)" value="guest">

<table id="memberList" class="memberList">
<!-- <tr><th class="memberNum">번호</th>
	<th class="memberId">아이디</th>
    <th class="memberPassword">비밀번호</th>
    <th class="memberName">이름</th>
    <th class="memberNickname">닉네임</th>
    <th class="memberBirthday">생년월일</th>
    <th class="memberGender">성별</th>
    <th class="memberPhoneNum">전화번호</th>
    <th class="memberEmail">이메일</th>
    <th class="memberType">회원유형</th>
    <th class="businessNum">사업자번호</th></tr> -->
</table>
</article>        
 
 
 
<%-- <div class="clear"></div>
<div id="page_control">
<%
// 시작페이지 1페이지 prev 없음 
// 시작페이지 11,21,31, prev 보임 
if(pageDTO.getStartPage() > pageDTO.getPageBlock()){
	%>
	<a href = "memberList.me?pageNum=<%=pageDTO.getStartPage()-pageDTO.getPageBlock() %>">Prev</a>
	<%
}	
%>
<%
for(int i = pageDTO.getStartPage(); i<=pageDTO.getEndPage(); i++){
	%>
	<a href = "memberList.me?pageNum=<%=i %>"><%=i %></a>
	<%
}	
	%>
	
<%
//끝페이지번호  전체페이지수 비교 => 전체페이지수 크면 => Next보임
if(pageDTO.getEndPage() < pageDTO.getPageCount()){
	%>
	<a href="memberList.me?pageNum=<%=pageDTO.getStartPage()+pageDTO.getPageBlock()%>">Next</a>
	<%
}
%>
</div>
<div class="clear"></div> --%>


<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>


<script type="text/javascript" 
        src="script/jquery-3.7.0.js"></script>
        
<script type="text/javascript">
	$(document).ready(function(){
// 		class="btn"버튼을 클릭했을 때
		$('.btn1').click(function(){
// 			alert("클릭1");
	$('.memberList').html("");
	$('.memberList').append("<tr><th>번호</th><th>아이디</th><th>비밀번호</th><th>이름</th><th>닉네임</th><th>생년월일</th><th>성별</th><th>전화번호</th><th>이메일</th><th>회원유형</th><th>사업자번호</th></tr>");

			$.ajax({
				url:'listjson.me',
				// 파라미터없으면 생략
				data:{'memberType':$('#memberType1').val()},
				// 리턴한 데이터타입 지정
				dataType:'json',

				success:function(result){
					// result json데이터 형태로 가져오고
					// 반복시켜서 접근해서 => table 출력
					$.each(result, function(index, item){
						// class="memberList" 뒷부분에 추가하면서 출력
						$('.memberList').append("<tr><td>"+item.memberNum+"</td><td>"+item.memberId+"</td><td>"+item.memberPassword+"</td><td>"+
								item.memberName+"</td><td>"+item.memberNickname+"</td><td>"+item.memberBirthday+"</td><td>"+item.memberGender+"</td><td>"+
								item.memberPhoneNum+"</td><td>"+item.memberEmail+"</td><td>"+item.memberType+"</td><td>"+item.businessNum+"</td></tr>");
					});
				}// memberType1
			});//ajax()
		
		// 클릭 이벤트를 한번만하고 종료
// 		$(this).unbind();

	});//click()
				
		$('.btn2').click(function(){
// 			alert("클릭2");
	$('.memberList').html("");
	$('.memberList').append("<tr><th>번호</th><th>아이디</th><th>비밀번호</th><th>이름</th><th>닉네임</th><th>생년월일</th><th>성별</th><th>전화번호</th><th>이메일</th><th>회원유형</th></tr>");
			$.ajax({
				url:'listjson.me',
				// 파라미터없으면 생략
				data:{'memberType':$('#memberType2').val()},
				// 리턴한 데이터타입 지정
				dataType:'json',

				success:function(result){
					// result json데이터 형태로 가져오고
					// 반복시켜서 접근해서 => table 출력
					$.each(result, function(index, item){
						// class="memberList" 뒷부분에 추가하면서 출력
						$('.memberList').append("<tr><td>"+item.memberNum+"</td><td>"+item.memberId+"</td><td>"+item.memberPassword+"</td><td>"+
								item.memberName+"</td><td>"+item.memberNickname+"</td><td>"+item.memberBirthday+"</td><td>"+item.memberGender+"</td><td>"+
								item.memberPhoneNum+"</td><td>"+item.memberEmail+"</td><td>"+item.memberType+"</td></tr>");
					});
				}// memberType2
			});//ajax()
			
			// 클릭 이벤트를 한번만하고 종료
// 			$(this).unbind();

		});//click()
		
		// xml(extensible markup language)
		// 인터넷 웹페이지를 만드는 html을 획기적으로 개선하여 만든 언어
		// 디비에서 가져온 데이터를 태그형태로 데이터 표현
		// <members>
		//  <person><id>kim</id><pass>p123</pass><name>김길동</name></person>
		//  <person><id>lee</id><pass>p456</pass><name>이길동</name></person>
		// </members>
		
		// json(제이슨 : JavaScript Object Notation)
		// 웹과 컴퓨터 프로그램에서 용량이 적은 데이터를 교환하기 위해
		// 데이터 객체를 속성, 값의 쌍 형태로 표현하는 형식.
		// 자바스크립트() 토대로 개발되었다.
		// 디비에서 가져온 데이터를 '속성' : '값' 형태로 데이터 표현
		// [
		// {"id":"kim", "pass":"p123", "name":"김길동"},
		// {"id":"lee", "pass":"p123", "name":"이길동"},
		// {"id":"hong", "pass":"p123", "name":"홍길동"},
		// ]
		
		// 화면이 안바뀌면서 아이디 중복,아이디 사용가능 출력
		// join.me에서 idCheck.me 페이지로 갔다가 출력결과를 가지고
		// 다시와서 join.me 에서 결과 값을 출력
// 		ajax : 비동기식 자바스크립트 XML
//            (Asynchronous Javascript And XML)의 약자.

		
	});
</script>



</body>
</html>