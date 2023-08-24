<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
// request 한글처리
request.setCharacterEncoding("utf-8");

// 사용자가 입력한 정보를 http가 들고와서 서버request에 저장
// request에 저장된 12개 값 가져와서 변수에 저장

// 아이디 id
// 비밀번호 pass
// 비밀번호 확인 pass2
// 이름 name
// 생년월일 birth
// 전화번호 phone1-phone2-phone3
// 이메일 email
// 이메일 선택 emailop
// 지역 address
// 사업자번호 bNum

String id = request.getParameter("id");
String pass = request.getParameter("pass");
String pass2 = request.getParameter("pass2");
String name = request.getParameter("name");
String birth = request.getParameter("birth");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String email = request.getParameter("email");
String emailop = request.getParameter("emailop");
String address = request.getParameter("address");
String bNum = request.getParameter("bNum");

// DB연결
// 1단계 : JDBC 프로그램 가져오기 
Class.forName("com.mysql.cj.jdbc.Driver");

// 2단계 : 디비 연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb?serverTimezone=Asia/Seoul";
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);

// 3단계 : sql구문으로 변경
String sql = "insert into members(id,pass,pass2,name,birth,phone1,phone2,phone3,email,emailop,address,bNum) values(?,?,?,?,?,?,?,?,?,?,?,?)";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass); 
pstmt.setString(3, pass2);
pstmt.setString(4, name);
pstmt.setString(5, birth);
pstmt.setString(6, phone1);
pstmt.setString(7, phone2);
pstmt.setString(8, phone3);
pstmt.setString(9, email);
pstmt.setString(10, emailop);
pstmt.setString(11, address);
pstmt.setString(12, bNum);

// 4단계 : sql구문 실행
pstmt.executeUpdate();

// 메인으로 이동(하이퍼링크)
// response.sendRedirect("login.jsp");
%>
<a href="login.jsp">메인 페이지 이동</a>
<script type="text/javascript">
alert("메인 페이지 이동");
location.href="main.jsp";
</script>

</body>
</html>