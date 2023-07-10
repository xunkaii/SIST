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
ex) a04_req.jsp?pname=사과&price=3000&cnt=5
구매물품: @@
구매가격: @@
구매갯수: @@
총액: @@
1. 우선 데이터를 구매갯수까지 출력하고
2. 가격과 갯수을 형변환처리하여 총액을 변수에 할당 후,
3. 총액과 함께 전체 데이터를 요청값에 의해 출력하세요. 
 --%>
<%
	String pname = request.getParameter("pname");
	String priceS = request.getParameter("price");
	String cntS = request.getParameter("cnt");
	int price=0,cnt=0;
	if(priceS!=null) price = Integer.parseInt(priceS);
	if(cntS!=null) cnt = Integer.parseInt(cntS);
	int tot = price*cnt;
%> 
	<h2>구매정보</h2> 
	<h3>구매물품: <%=pname%></h3> 
	<h3>구매가격: <%=price%></h3> 
	<h3>구매갯수: <%=cnt%></h3> 
	<h3>총액: <%=tot%></h3> 
</body>
</html>