<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.net.URLEncoder"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<c:set var="path" 
	value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
 
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
    		
    		$("h2").text("jquery 로딩 성공")
    	});
    </script>      
<%--
# 한글 key에 대한 encoding 및 decoding 처리
1. key값을 1byte단위로 문자가 설정되어
2. 한글의 경우 encoding과 decoding이 필요로 한다.
3. encoding :설정 부분 처리
	import java.net.URLEncoder
	new Cookie(URLEncoder.encode("키","utf-8"),"값")
4. decoding :가져오는 부분 처리
	import java.net.URLDecoder
	URLDecoder.decode(c1.getName(),"utf-8")
 --%>
<%
	// 변경
	response.addCookie(new Cookie("cnt","5"));
	// 추가
	//  import="java.net.URLEncoder"
	response.addCookie(new Cookie(
			URLEncoder.encode("과일","utf-8"),"바나나"));
	// 서버단에서 페이지 이동 처리 ==> client ==> server 페이지 이동 
	response.sendRedirect("a02_showCookie.jsp");
%> 
</head>
<body>
    <div class="container mt-3">
    	<h2>사원정보 등록</h2>
	  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  		<div class="container-fluid">    	
	    	<form method="post"  class="d-flex align-items-center" >
	            <input type="text" class="form-control me-2" 
	      	     id="title" placeholder="직책명 입력" value="${param.title}" name="title"  aria-label="Search">
	            <input type="text" class="form-control me-2" 
	      	     id="min_sal1" placeholder="최소급여 시작"  
	      	     value="${empty param.min_sal1? 0: param.min_sal1}"  name="min_sal1"  aria-label="Search">
	      	    ~
	            <input type="text" class="form-control me-2" 
	      	     id="min_sal2" placeholder="최소급여 마지막" 
	      	      value="${empty param.min_sal2? 9999999: param.min_sal2}"  name="min_sal2"  aria-label="Search">
	      	     
	      	     
	         	<button type="submit" class="btn btn-primary" style="width:200px;">조회</button>
	     	</form>
	 	    </div>
	 	</nav>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>Firstname</th>
				    <th>Lastname</th>
				    <th>Email</th>
		      	</tr>
		    </thead>
		    <tbody>
			   	<tr  class="text-center">
			        <td>John</td>
			        <td>Doe</td>
			        <td>john@example.com</td>
			   	</tr>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>