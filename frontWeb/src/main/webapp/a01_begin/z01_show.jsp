<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="frontWeb.Person"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	Person p01 = new Person();
	p01.name="마길동";
	p01.age = 25;
	p01.loc="서울 강남";
	String name="홍길동";
%>
<body>
	<h2>안녕하세요 <%=name%></h2>
	<h2>안녕하세요 <%=p01.name%></h2>
	<h2>안녕하세요 <%=p01.age%></h2>
	<h2>안녕하세요 <%=p01.loc%></h2>
</body>
</html>