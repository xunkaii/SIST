<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    		
    		// ex) 가격을 입력해서 서버에 전송해서
    		//     출력내용을 가격 @@@을 처리하게 하세요.
    		//     price
    		$("#regBtn").click(function(){
    			// $("#frm").serialize() :
    			// form 하위에 name/value 기준으로 자동으로 
    			// query string을 생성해준다
    			alert($("#frm").serialize())
    			$.ajax({
    				url:"${path}/prodCalcu.do",
    				type:"post",
    				data: $("#frm").serialize(),
    				dataType:"text",
    				success:function(data){
    					alert(data)
    				}
    			})
    		})
    	});
    </script>      
    
    
</head>
<body>
    <div class="container mt-3">
    	<h2>서버를 호출</h2>
	  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  		<div class="container-fluid">    	
	    	<form method="post"  class="d-flex align-items-center" >
	            <input type="text" class="form-control me-2" 
	      	     id="price" placeholder="가격 입력"  name="price"  aria-label="Search">
	         	<button id="regBtn" type="button" class="btn btn-primary" style="width:200px;">가격전송</button>
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