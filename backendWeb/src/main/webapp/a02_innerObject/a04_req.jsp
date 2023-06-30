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

구매물품 : 
구매가격 :
구매개수 :
총액 : 

1. 데이터를 구매개수까지 출력하고
2. 가격과 개수를 형변환 처리하여 총액을 변수에 할당한 후
3. 총액과 함께 전체 데이터를 요청값에 의해 출력하세요
 --%>
 <%
 String item = request.getParameter("item");
 String priceS = request.getParameter("price");
 String cntS = request.getParameter("cnt");
 int price = 0;
 int cnt = 0;
 if(priceS != null) price = Integer.parseInt(priceS);
 if(cntS != null) cnt = Integer.parseInt(cntS);
int tot = price * cnt;
 
 %>
 
 <h3>구매물품: <%=item %></h3>
 <h3>구매가격: <%=price%></h3>
 <h3>구매개수: <%=cnt %></h3>
 <h3>총액: <%=tot %></h3>
</body>
</html>