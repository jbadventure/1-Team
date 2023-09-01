<%@page import="com.itwillbs.domain.ClassBoardDTO"%>
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

<!-- <input type="button" id="kakao" value="카카오 결제하기"> -->

<%--  <%
String memberId = (String)session.getAttribute("memberId");
%>   
 
<%
request.setCharacterEncoding("utf-8");
String payMethod = request.getParameter("payMethod"); // 전달
%> --%>
 


<script type="text/javascript">
$('#paymentBtn').click(function () {
      var IMP = window.IMP;
      IMP.init('아임포트 본인 가맹점식별코드');
      
      //DOM객체들에서 사용할 데이터 뽑기
      var paymentGoods = $('input[name="paymentOrderName"]').val();
      var money = $('.totalprice').text();
      var memberName = $('input[name="memberName"]').val();
      var memberEmail = $('input[name="memberEmail"]').val();
      var memberPhone = $('input[name="memberPhone"]').val();
      
      var len = memberEmail.indexOf("@");
      var memberId = memberEmail.substr(0, len);
	  
 
      IMP.request_pay({
      	  //카카오페이 결제시 사용할 정보 입력
          pg: 'card',
          paymentCode: 'p' + new Date().getTime()+'_'+memberId,
          name: paymentGoods,
          amount: money,
          buyer_email: memberEmail,
          buyer_name: memberName,
          buyer_tel: memberPhone,
      }, function (rsp) {
      	  //결제 완료시
          if (rsp.success) {
              var msg = '결제가 완료되었습니다.';
              msg += '카드 승인번호 : ' + rsp.apply_num;
              
              /* 
              만약 데이터들을 ajax로 보낼 시 사용할 코드
              $.ajax({
                  type: "GET", 
                  url: "/mypage/mypaymentList/paymentDetail", 
                  data: {
                      "amount" : money
                  },
              });
              */
              
              $('#paymentForm').submit();
              
          } else {
          	  //결제 실패시
              var msg = '결제에 실패하였습니다.';
              msg += '에러내용 : ' + rsp.error_msg;
            
              if($('input[name="eClassApprovedSetDate"]').length){
            document.location.href="/mypage/mySignUpForClassList"; //alert창 확인 후 이동할 url 설정
              }else {
            document.location.href="/challenge/challengeGather/challengeGatherList"; //alert창 확인 후 이동할 url 설정
              }
          }
          alert(msg);
      });
  });
</script>
</body>
</html>