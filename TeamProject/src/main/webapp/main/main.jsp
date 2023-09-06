<%@page import="com.itwillbs.domain.ClassBoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.itwillbs.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html> 
<head>
<title>palette</title>
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <link rel="icon" href="images/favicon.ico?v=2" type="image/x-icon">
    <!-- Stylesheets-->
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Roboto:100,300,300i,400,500,600,700,900%7CRaleway:500">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/fonts.css">
    <link rel="stylesheet" href="css/style.css">
    <!--[if lt IE 10]>
    <div style="background: #212121; padding: 10px 0; box-shadow: 3px 3px 5px 0 rgba(0,0,0,.3); clear: both; text-align:center; position: relative; z-index:1;"><a href="http://windows.microsoft.com/en-US/internet-explorer/"><img src="images/ie8-panel/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."></a></div>
    <script src="js/html5shiv.min.js"></script>
    <![endif]-->
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
    
    
    <div class="page">
    
      <!-- Page Header-->
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
                List<ClassBoardDTO> boardList =(List<ClassBoardDTO>)request.getAttribute("boardList");
                MemberDTO memberDTO=(MemberDTO)request.getAttribute("memberDTO");
                String memberId=(String)session.getAttribute("memberId");
                if(memberId == null)  {
                %> 
                <div class="menu-search">
                	<div class="rd-nav-item-notice"><a class="rd-nav-link" href="/TeamProject/noticeList.nbo" style="font-size:18px">공지사항</a></div>
                	<div class="rd-nav-item-QA"><a class="rd-nav-link" href="/TeamProject/questionList.qbo">Q&A</a></div>
                	<div class="rd-nav-item-category"><a class="rd-nav-link" href="/TeamProject/classList.cbo">카테고리</a></div>
<!--                 	<div class="rd-nav-item"><a class="rd-nav-link" href="/TeamProject/pay.pa">결제테스트</a></div> -->
                	<div id="table_search">
					<form action="listSearch.cbo" method="get">
					<input type="text" name="search" class="search" placeholder="지금 생각나는 취미를 검색하세요!">
					<input type="submit" value="검색" class="btn">
					</form>
					</div>
                	<div class="rd-nav-item-join"><a class="rd-nav-link" href="/TeamProject/ghselect.me">회원가입</a></div>
                	<div class="rd-nav-item-login"><a class="rd-nav-link" href="/TeamProject/login.me" >로그인</a></div>
                </div>
                <%
                }else if(memberDTO.getMemberId().equals("admin")){
                %>
                 <div class="menu-search">
                	<div class="rd-nav-item-notice"><a class="rd-nav-link" href="/TeamProject/noticeList.nbo" style="font-size:18px">공지사항</a></div>
                	<div class="rd-nav-item-QA"><a class="rd-nav-link" href="/TeamProject/questionList.qbo">Q&A</a></div>
                	<div class="rd-nav-item-category"><a class="rd-nav-link" href="/TeamProject/classList.cbo">카테고리</a></div>
<!--                 	<div class="rd-nav-item"><a class="rd-nav-link" href="/TeamProject/pay.pa">결제테스트</a></div> -->
                	<form action="listSearch.cbo" method="get">
					<input type="text" name="search" class="search" placeholder="지금 생각나는 취미를 검색하세요!">
					<input type="submit" value="검색" class="btn">
					</form>
                	<div class="rd-nav-item-logout"><a class="rd-nav-link" href="/TeamProject/logout.me" >로그아웃</a></div>
                	<div class="rd-nav-item-info"><a class="rd-nav-link" href="/TeamProject/memberList.me">회원목록</a></div>
                <%
                } else {
                %>
                <div class="menu-search"> 
                	<div class="rd-nav-item-notice"><a class="rd-nav-link" href="/TeamProject/noticeList.nbo" style="font-size:18px">공지사항</a></div>
                	<div class="rd-nav-item-QA"><a class="rd-nav-link" href="/TeamProject/questionList.qbo">Q&A</a></div>
                	<div class="rd-nav-item-category"><a class="rd-nav-link" href="/TeamProject/classList.cbo">카테고리</a></div>
<!--                 	<div class="rd-nav-item"><a class="rd-nav-link" href="/TeamProject/pay.pa">결제테스트</a></div> -->
                	<form action="listSearch.cbo" method="get">
					<input type="text" name="search" class="search" placeholder="지금 생각나는 취미를 검색하세요!">
					<input type="submit" value="검색" class="btn">
					</form>
                	<div class="rd-nav-item-logout"><a class="rd-nav-link" href="/TeamProject/logout.me" >로그아웃</a></div>
                	<div class="rd-nav-item-info"><a class="rd-nav-link" href="/TeamProject/info.me">마이페이지</a></div>
                </div>
                <%
                }
                %>
                <!-- <ul class="menu-search">
                      <li class="rd-nav-item active" style="padding:1px 50px"><a class="rd-nav-link" href="index.html" style="font-size:18px; padding:32px 50px">공지사항</a>
                      </li>
                      <li class="rd-nav-item"><a class="rd-nav-link" href="about-us.html" style="font-size:18px">자주 묻는 질문</a>
                      </li>
                      <li class="rd-nav-search"><input type="search" placeholder="지금 생각나는 취미를 검색하세요." class="rd-nav-searchbar">
                      </li>
                      <li class="rd-nav-item"><a class="rd-nav-link" href="typography.html" style="font-size:13px">회원가입</a>
                      </li>
                      <li class="rd-nav-item"><a class="rd-nav-link" href="contacts.html" style="font-size:13px">로그인</a>
                      </li>
                      <li class="rd-nav-item"><a class="rd-nav-link" href="contacts.html" style="font-size:13px">마이페이지</a>
                      </li>
                </ul> -->
                <!-- <div class="rd-navbar-right rd-navbar-nav-wrap">
                  <div class="rd-navbar-main">
                    RD Navbar Nav
                    <ul class="rd-navbar-nav">
                      <li class="rd-nav-item active"><a class="rd-nav-link" href="index.html">Home</a>
                      </li>
                      <li class="rd-nav-item"><a class="rd-nav-link" href="about-us.html">About us</a>
                      </li>
                      <li class="rd-nav-item"><a class="rd-nav-link" href="typography.html">Typography</a>
                      </li>
                      <li class="rd-nav-item"><a class="rd-nav-link" href="contacts.html">Contacts</a>
                      </li>
                    </ul>
                  </div>
                </div> -->
                
              </div> <!-- inner -->
            </div>
          </nav>
        </div>
      </header>
      
      <!-- Swiper-->
      <section class="section swiper-container swiper-slider swiper-slider-2 swiper-slider-3" data-loop="true" data-autoplay="5000" data-simulate-touch="false" data-slide-effect="fade">
        <div class="swiper-wrapper text-sm-left">
          <div class="swiper-slide context-dark" data-slide-bg="images/wine.jpg">
            <div class="swiper-slide-caption section-md">
              <div class="container">
                <div class="row">
                  <div class="col-sm-9 col-md-8 col-lg-7 col-xl-7 offset-lg-1 offset-xxl-0">
                    <h1 class="oh swiper-title"><span class="d-inline-block" data-caption-animate="slideInUp" data-caption-delay="0">한 여름밤의 와인, 그리고 설레는 만남</span></h1>
                    <p class="big swiper-text" data-caption-animate="fadeInLeft" data-caption-delay="300">당신의 여름이 특별해집니다</p>
<!--                     <a class="button button-lg button-primary button-winona button-shadow-2" href="#" data-caption-animate="fadeInUp" data-caption-delay="300">View our menu</a> -->
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="swiper-slide context-dark" data-slide-bg="images/festival.jpg">
            <div class="swiper-slide-caption section-md">
              <div class="container">
                <div class="row">
                  <div class="col-sm-8 col-lg-7 offset-lg-1 offset-xxl-0">
                  
					<!-- 타이틀 멘트 -->
                    <h1 class="oh swiper-title"><span class="d-inline-block" data-caption-animate="slideInDown" data-caption-delay="0">몸부림은 이제 그만! 댄스 클래스</span></h1>
                    <p class="big swiper-text" data-caption-animate="fadeInRight" data-caption-delay="300">페스티벌의 계절, 바운스라도 배울까</p>
                    <div class="button-wrap oh">
<!--                     <a class="button button-lg button-primary button-winona button-shadow-2" href="#" data-caption-animate="slideInUp" data-caption-delay="0">View our menu</a></div> -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Swiper Pagination-->
        <div class="swiper-pagination" data-bullet-custom="true"></div>
        <!-- Swiper Navigation-->
<!--         <div class="swiper-button-prev"> -->
<!--           <div class="preview"> -->
<!--             <div class="preview__img"></div> -->
<!--           </div> -->
<!--           <div class="swiper-button-arrow"></div> -->
<!--         </div> -->
<!--         <div class="swiper-button-next"> -->
<!--           <div class="swiper-button-arrow"></div> -->
<!--           <div class="preview"> -->
<!--             <div class="preview__img"></div> -->
<!--           </div> -->
<!--         </div> -->
      </section>
      <!-- What We Offer-->
      <section class="section section-md bg-default">
        <div class="container">
          <h3 class="oh-desktop"><span class="d-inline-block wow slideInDown">Our Class</span></h3>
          <div class="row row-md row-30">
            <div class="col-sm-6 col-lg-4">
              <div class="oh-desktop">
                <!-- Services Terri-->
                <article class="services-terri wow slideInUp">
                  <div class="services-terri-figure"><img src="images/menu-1-370x278.jpg" alt="" width="370" height="278"/>
                  </div>
                  <div class="services-terri-caption">
<!--                   <span class="services-terri-icon linearicons-leaf"></span> -->
                    <h5 class="services-terri-title"><a href="#">요리</a></h5>
                  </div>
                </article>
              </div>
            </div>
            <div class="col-sm-6 col-lg-4">
              <div class="oh-desktop">
                <!-- Services Terri-->
                <article class="services-terri wow slideInDown">
                  <div class="services-terri-figure"><img src="images/menu-2-370x278.jpg" alt="" width="370" height="278"/>
                  </div>
                  <div class="services-terri-caption">
<!--                   <span class="services-terri-icon linearicons-pizza"></span> -->
                    <h5 class="services-terri-title"><a href="#">수공예</a></h5>
<!--                   </div> -->
                </article>
              </div>
            </div>
            <div class="col-sm-6 col-lg-4">
              <div class="oh-desktop">
                <!-- Services Terri-->
                <article class="services-terri wow slideInUp">
                  <div class="services-terri-figure"><img src="images/menu-3-370x278.jpg" alt="" width="370" height="278"/>
                  </div>
                  <div class="services-terri-caption">
<!--                   <span class="services-terri-icon linearicons-hamburger"></span> -->
                    <h5 class="services-terri-title"><a href="#">액티비티</a></h5>
                  </div>
                </article>
              </div>
            </div>
<!--             <div class="col-sm-6 col-lg-4"> -->
<!--               <div class="oh-desktop"> -->
<!--                 Services Terri -->
<!--                 <article class="services-terri wow slideInDown"> -->
<!--                   <div class="services-terri-figure"><img src="images/menu-4-370x278.jpg" alt="" width="370" height="278"/> -->
<!--                   </div> -->
<!--                   <div class="services-terri-caption"><span class="services-terri-icon linearicons-ice-cream"></span> -->
<!--                     <h5 class="services-terri-title"><a href="#">Desserts</a></h5> -->
<!--                   </div> -->
<!--                 </article> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="col-sm-6 col-lg-4"> -->
<!--               <div class="oh-desktop"> -->
<!--                 Services Terri -->
<!--                 <article class="services-terri wow slideInUp"> -->
<!--                   <div class="services-terri-figure"><img src="images/menu-5-370x278.jpg" alt="" width="370" height="278"/> -->
<!--                   </div> -->
<!--                   <div class="services-terri-caption"><span class="services-terri-icon linearicons-coffee-cup"></span> -->
<!--                     <h5 class="services-terri-title"><a href="#">Drinks</a></h5> -->
<!--                   </div> -->
<!--                 </article> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="col-sm-6 col-lg-4"> -->
<!--               <div class="oh-desktop"> -->
<!--                 Services Terri -->
<!--                 <article class="services-terri wow slideInDown"> -->
<!--                   <div class="services-terri-figure"><img src="images/menu-6-370x278.jpg" alt="" width="370" height="278"/> -->
<!--                   </div> -->
<!--                   <div class="services-terri-caption"><span class="services-terri-icon linearicons-steak"></span> -->
<!--                     <h5 class="services-terri-title"><a href="#">Seafood</a></h5> -->
<!--                   </div> -->
<!--                 </article> -->
<!--               </div> -->
<!--             </div> -->
          </div>
        </div>
      </section>
      
      <!-- Page Footer-->
      <footer class="section footer-modern context-dark footer-modern-2">
        <div class="footer-modern-line">
          <div class="container">
<!--             <div class="row row-50"> -->
             대표 : 홍길동<br>
             주소 : 아이티윌 부산교육센터<br>
			 제휴/제휴 : contact@palette.com<br><br>
			 
             고객센터<br>
             호스트 : 051-1234-5678<br>
             게스트 : 051-1234-5679<br>
             (평일 09:00-17:00, 점심 12:00-13:00)<br>
<!--             </div> -->
          </div>
        </div>
      </footer>
   
    <!-- Global Mailform Output-->
    <div class="snackbars" id="form-output-global"></div>
    <!-- Javascript-->
    <script src="js/core.min.js"></script>
    <script src="js/script.js"></script>
    <!-- coded by Himic-->
</body>
</html>