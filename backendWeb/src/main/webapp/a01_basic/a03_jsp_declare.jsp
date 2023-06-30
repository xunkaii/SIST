<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	String prd01 = "노트북";
	int price = 1200000;
	String getPrd01() {
		return prd01 + "("+ price +")";
	}
	String getPrd01(int cnt) {
		return prd01 + "(" + price*cnt + ")";
	}
%>
<h3>변수 호출:<%=prd01 %></h3>
<h3>메서드 호출: <%=getPrd01() %></h3>
<h3>메서드(가격): <%=getPrd01() %></h3>
<h3>메서드(총계): <%=getPrd01(5) %></h3>
</body>
</html>