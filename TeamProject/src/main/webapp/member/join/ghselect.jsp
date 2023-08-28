<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/join.jsp</title>
</head>
<body>   
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
</body>
</html>