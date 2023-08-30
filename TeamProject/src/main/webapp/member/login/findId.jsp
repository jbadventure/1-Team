<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/newfile.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 
<h1>아이디찾기</h1>

<!-- form -->
<form action="findIdPro.me" method="post"  id="checkForm">
<input type="text" placeholder="이름" name="memberName"><br>
<input type="text" placeholder="이메일" name="memberEmail">
<div id="div1"></div>
 
 <input type="submit" value="찾기" id="find">
</form>

<!-- script -->
<script type="text/javascript" src="../../script/jquery-3.7.0.js"></script>
<script type="text/javascript">

// 이름 name
// 이메일 email

// $(document).ready(function(){
// 	$('#checkForm').submit(function(){
// 		// 이름
// 		// 값이 없다면
//  		if($('#name').val() ==""){
// 			// 이름 밑 div 공간에 빨간글씨로 출력
// 			$('#div1').html("아이디를 입력해주세요").css("color","red");
// 			// 이름 포커스
// 			$('#name').focus();
// 			return false;
// 		} else {
// 			// div1 공간 내용 지우기
// 			$('#div1').empty();
// 			// 모든조건 충족했으므로 다음 포커스
// 			$('#email').focus();
// 		} 
//  		if($('#email').val() ==""){
// 			$('#div1').html("이메일을 입력해주세요").css("color","red"); 
// 			$('#email').focus();
// 			return false;
// 		}else if($('#emailop').val() ==""){
// 			$('#div1').html("이메일을 선택해주세요").css("color","red"); 
// 			$('#emailop').focus();
// 			return false;
// 		}else if ($()){
			
// 			//	$('#div1').html("회원정보가 일치하지 않습니다").css("color","red"); 
// 			//}
// 		} else {
			
// 			// return;
// 			}
// 		}
// 	});
// }); 


</script>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->

</body>
</html>