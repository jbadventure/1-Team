<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>계정삭제</h2>
<form action="deletePro.me" id=delete method="post">
<section>
<input type = "text" name="memberId" class="memberId" placeholder="아이디"><br>
<input type = "password" name="memberPassword" class="memberPassword" placeholder="비밀번호"><br>
</section>

<section>
<input type="submit" value="삭제" class="submit">
<input type="reset" value="취소" class="cancel">
</section>
</form>
<script type="text/javascript" src="script/jquery-3.7.0.js"></script>
<script type="text/javascript">    
$(document).ready(function(){
	// 버튼 클릭시
	$('#btn').click(function(){
		alert("계정이 삭제되었습니다")
		$('#fr').submit();
	}
	}
</script>
</body>
</html>