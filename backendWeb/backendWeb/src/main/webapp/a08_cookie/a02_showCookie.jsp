<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.net.URLDecoder"
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
    		
    		/* $("h2").text("jquery 로딩 성공") */
    	});
    </script>      
    
    
</head>
<%
// request.getCookies() : 요청객체를 통해서 쿠키값을 서버에 보내서
// 서버프로그램인 jsp을 통해서 확인
Cookie[] cookies = request.getCookies();
for(Cookie c:cookies){
	// default 값을 제거
	if(!c.getName().equals("JSESSIONID")){
		out.print("<h3>"+
			URLDecoder.decode(c.getName(),"utf-8")
				+":"+c.getValue()+"</h3>");
	}
}
// a10_insertEncodeing.jsp 키가 한글로된 쿠키 설정
// a11_showEncoding.jsp 키와 값을 확인 쿠키

%>
<body>
    <div class="container mt-3">
    	<h2>쿠키 정보</h2>
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