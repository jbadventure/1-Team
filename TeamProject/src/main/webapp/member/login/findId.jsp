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
<form action="idReportPro.me" method="post"  id="checkForm">
이름 : <input type="text" name="memberName"><br>
이메일 : <input type="text" name="emailop1" id="emailop1">@<select name="emailop2" id="emailop2">
												   <option value="">이메일을 선택해주세요</option>
												   <option value="naver.com">naver.com</option>
												   <option value="gmail.com">gmail.com</option>
        							   		   	   </select><br>
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
// 			//https://chicken-tender-2019.tistory.com/126 참고하여 내일 수정하겠습니다.
// 		} else {
			
// 			// return;
// 			}
// 		}
// 	});
// }); 


</script>

</body>
</html>

</body>
</html>