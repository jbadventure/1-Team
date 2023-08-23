<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- head -->
<head>
<meta charset="UTF-8">
<title>join3.jsp</title>
</head>

<!-- body -->
<body>
<h1>호스트 회원가입</h1>

<!-- form -->
<form action="test1.html" method="get" id="fr">


아이디 : <input type="text" name="id" id="id"><br>
	   <div id="div1"></div>
비밀번호 : <input type="password" name="pass" id="pass"><br>
		<div id="div2"></div>
비밀번호 확인 : <input type="password" name="pass2" id="pass2"><br>
		   <div id="div3"></div>
이름 : <input type="text" name="name" id="name"><br>
	  <div id="div4"></div>
생년월일 : <input type="date" name="birth" id="birth"><br>
		<div id="div5"></div>
전화번호 : <input type="text" name="phone1" id="phone1" maxlength="3" size="3">-<input type="text" name="phone2" id="phone2" maxlength="4" size="4">-<input type="text" name="phone3" id="phone3" maxlength="4" size="4"><br>
	    <div id="div6"></div>
이메일 : <input type="text" name="email" id="email">@<select name="emailop" id="emailop">
												   <option value="">이메일을 선택해주세요</option>
												   <option value="naver">naver.com</option>
												   <option value="gmail">gmail.com</option>
        							   		   	   </select><br>
        							   		   	   <div id="div7"></div>
지역 : <select name="address" id="address">
	 <option value="">지역을 선택해주세요</option>
	 <option value="Seoul">서울</option>
	 <option value="Busan">부산</option>
	 </select><br>
	 <div id="div8"></div>

<input type="button" value="회원가입" id="btn1">
</form>

<!-- script -->
<script type="text/javascript" src="jquery-3.7.0.js"></script>
<script type="text/javascript">

// 아이디 id
// 비밀번호 pass
// 비밀번호 확인 pass2
// 이름 name
// 생년월일 birth
// 전화번호 phone1-phone2-phone3
// 이메일 email
// 이메일 선택 emailop
// 지역 address

$(document).ready(function(){
	// '회원가입' 버튼 클릭 시
	$('#btn1').click(function(){
		
		// 아이디
		// 값이 없다면
		if($('#id').val() == ""){
			// 아이디 밑 idiv 공간에 빨간글씨로 출력
			$('#div1').html("아이디를 입력해주세요").css("color","red");
			// 아이디 포커스
			$('#id').focus();
			return;
		}
		// 4글자 미만, 20글자 초과일 경우 
		else if($('#id').val().length<4 || $('#id').val().length>20) {
		    $('#div1').html("4자~20자 입력하세요").css("color", "red"); 
		    $('#id').focus();
		    return;
		}else {
			// div1 공간 내용 지우기
			$('#div1').empty();
			// 모든조건 충족했으므로 다음 비밀번호 포커스
			$('#pass').focus();
		}
		
		// 비밀번호
		if($('#pass').val() == ""){
			$('#div2').html("비밀번호를 입력해주세요").css("color","red");
			$('#pass').focus();
			return;
		}else if($('#pass').val().length<4 || $('#id').val().length>16){
			$('#div2').html("4자~16자로 입력해주세요").css("color","red"); 
			$('#pass').focus();
			return;
		}else {
			$('#div2').empty();
			$('#pass2').focus();
		}
		
		// 비밀번호 확인
		if($('#pass2').val() != $('#pass').val()){
			$('#div3').html("비밀번호가 일치하지 않습니다").css("color","red");
			$('#pass2').focus();
			return;
		}else {
			$('#div3').empty();
			$('#name').focus();
		}
		
		// 이름
		if($('#name').val() == ""){
			$('#div4').html("이름을 입력해주세요").css("color","red");
			$('#name').focus();
			return;
		}else {
			$('#div4').empty();
			$('#birth').focus();
		}
		
		// 생년월일
		if($('#birth').val() == ""){
			$('#div5').html("생년월일을 선택해주세요").css("color","red");
			$('#birth').focus();
			return;
		}else {
			$('#div5').empty();
			$('#phone1').focus();
		}
		
		// 전화번호
    	if($('#phone1').val().length != 3){
	    	$('#div6').html("전화번호를 확인해주세요").css("color","red"); 
			$('#phone1').focus();
			return;
		}else if($('#phone2').val().length != 4){
	    	$('#div6').html("전화번호를 확인해주세요").css("color","red"); 
			$('#phone2').focus();
			return;
		}else if($('#phone3').val().length != 4){
	    	$('#div6').html("전화번호를 확인해주세요").css("color","red"); 
			$('#phone3').focus();
			return;
		}else {
			$('#div6').empty();
			$('#email').focus();
		}
    	
    	// 이메일
		if($('#email').val() == "" ){
			$('#div7').html("이메일을 입력해주세요").css("color","red"); 
			$('#email').focus();
			return;
		}else if($('#emailop').val() == "" ){
			$('#div7').html("이메일을 선택해주세요").css("color","red"); 
			$('#emailop').focus();
			return;
		}else {
			$('#div7').empty();
			$('#address').focus();
		}
    	
		// 지역
		if($('#address').val() == "" ){
			$('#div8').html("지역을 선택해주세요").css("color","red"); 
			$('#address').focus();
			return;
		}else {
			$('#div8').empty();
			$('#bNum').focus();
		}
		$('#fr').submit();
	});
});
</script>
</body>
</html>