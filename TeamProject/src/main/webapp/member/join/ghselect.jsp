<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<title>palette</title>
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

<body>
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
    
      <!-- Header -->
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
	<div id="joinbutton">
    <h1 id="joinbuttonh1">회원가입 유형 선택</h1>
    </div>
    
    <div id="joinbutton2">
    <button id="hostButton">호스트 계정 회원가입</button>
    <button id="guestButton">게스트 계정 회원가입</button>
    </div>

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