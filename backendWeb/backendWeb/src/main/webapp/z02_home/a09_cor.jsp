<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
</head>
<body>
    <div class="container mt-3">
    	<h2>정답 성공하셨습니다.^^</h2>
    	<h3>
    		<%--
    		forward처리시..
    		 request scope의 데이터를 받을 수 있다. --%>
    		<%=request.getParameter("grade") %> x
    		<%=request.getParameter("cnt") %> =
    		<%=request.getParameter("result") %> 
    	</h3>
    	<h3 onclick="location.href='a08_gugu.jsp'">다시 문제 풀러가기!!</h3>
 	
    </div>
</body>
</html>