<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--
1. query string vs request.getParameter("")
	1) 페이지명?key=value
	2) String val= requst.getParameter("key")
	1) 1개 매개변수
	2) 2개 매개변수
	3) 숫자형 매개변수넘기기
	4) 배열형 매개변수
	5) 객체형 매개변수.	
2. query string은 클라이언트에 서버로 데이터를 전송해주기 위한 목적.
		
	
 --%>
</head>
<body>
	<%--
	a01_step01.jsp?food=짜장면
	a01_step01.jsp?food=짬뽕
	 --%>
	<h2>초기 요청 페이지</h2>
	<%=request.getParameter("food")%>
	<%
	String food = request.getParameter("food");
	%>
	<h3>받은 음식물:<%=food%></h3>
	<%--
	a01_step01.jsp?fruit=수박
	문자열 변수 fruit로 받아서 
		받은 과일 : @@@ 로 출력되게 하세요.
	 --%>
	<%
	String fruit = request.getParameter("fruit");
	%>
	 <h2>받은 과일 :<%=fruit %></h2>
	<%--
	a01_step01.jsp?food=짜장면&fruit=사과
	 --%> 
	<%--
	a01_step01.jsp?price=3000&cnt=5
	물건의 가격과 갯수를 받아서 출력되게하게요..
	 --%>
	 <%
	 String price= request.getParameter("price");
	 String cnt= request.getParameter("cnt");
	 // 안 넘어오면 0, 넘어오면 형변환 처리..(숫자형 안정성...) 
	 int priceInt = 0;
	 if(price!=null) // null 프로세스 처리 안됨.
	 	priceInt= Integer.parseInt(price);
	 int cntInt = 0;
	 if(cnt!=null)
	 	cntInt= Integer.parseInt(cnt);
	 %>
	 <h2>물건의 가격:<%=priceInt%></h2>
	 <h2>물건의 갯수:<%=cntInt%></h2>
	 <h2>총계:<%=priceInt*cntInt%></h2>
	
	
	
</body>
</html>