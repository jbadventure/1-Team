<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/newfile.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>member/join.jsp</title>

</head>
<body>  
<!-- 헤더들어가는 곳 -->
<jsp:include page="../../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 
  <h1>회원가입 유형 선택</h1>
    <button id="hostButton">호스트 계정 회원가입</button>
    <button id="guestButton">게스트 계정 회원가입</button>

    <script>
        // 컨트롤러 내에서 페이지 네비게이션을 관리하는 함수
        function navigateToPage(pageUrl) {
            window.location.href = pageUrl;
        }

        document.getElementById("hostButton").addEventListener("click", function() {
            navigateToPage("insertHost.me"); // 호스트 계정 회원가입 페이지로 이동
        });

        document.getElementById("guestButton").addEventListener("click", function() {
            navigateToPage("insertGuest.me"); // 게스트 계정 회원가입 페이지로 이동
        });
    </script>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>