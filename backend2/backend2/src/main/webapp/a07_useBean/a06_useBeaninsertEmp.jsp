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
    		
    		$("h2").text("사원정보 등록/조회")
    	});
    </script>      
    
    
</head>
<body>
    <div class="container mt-3">
    	<h2>사원정보 등록</h2>
    	<%--
    	ex) useBean을 이용하여 사원정보 등록 조회
    	 --%>
	  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  		<div class="container-fluid">    	
	    	<form method="post"  class="d-flex align-items-center" >
	            <input type="number" class="form-control me-2" 
	      	     id="empno" placeholder="사원번호" 
	      	      name="empno"  aria-label="Search">
	            <input type="text" class="form-control me-2" 
	      	     id="ename" placeholder="사원명" 
	      	      name="ename"  aria-label="Search">
	            <input type="text" class="form-control me-2" 
	      	     id="job" placeholder="직책명" 
	      	      name="job"  aria-label="Search">
	            <input type="number" class="form-control me-2" 
	      	     id="mgr" placeholder="관리자번호" 
	      	      name="mgr"  aria-label="Search">	      	      
	            <input type="date" class="form-control me-2" 
	      	     id="hiredateS" placeholder="입사일" 
	      	      name="hiredateS"  aria-label="Search">
	            <input type="number" class="form-control me-2" 
	      	     id="sal" placeholder="급여" 
	      	      name="sal"  aria-label="Search">
	            <input type="number" class="form-control me-2" 
	      	     id="comm" placeholder="보너스" 
	      	      name="comm"  aria-label="Search">
	            <input type="number" class="form-control me-2" 
	      	     id="deptno" placeholder="부서번호" 
	      	      name="deptno"  aria-label="Search">
	      	      	      	      
	         	<button type="submit" class="btn btn-primary" style="width:200px;">등록</button>
	     	</form>
	 	    </div>
	 	</nav>
	 	<jsp:useBean id="ins" class="backendWeb.z01_vo.Emp"/>
	 	<jsp:setProperty property="*" name="ins"/>
	 	<jsp:useBean id="dao" class="backendWeb.a01_dao.A04_PreparedDao"/>
	 	<c:if test="${not empty ins.ename}">
	 		${dao.insertEmp(ins)}
	 	</c:if>
	 	
	 	
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>사원번호</th>
				    <th>사원명</th>
				    <th>급여</th>
				    <th>입사일</th>
		      	</tr>
		    </thead>
		    <tbody>
		    	<c:forEach var="emp" items="${dao.getEmpList()}">
			   	<tr  class="text-center">
			        <td>${emp.empno}</td>
			        <td>${emp.ename}</td>
			        <td><fmt:formatNumber value="${emp.sal}"/></td>
			        <td><fmt:formatDate value="${emp.hiredate}"/>
			        </td>
			   	</tr>
			   	</c:forEach>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>