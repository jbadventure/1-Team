<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- head --> 
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/newfile.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>insertHost.jsp</title>

<!-- ccs적용 -->
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <link rel="icon" href="images/favicon.ico?v=2" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Roboto:100,300,300i,400,500,600,700,900%7CRaleway:500">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/fonts.css">
    <link rel="stylesheet" href="css/style.css">
</head>

<!-- body -->
<body>

<!-- Header -->
<div class="preloader">
<!--       <div class="wrapper-triangle"> -->
<!--         <div class="pen"> -->
<!--           <div class="line-triangle"> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangle"></div> -->
<!--           </div> -->
<!--           <div class="line-triangle"> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangl																																																																																																																																																																																																	33333e"></div> -->
<!--             <div class="triangle"></div> -->
<!--           </div> -->
<!--           <div class="line-triangle"> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangle"></div> -->
<!--             <div class="triangle"></div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
    </div>

      <div class="page">
      <header class="section page-header">
        <!-- RD Navbar-->
        <div class="rd-navbar-wrap">
          <nav class="rd-navbar rd-navbar-modern" data-layout="rd-navbar-fixed" data-sm-layout="rd-navbar-fixed" data-md-layout="rd-navbar-fixed" data-md-device-layout="rd-navbar-fixed" data-lg-layout="rd-navbar-static" data-lg-device-layout="rd-navbar-fixed" data-xl-layout="rd-navbar-static" data-xl-device-layout="rd-navbar-static" data-xxl-layout="rd-navbar-static" data-xxl-device-layout="rd-navbar-static" data-lg-stick-up-offset="56px" data-xl-stick-up-offset="56px" data-xxl-stick-up-offset="56px" data-lg-stick-up="true" data-xl-stick-up="true" data-xxl-stick-up="true">
            <div class="rd-navbar-inner-outer">
              <div class="rd-navbar-inner">
                <!-- RD Navbar Panel-->
                <div class="rd-navbar-panel">
                  <!-- RD Navbar Toggle-->
                  <button class="rd-navbar-toggle" data-rd-navbar-toggle=".rd-navbar-nav-wrap"><span></span></button>
                  <!-- RD Navbar Brand-->
                  <div class="rd-navbar-brand"><a class="brand" href="index.html"><img class="brand-logo-dark" src="images/logo-198x66.png" alt="" width="198" height="66"/></a></div>
                </div>
                
                <%
                String memberId=(String)session.getAttribute("memberId");
                if(memberId == null)  {
                %>
                <div class="menu-search">
                	<div class="rd-nav-item"><a class="rd-nav-link" href="/TeamProject/noticeList.nbo" style="font-size:18px">공지사항</a></div>
                	<div class="rd-nav-item"><a class="rd-nav-link" href="/TeamProject/orderInfo.re">예약정보테스트</a></div>
                	<div class="rd-nav-item"><a class="rd-nav-link" href="/TeamProject/classList.cbo">클래스테스트</a></div>
                	<div class="rd-nav-item"><a class="rd-nav-link" href="/TeamProject/pay.pa">결제테스트</a></div>
                	<div class="rd-nav-item"><input type="search" placeholder="지금 생각나는 취미를 검색하세요." class="rd-nav-searchbar"></div>
                	<div class="rd-nav-item"><a class="rd-nav-link" href="/TeamProject/ghselect.me">회원가입</a></div>
                	<div class="rd-nav-item"><a class="rd-nav-link" href="/TeamProject/login.me" >로그인</a></div>
                </div>
                <%
                } else {
                %>
                <div class="menu-search">
                	<div class="rd-nav-item"><a class="rd-nav-link" href="/TeamProject/noticeList.nbo" style="font-size:18px">공지사항</a></div>
                	<div class="rd-nav-item"><a class="rd-nav-link" href="#">자주 묻는 질문</a></div>
                	<div class="rd-nav-item"><a class="rd-nav-link" href="/TeamProject/classList.cbo">클래스테스트</a></div>
                	<div class="rd-nav-item"><a class="rd-nav-link" href="/TeamProject/pay.pa">결제테스트</a></div>
                	<div class="rd-nav-item"><input type="search" placeholder="지금 생각나는 취미를 검색하세요." class="rd-nav-searchbar"></div>
                	<div class="rd-nav-item"><a class="rd-nav-link" href="/TeamProject/logout.me" >로그아웃</a></div>
                	<div class="rd-nav-item"><a class="rd-nav-link" href="/TeamProject/info.me">마이페이지</a></div>
                </div>
                <%
                }
                %>
              </div>
            </div>
          </nav>
        </div>
      </header>

<!-- contents -->
<h1 id="hostjoin">호스트 회원가입</h1>

<!-- form -->
<form action="insertProHost.me" method="post" id="frInsertHost">
<div id="InsertHostBox">
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
사업자등록번호 : <input type="text" name="bNum" id="bNum"><br>
			<div id="div11"></div>		
지역 : <select name="address" id="address">
	 <option value="">지역을 선택해주세요</option>
	 <option value="Seoul">서울</option>
	 <option value="Busan">부산</option>
	 </select><br>
	 <div id="div12"></div>

<input type="checkbox" value="이용약관" id="agree">위 이용약관에 동의합니다. <a href="../join/agree.jsp">이용약관</a><br>
<div id="div13"></div>
<input type="hidden" value="host" name="memberType" id="memberType">
<input type="button" value="회원가입" id="btn1">
</div>
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
// 이메일 emailop1
// 이메일 선택 emailop2
// 지역 address
// 사업자등록번호 bNum
// 이용약관 agree

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
			$('#bNum').focus();
		}
		
		// 사업자등록번호
		if($('#bNum').val() == "" ){
			$('#div11').html("사업자등록번호를 입력해주세요").css("color","red");
			$('#bNum').focus();
			return false;
		} else{
			$('#div11').empty();
			$('#address').focus()
		}
		
		//지역
		if($('#address').val() == "" ){
			$('#div12').html("지역을 선택해주세요").css("color","red"); 
			$('#address').focus();
			return false;
		}else {
			$('#div12').empty();
		}
		
		// 이용약관
		if($('#agree').prop('checked') == false ){
		    $('#div13').html("이용약관에 동의해주세요").css("color","red"); 
			return
		} else {
		    $('#div13').empty();
		}
		$('#frInsertHost').submit();
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

<!-- Footer-->
      <footer class="section footer-modern context-dark footer-modern-2">
        <div class="footer-modern-line">
          <div class="container">
             대표 : 홍길동<br>
             주소 : 아이티윌 부산교육센터<br>
			 제휴/제휴 : contact@palette.com<br><br>
			 
             고객센터<br>
             호스트 : 051-1234-5678<br>
             게스트 : 051-1234-5679<br>
             (평일 09:00-17:00, 점심 12:00-13:00)<br>
          </div>
        </div>
      </footer>
   
	<!-- 뭔지 모르겠음 -->
    <!-- Global Mailform Output-->
    <div class="snackbars" id="form-output-global"></div>
    <!-- Javascript-->
    <script src="js/core.min.js"></script>
    <script src="js/script.js"></script>
    <!-- coded by Himic-->
</body>
</html>