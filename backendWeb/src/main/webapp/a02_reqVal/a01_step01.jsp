<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
1. query string vs request.getParameter("")
	1) 페이지명?key=value
	2) String val = request.getParameter("key")
	1) 1개 매개변수
	2) 2개 매개변수
	3) 숫자형 매개변수 넘기기
	4) 배열형 매개변수
	5) 객체형 매개변수
2. query string은 클라이언트에 서버로 데이터를 전송해주기 위한 목적
	
 --%>
 
 <%--
 a01_step01.jsp?food=짜장면
 a01_step01.jsp?food=짬뽕
 --%>
 <h2>초기 요청 페이지</h2>
 <%=request.getParameter("food") %>
 <%
 String food = request.getParameter("food");
 %>
 <h3>받은 음식:<%=food %></h3>
 
<%--
 a01_step01.jsp?fruit=수박
--%>
  <%
  String fruit = request.getParameter("fruit");
  %>
  <h3>받은 과일: <%=fruit%></h3>
  
<%--
  a01_step01.jsp?food=짜장면&fruit=사과
--%>
   
<%-- 
   물건의 가격과 개수를 받아서 출력되게 하세요
   a01_step01.jsp?price=3000&cnt=5
 --%>
   <%
   String price = request.getParameter("price");
   String cnt = request.getParameter("cnt");
   // 안넘어오면 0, 넘어오면 형변환 처리 (숫자형 안정성)
   int priceInt = 0;
   if(price != null)
   priceInt = Integer.parseInt(price);
   
   int cntInt = 0;
   if(cnt != null)
   cntInt = Integer.parseInt(cnt);
   
   int tot = priceInt * cntInt;
   %>
   
   <h3>물건의 가격: <%=price %></h3>
   <h3>물건의 개수: <%=cnt %></h3>
   <h3>총계: <%=tot %></h3>
</body>
</html>