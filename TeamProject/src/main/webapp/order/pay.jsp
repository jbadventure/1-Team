<%@page import="com.itwillbs.domain.OrdersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="shopcss.css">
  <link href="css/NewTop.css" rel="stylesheet" type="text/css">
  <link href="css/NewBottom.css" rel="stylesheet" type="text/css">
  <link href="css/body.css" rel="stylesheet" type="text/css">
  <link href="css/pay.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<meta charset="UTF-8">
<title>결제하기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/NewTop.jsp"></jsp:include>
<!-- 헤더들어가는 곳 --> 
<div id = bodycontainer>
<div id = content_frame>
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
int classPrice = (int)session.getAttribute("classPrice");
// int reservationAmount = (int)session.getAttribute("reservationAmount");
// int payPrice = classPrice*reserveDTO.getReservationAmount();
//int classNum = ()

%>
 
<form action="payPro.or" method="post" id="myfr">

<div id="class-content-p" >
<h2>팔레트정보</h2>
</div>
<div id="class-content-l" >
</div>
<!-- <tr><td> -->
    <% if(ordersDTO.getClassFile() == null){ %>
                <img src="images/logo-198x66.png" class="content_image" width="123" height="81">
    <% }else{ %>           
            	<img src="upload/<%=ordersDTO.getClassFile() %>" class="content_image" width="123" height="81">
    <% } %>
<!-- </td></tr>  -->
<div id="class-content" >
<table>
<tr><td id="subject"><%=ordersDTO.getClassSubject() %><br></td></tr>
<tr><td>예약날짜 <%=ordersDTO.getOrdersDate() %></td></tr>
<tr><td>예약인원 <%=ordersDTO.getOrdersAmount() %></td></tr>

</table>
</div>
<div id="class-content-l" >
</div>
<div id="class-content-p" >
<legend>결제수단</legend><br>
<input type="radio" name="payMethod" id="card" value="card">신용/체크카드<br>
<input type="radio" name="payMethod" id="kakaopay" value="kakaopay" checked>카카오페이<br>
<input type="radio" name="payMethod" id="deposit" value="deposit">무통장입금<br>
</div>

<div id="class-content-l" >
</div>

<div id="class-content-p" >
<legend>총 결제금액 <%=ordersDTO.getTotalPrice() %>원</legend>

<%-- <input type="hidden" name ="classSubject"  id="classSubject" value="<%=classSubject %>"><!-- classSubject값 전달 --> --%>
</div>
<div id="class-content-l" >
</div>
<input type="button" value="결제하기" id="btn">
</form>

<script type="text/javascript">

$(document).ready(function() {
// alert("시작");	

	$('#btn').click(function() {
// 		alert($('input[name=payMethod]:checked').val());
	
	
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
	            name: '<%=ordersDTO.getClassSubject() %>', //결제창에서 보여질 이름
	            amount: <%=ordersDTO.getTotalPrice() %>, //가격 
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
// 	                var msg = '결제가 완료되었습니다.';
// 	                msg += '고유ID : ' + rsp.imp_uid;
// 	                msg += '상점 거래ID : ' + rsp.merchant_uid;
// 	                msg += '결제 금액 : ' + rsp.paid_amount;
// 	                msg += '카드 승인번호 : ' + rsp.apply_num;
// 		            alert(msg);
					$('#myfr').submit();
	            } else {
	                var msg = '결제에 실패하였습니다.';
// 	                msg += '에러내용 : ' + rsp.error_msg;
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
	            name: '<%=ordersDTO.getClassSubject() %>', //결제창에서 보여질 이름
	            amount: <%=ordersDTO.getTotalPrice() %>, //가격 
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
// 	                var msg = '결제가 완료되었습니다.';
// 	                msg += '고유ID : ' + rsp.imp_uid;
// 	                msg += '상점 거래ID : ' + rsp.merchant_uid;
// 	                msg += '결제 금액 : ' + rsp.paid_amount;
// 	                msg += '카드 승인번호 : ' + rsp.apply_num;
// 		            alert(msg);
					$('#myfr').submit();
	            } else {
	                var msg = '결제에 실패하였습니다.';
// 	                msg += '에러내용 : ' + rsp.error_msg;
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
	            name: '<%=ordersDTO.getClassSubject() %>', //결제창에서 보여질 이름
	            amount: <%=ordersDTO.getTotalPrice() %>, //가격 
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
// 	                var msg = '결제가 완료되었습니다.';
// 	                msg += '고유ID : ' + rsp.imp_uid;
// 	                msg += '상점 거래ID : ' + rsp.merchant_uid;
// 	                msg += '결제 금액 : ' + rsp.paid_amount;
// 	                msg += '카드 승인번호 : ' + rsp.apply_num;
// 		            alert(msg);
					$('#myfr').submit();
	            } else {
	                var msg = '결제에 실패하였습니다.';
// 	                msg += '에러내용 : ' + rsp.error_msg;
		            alert(msg);
	                return;
	            }
	        	
	        });
		}// 실시간 계좌이체
	
	
		});
    });
</script>
</div>
</div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</body>
</html>