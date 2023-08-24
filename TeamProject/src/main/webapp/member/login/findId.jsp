<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>아이디찾기</h1>

<!-- form -->
<form action="idCheck.me" method="post" id="checkForm">
아이디 : <input type="text" name="id" id="id"><br>
이메일 : <input type="text" name="email" id="email">@<select name="emailop" id="emailop">
												   <option value="">이메일을 선택해주세요</option>
												   <option value="naver">naver.com</option>
												   <option value="gmail">gmail.com</option>
        							   		   	   </select><br>
<div id="div1"></div>
 
 <input type="submit" value="찾기" id="find">
 <input type="button" value="취소" >
</form>

<!-- script -->
<script type="text/javascript" src="../../script/jquery-3.7.0.js"></script>
<script type="text/javascript">

//아이디 id
// 이메일 email

$(document).ready(function(){
	$('#checkForm').submit(function(){
		// 아이디
		// 값이 없다면
 		if($('#id').val() ==""){
			// 아이디 밑 div 공간에 빨간글씨로 출력
			$('#div1').html("아이디를 입력해주세요").css("color","red");
			// 아이디 포커스
			$('#id').focus();
			return false;
		} else {
			// div1 공간 내용 지우기
			$('#div1').empty();
			// 모든조건 충족했으므로 다음 포커스
			$('#email').focus();
		} 
 		if($('#email').val() ==""){
			$('#div1').html("이메일을 입력해주세요").css("color","red"); 
			$('#email').focus();
			return false;
		}else if($('#emailop').val() ==""){
			$('#div1').html("이메일을 선택해주세요").css("color","red"); 
			$('#emailop').focus();
			return false;
		}else {
		}
	});
});
</script>

</body>
</html>

</body>
</html>