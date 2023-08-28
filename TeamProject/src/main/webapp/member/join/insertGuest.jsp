<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- head -->
<head>
<meta charset="UTF-8">
<title>insertGuest.jsp</title>
</head> 

<!-- body -->
<body>
<h1>게스트 회원가입</h1>

<!-- form -->
<form action="insertProGuest.me" method="post" id="fr">

아이디 : <input type="text" name="id" id="id"> <input type="button" value="중복확인" name="idup" id="idup"><br>
	   <div id="div1"></div>
비밀번호 : <input type="password" name="pass" id="pass"><br>
		<div id="div2"></div>
비밀번호 확인 : <input type="password" name="pass2" id="pass2"><br>
		   <div id="div3"></div>
닉네임 : <input type="text" name="nick" id="nick"> <input type="button" value="중복확인" name="ndup" id="ndup"><br>
	   <div id="div4"></div>
이름 : <input type="text" name="name" id="name"> <br>
	  <div id="div5"></div>
생년월일 : <input type="date" name="birth" id="birth"><br>
		<div id="div6"></div>
성별 : <input type="radio" name="gender" value="남" id="gender1">남
      <input type="radio" name="gender" value="여" id="gender2">여<br>
      <div id="div7"></div>
전화번호 : <input type="text" name="phone1" id="phone1" maxlength="3" size="3">-<input type="text" name="phone2" id="phone2" maxlength="4" size="4">-<input type="text" name="phone3" id="phone3" maxlength="4" size="4"><br>
	    <div id="div8"></div>
이메일 : <input type="text" name="emailop1" id="emailop1">@<select name="emailop2" id="emailop2">
												   <option value="">이메일을 선택해주세요</option>
												   <option value="naver.com">naver.com</option>
												   <option value="gmail.com">gmail.com</option>
        							   		   	   </select><br>
        							   		   	   <div id="div9"></div>
지역 : <select name="address" id="address">
	 <option value="">지역을 선택해주세요</option>
	 <option value="Seoul">서울</option>
	 <option value="Busan">부산</option>
	 </select><br>
	 <div id="div10"></div>

<input type="checkbox" value="이용약관" id="agree">위 이용약관에 동의합니다. <a href="../join/agree.jsp">이용약관</a><br>
<div id="div12"></div>
<input type="button" value="회원가입" id="btn1">
</form>

<!-- script -->
<script type="text/javascript" src="script/jquery-3.7.0.js"></script>
<script type="text/javascript">

// 아이디 id
// 아이디 중복확인 idup
// 비밀번호 pass
// 비밀번호 확인 pass2
// 닉네임 nick
// 닉네임 중복확인 ndup
// 이름 name
// 생년월일 birth
// 성별 (남)gender1, (여)gender2
// 전화번호 phone1-phone2-phone3
// 이메일 email
// 이메일 선택 emailop
// 지역 address
// 사업자등록번호 bNum
// 이용약관 agree

$(document).ready(function(){
	// '회원가입' 버튼 클릭 시
	$('#btn1').click(function(){
		alert('#click');
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
		
// 		$('.idup').click(function(){
// // 			alert("클릭");
// 			$.ajax({
// 				url:'idCheck.me',
// 				// 파라미터이름 : val() 값
// 				data:{'id':$('.id').val()},
// 				success:function(result){
// // result 아이디 중복, 아이디 사용가능 결과 출력값 받아오는 변수
// //		          class="divdup" 안에 아이디 중복 값을 넣기
// 					$('.divdup').html(result);
// 				}
// 			});
		
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
			$('#nick').focus();
		}
			
		// 닉네임
		if($('#nick').val() == ""){
			$('#div4').html("닉네임을 입력해주세요").css("color","red");
			$('#nick').focus();
			return;
		}else {
			$('#div4').empty();
			$('#name').focus();
		}
		
// 		// 닉네임 중복확인
// 		$('.idup').click(function(){
// // 			alert("클릭");
// 			$.ajax({
// 				url:'idCheck.me',
// 				// 파라미터이름 : val() 값
// 				data:{'id':$('.id').val()},
// 				success:function(result){
// // result 아이디 중복, 아이디 사용가능 결과 출력값 받아오는 변수
// //		          class="divdup" 안에 아이디 중복 값을 넣기
// 					$('.divdup').html(result);
// 				}
// 			});
		
		// 이름
		if($('#name').val() == ""){
			$('#div5').html("이름을 입력해주세요").css("color","red");
			$('#name').focus();
			return false;
		}else {
			$('#div5').empty();
			$('#birth').focus();
		}
		
		// 생년월일
		if($('#birth').val() == ""){
			$('#div6').html("생년월일을 선택해주세요").css("color","red");
			$('#birth').focus();
			return false;
		}else {
			$('#div6').empty();
			$('#gender').focus();
		}
		
		// 성별
		if($('#gender1').is(':checked')==false && $('#gender2').is(':checked')==false){
			$('#div7').html("성별을 선택해주세요").css('color','red');
			return false;
		} else {
			$('#div7').empty();
			$('#phone1').focus();
		}
		
		// 전화번호
    	if($('#phone1').val().length != 3){
	    	$('#div8').html("전화번호를 확인해주세요").css("color","red"); 
			$('#phone1').focus();
			return false;
		}else if($('#phone2').val().length != 4){
	    	$('#div8').html("전화번호를 확인해주세요").css("color","red"); 
			$('#phone2').focus();
			return false;
		}else if($('#phone3').val().length != 4){
	    	$('#div8').html("전화번호를 확인해주세요").css("color","red"); 
			$('#phone3').focus();
			return false;
		}else {
			$('#div8').empty();
			$('#emailop1').focus();
		}
    	
    	// 이메일
		if($('#emailop1').val() == "" ){
			$('#div9').html("이메일을 입력해주세요").css("color","red"); 
			$('#emailop1').focus();
			return false;
		}else if($('#emailop2').val() == "" ){
			$('#div9').html("이메일을 선택해주세요").css("color","red"); 
			$('#emailop2').focus();
			return false;
		}else {
			$('#div9').empty();
			$('#address').focus();
		}
    	
		// 지역
		if($('#address').val() == "" ){
			$('#div10').html("지역을 선택해주세요").css("color","red"); 
			$('#address').focus();
			return false;
		}else {
			$('#div10').empty();
			$('#bNum').focus();
		}
		
		// 이용약관
		if($('#agree').prop('checked') == false ){
		    $('#div12').html("이용약관에 동의해주세요").css("color","red"); 
			return
		} else {
		    $('#div12').empty();
		}
		$('#fr').submit();
	});
});

	//아이디 중복확인
	$('#idup').click(function(){
		alert("클릭");
			$.ajax({
				url:'idCheck.me',
				// 파라미터이름 : val() 값
				data:{'memberId':$('#id').val()},
				success:function(result){
	// result 아이디 중복, 아이디 사용가능 결과 출력값 받아오는 변수
	//		          class="divdup" 안에 아이디 중복 값을 넣기
					$('#div1').html(result).css("color","blue");
				}
			});
	});

	$('#ndup').click(function(){
	alert("클릭");
		$.ajax({
			url:'nickCheck.me',
			// 파라미터이름 : val() 값
			data:{'memberNickname':$('#nick').val()},
			success:function(result){
				$('#div4').html(result).css("color","blue");
			}
		});
});

</script>
</body>
</html>