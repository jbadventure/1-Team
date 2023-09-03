<%@page import="com.itwillbs.domain.OrdersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<style type="text/css">
  
<!--배경css--> 
  .navbar{
    height: 60px;
    padding-left: 30px;
    padding-right: 30px;
}
.hero-header{
    height: 450px;
    background-image: url("images/wine.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center center;
    }
.navbar #logo{
    line-height: 60px;
}
.navbar #menu{
    float: right;
    list-style-type: none;
    padding: 0;
    margin: 0;
}
.navbar #menu li{
    float: left;
    margin-left: 50px;
    line-height: 60px;
}
.navbar #menu li a{
    color: #545454;
    font-size: 13px;
    text-decoration: none;
}
.product-content{
    width: 735px;
    margin-left: auto;
    margin-right: auto;
}
.products h3{
    font-size: 24px;
    color: #545454;
    margin-top:60px;
    margin-bottom: 60px;
    text-align: center;
}
.products h4{
    font-size: 24px;
    color: #545454;
    margin-top:15px;
    margin-bottom: 15px;
    text-align: center;
}
.product{
    display: block;
    width: 225px;
    text-align: center;
    text-decoration:none;
    color: black;
    float:left;
    margin-left: 10px;
    margin-right: 10px;
    margin-bottom: 30px;
}
.product-name{
    margin-top: 20px;
    margin-bottom: 4px;
}
.clearfix{
    clear: both;
}
.footer{
    text-align: center;
    margin-top: 40px;
    margin-bottom: 40px;
}
.footer a{
    margin-left: 10px;
    margin-right: 10px;
    text-decoration:none;
}
<!--탭css -->
ul.tabs{
  margin: 0px;
  padding: 0px;
  list-style: none;
}
ul.tabs li{
  background: none;
  color: #222;
  display: inline-block;
  padding: 10px 15px;
  cursor: pointer;
}
ul.tabs li.current{
  background: #ededed;
  color: #222;
}
.tab-content{
  display: none;  
  padding: 15px 0;
  border-top:3px solid #eee;
}
.tab-content.current{
  display: inherit;
}
<!--모달창 css-->
* {
  padding:0;
  margin:0;
  box-sizing: border-box;
}
#btnWrap {
  width: 500px;
  margin: 100px auto;
}
#popupBtn {
  width: 150px;
  height: 50px;
  padding: 10px 5px;
}
#modalWrap {
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  display: none;
}
#modalBody {
  width: 500px;
  height: 300px;
  padding: 30px 30px;
  margin: 0 auto;
  border: 1px solid #777;
  background-color: #fff;
}
#closeBtn {
  float:right;
  font-weight: bold;
  color: #777;
  font-size:15px;
  cursor: pointer;
}
 </style>
  <meta charset="utf-8">
  <link rel="stylesheet" href="shopcss.css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">

<body>


    <div class="navbar">
        <a href="main.me" id="logo"><!--로고-->
            <img src="images/logo-198x66.png" height="60">
        </a>

        <ul id="menu"><!--상단우측-->
            <li><a href="#"><b>Contact</b></a></li>
            <li><a href="#"><b>Login</b></a></li>
        </ul>
    </div>

    <div class="hero-header"></div>

    <div class="products">
        
<h3>결제</h3> 
 <%
String memberId = (String)session.getAttribute("memberId");
// request.setCharacterEncoding("utf-8");
// String classFile = request.getParameter("classFile"); // 전달
// String classSubject = request.getParameter("classSubject");
// String classPrice = request.getParameter("classPrice");
// String reservationDate = request.getParameter("reservationDate");
// String reservationAmount = request.getParameter("reservationAmount");
OrdersDTO ordersDTO = (OrdersDTO)request.getAttribute("ordersDTO"); 
String classFile = (String)session.getAttribute("classFile");
String classSubject = (String)session.getAttribute("classSubject");
int classPrice = (int)session.getAttribute("classPrice");
// int reservationAmount = (int)session.getAttribute("reservationAmount");
// int payPrice = classPrice*reserveDTO.getReservationAmount();
//int classNum = ()

%>
 
<form action="payPro.or" method="post" id="myfr">
<fieldset style="border:0">
<legend>팔레트정보</legend>
<table>
<tr><td>
    <%      
      		if(classFile == null){
     %>
                <img src="images/logo-198x66.png" width="107" height="71">
     <%		}else{
     %>           
            	<img src="upload/<%=classFile %>" width="107" height="71">
     <%			 }
     %>
</td></tr> 
<tr><td>클래스제목 <%=classSubject %></td></tr>
<tr><td>예약날짜 <%=ordersDTO.getOrdersDate() %></td></tr>
<tr><td>예약인원 <%=ordersDTO.getOrdersAmount() %></td></tr>

</table>
</fieldset>

<fieldset style="border:0">
<legend>결제수단</legend>
<input type="radio" name="payMethod" id="card" value="card">신용/체크카드<br>
<input type="radio" name="payMethod" id="kakaopay" value="kakaopay" checked>카카오페이<br>
<input type="radio" name="payMethod" id="deposit" value="deposit">무통장입금<br>
</fieldset>

<legend>총 결제금액 <%=ordersDTO.getTotalPrice() %></legend>

<input type="button" value="결제하기" id="btn">
</form>

<script type="text/javascript">

$(document).ready(function() {
// alert("시작");	

	$('#btn').click(function() {
		alert($('input[name=payMethod]:checked').val());
	
	
	    if($('input[name=payMethod]:checked').val() == "kakaopay") {
	        var IMP = window.IMP; // 생략가능
	        IMP.init('imp42834230'); // 가맹점 식별코드
	        IMP.request_pay({
	            pg: 'kakaopay', // version 1.1.0부터 지원.
	            pay_method: 'card',
	            /* 
	                'samsung':삼성페이, 
	                'card':신용카드, 
	                'trans':실시간계좌이체,
	                'vbank':가상계좌,
	                'phone':휴대폰소액결제 
	            */
	            merchant_uid: 'merchant_' + new Date().getTime(),
	            /* 
	                merchant_uid에 경우 
	                https://docs.iamport.kr/implementation/payment
	                위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
	                참고하세요. 
	                나중에 포스팅 해볼게요.
	             */
	            name: '<%=classSubject %>', //결제창에서 보여질 이름
	            amount: 100, //가격 
	            buyer_email: 'iamport@siot.do',
	            buyer_name: '구매자이름',
	            buyer_tel: '010-1234-5678',
	            buyer_addr: '서울특별시 강남구 삼성동',
	            buyer_postcode: '123-456',
	            m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	            /*  
	                모바일 결제시,
	                결제가 끝나고 랜딩되는 URL을 지정 
	                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
	                */
	        }, function (rsp) {
	            console.log(rsp);
	            if (rsp.success) {
	                var msg = '결제가 완료되었습니다.';
	                msg += '고유ID : ' + rsp.imp_uid;
	                msg += '상점 거래ID : ' + rsp.merchant_uid;
	                msg += '결제 금액 : ' + rsp.paid_amount;
	                msg += '카드 승인번호 : ' + rsp.apply_num;
		            alert(msg);
					$('#myfr').submit();
	            } else {
	                var msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
		            alert(msg);
	                return;
	            }
	        	
	        });
		}// kakaopay
	    
	    if($('input[name=payMethod]:checked').val() == "card") {
	        var IMP = window.IMP; // 생략가능
	        IMP.init('imp42834230'); // 가맹점 식별코드
	        IMP.request_pay({
	            pg: 'html5_inicis', // version 1.1.0부터 지원.
	            pay_method: 'card',
	            /* 
	                'samsung':삼성페이, 
	                'card':신용카드, 
	                'trans':실시간계좌이체,
	                'vbank':가상계좌,
	                'phone':휴대폰소액결제 
	            */
	            merchant_uid: 'merchant_' + new Date().getTime(),
	            /* 
	                merchant_uid에 경우 
	                https://docs.iamport.kr/implementation/payment
	                위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
	                참고하세요. 
	                나중에 포스팅 해볼게요.
	             */
	            name: '<%=classSubject %>', //결제창에서 보여질 이름
	            amount: 100, //가격 
	            buyer_email: 'iamport@siot.do',
	            buyer_name: '구매자이름',
	            buyer_tel: '010-1234-5678',
	            buyer_addr: '서울특별시 강남구 삼성동',
	            buyer_postcode: '123-456',
	            m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	            /*  
	                모바일 결제시,
	                결제가 끝나고 랜딩되는 URL을 지정 
	                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
	                */
	        }, function (rsp) {
	            console.log(rsp);
	            if (rsp.success) {
	                var msg = '결제가 완료되었습니다.';
	                msg += '고유ID : ' + rsp.imp_uid;
	                msg += '상점 거래ID : ' + rsp.merchant_uid;
	                msg += '결제 금액 : ' + rsp.paid_amount;
	                msg += '카드 승인번호 : ' + rsp.apply_num;
		            alert(msg);
					$('#myfr').submit();
	            } else {
	                var msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
		            alert(msg);
	                return;
	            }
	        	
	        });
		}// card

	    if($('input[name=payMethod]:checked').val() == "deposit") {
	        var IMP = window.IMP; // 생략가능
	        IMP.init('imp42834230'); // 가맹점 식별코드
	        IMP.request_pay({
	            pg: 'kicc', // version 1.1.0부터 지원.
	            pay_method: 'trans',
	            /* 
	                'samsung':삼성페이, 
	                'card':신용카드, 
	                'trans':실시간계좌이체,
	                'vbank':가상계좌,
	                'phone':휴대폰소액결제 
	            */
	            merchant_uid: 'merchant_' + new Date().getTime(),
	            /* 
	                merchant_uid에 경우 
	                https://docs.iamport.kr/implementation/payment
	                위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
	                참고하세요. 
	                나중에 포스팅 해볼게요.
	             */
	            name: '<%=classSubject %>', //결제창에서 보여질 이름
	            amount: 100, //가격 
	            buyer_email: 'iamport@siot.do',
	            buyer_name: '구매자이름',
	            buyer_tel: '010-1234-5678',
	            buyer_addr: '서울특별시 강남구 삼성동',
	            buyer_postcode: '123-456',
	            m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	            /*  
	                모바일 결제시,
	                결제가 끝나고 랜딩되는 URL을 지정 
	                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
	                */
	        }, function (rsp) {
	            console.log(rsp);
	            if (rsp.success) {
	                var msg = '결제가 완료되었습니다.';
	                msg += '고유ID : ' + rsp.imp_uid;
	                msg += '상점 거래ID : ' + rsp.merchant_uid;
	                msg += '결제 금액 : ' + rsp.paid_amount;
	                msg += '카드 승인번호 : ' + rsp.apply_num;
		            alert(msg);
					$('#myfr').submit();
	            } else {
	                var msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
		            alert(msg);
	                return;
	            }
	        	
	        });
		}// 실시간 계좌이체
	
	
		});
    });
</script>


</body>
</html>