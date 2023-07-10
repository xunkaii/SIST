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
	String name="사과";
	int price = 2000;
	String getProdInfo(){
		return name+"("+price+")";
	}
	String getProdInfo(int cnt){
		return name+"("+price*cnt+")";
	}	
%>
	<h2>물건명:<%=name%></h2>
	<h2>가격:<%=price%></h2>
	<h2>메서드(가격):<%=getProdInfo()%></h2>
	<h2>메서드(총계):<%=getProdInfo(5)%></h2>


</body>
</html>