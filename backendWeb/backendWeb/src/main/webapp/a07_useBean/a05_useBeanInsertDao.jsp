<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
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
    		
    		$("h2").text("회원 등록")
    	});
    </script>      
    
    
</head>
<body>
    <div class="container mt-3">
    	<h2>사원정보 등록</h2>
    	<%--ex) 회원정보(회원아이디,패스워드,이름,권한,포인트)fmf
    	요청값을 처리하는 form을 만들고 useBean으로 등록하여 출력되게
    	하세요.. --%>
    	
	  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  		<div class="container-fluid">    	
	    	<form method="post"  class="d-flex align-items-center" >
	            <input type="text" class="form-control me-2" 
	      	     id="id" placeholder="아이디 입력" name="id"  aria-label="Search">
	      	    <input type="text" class="form-control me-2" 
	      	     id="pass" placeholder="패스워드 입력" name="pass"  aria-label="Search">
	      	    <input type="text" class="form-control me-2" 
	      	     id="name" placeholder="이름 입력" name="name"  aria-label="Search">
	      	    <input type="text" class="form-control me-2" 
	      	     id="auth" placeholder="권한 입력" name="auth"  aria-label="Search">
	      	    <input type="text" class="form-control me-2" 
	      	     id="point" placeholder="포인트 입력" name="point"  aria-label="Search">
	         	<button type="submit" class="btn btn-primary" 
	         		style="width:200px;">등록</button>
	     	</form>
	 	    </div>
	 	</nav>
	 	<jsp:useBean id="mem" class="backendWeb.z01_vo.Member"/>
	 	<jsp:setProperty property="*" name="mem"/>
	 	<jsp:useBean id="dao" class="backendWeb.a01_dao.A05_MemberDao"/>
	 	<c:if test="${not empty mem.id}">
	 		${dao.insertMember(mem)}
	 	</c:if>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>Firstname</th>
				    <th>Lastname</th>
				    <th>Email</th>
		      	</tr>
		    </thead>
		    <tbody>
		    	<c:forEach var="m" items="${dao.mlist()}">
			   	<tr  class="text-center">
			        <td>${m.id }</td>
			        <td>${m.name }</td>
			        <td>${m.auth }</td>
			   	</tr>
			   	</c:forEach>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>