<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage = "true"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<fmt:requestEncoding value="utf-8"/>
<c:set var="path" 
	value="${pageContext.request.contextPath}"/>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
   
    <script src = "https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    	// window.onload와 동일한 메서드
    	$(document).ready( function(){
    		
    		$("h2").text("에러처리  페이지")
    	});
    </script>      
</head>
<body>
    <div class="container mt-3">
    	<h2>사원정보 등록</h2>
		<table class="table table-striped table-hover">
		    <tbody>
		    <%if(exception != null) { %>
			   	<tr class="text-center">
			        <th>에러타입</th> <td><%=exception.getClass().getName() %></td>
			        <tr class="text-center">
			        <th>에러메세지</th> <td><%=exception.getMessage() %></td>
			        <tr class="text-center">
			        <th>담당자</th> <td>홍길동 사원(010-8888-9999)</td>
			   	</tr>
			   	<%}else { %>
			   	 <tr class="text-center">
			        <th colspan = "2">아직 예외 없음</td>
			   	<%} %>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>