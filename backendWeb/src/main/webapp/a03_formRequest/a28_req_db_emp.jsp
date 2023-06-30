<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="backendWeb.z01_vo.Emp"
    import="backendWeb.a01_dao.A04_PreparedDao"
    import="java.util.*"

    
    %>
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
    	<h2>사원정보 등록</h2>
    	<%--
    	ex) 사원정보를 등록하고, 등록된 내용을 출력하는 처리를하세요.
    	
    	 --%>
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="empno">사원번호:</label>
            <input type="number" class="form-control" id="empno" placeholder="사원번호 입력" required name="empno">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="ename">사원명:</label>
            <input type="text" class="form-control" 
      	     id="ename" required placeholder="사원명 입력" name="ename">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="job">직책명:</label>
            <input type="text" class="form-control" 
      	     id="job" required placeholder="사원명 입력" name="job">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="mgr">관리자번호:</label>
            <input type="number" class="form-control" 
      	     id="mgr" required placeholder="관리자번호 입력" name="mgr">
         	</div>
         	         	
          	<div class="mb-3 mt-3">
            <label for="hiredateS">입사일:</label>
            <input type="date" class="form-control" 
      	     id="hiredateS" required placeholder="입사일 입력" name="hiredateS">
         	</div>
          	<div class="mb-3 mt-3">
            <label for="sal">급여:</label>
            <input type="number" class="form-control" 
      	     id="sal" required placeholder="급여 입력" name="sal">
         	</div>
          	<div class="mb-3 mt-3">
            <label for="comm">보너스:</label>
            <input type="number" class="form-control" 
      	     id="comm" required placeholder="보너스: 입력" name="comm">
         	</div>
          	<div class="mb-3 mt-3">
            <label for="deptno">사원번호:</label>
            <input type="number" class="form-control" 
      	     id="deptno" placeholder="부서번호 입력" name="deptno" required>
         	</div>
         	
         	
         	         
         	<button type="submit" class="btn btn-primary">등록</button>
     	</form>
<%
//backendWeb.z01_vo.Emp
//backendWeb.a01_dao.A04_PreparedDao
	A04_PreparedDao dao = new A04_PreparedDao();
	String empnoS = request.getParameter("empno");
	boolean insSuc=false;
	if(empnoS!=null){
		int empno = Integer.parseInt(empnoS);
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		String mgrS = request.getParameter("mgr");
		int mgr = Integer.parseInt(mgrS);
		String hiredateS = request.getParameter("hiredateS");
		String salS = request.getParameter("sal");
		double sal = Double.parseDouble(salS);
		String commS = request.getParameter("comm");
		double comm = Double.parseDouble(commS);
		String deptnoS = request.getParameter("deptno");
		int deptno = Integer.parseInt(deptnoS);
		dao.insertEmp(new Emp(
				empno,ename,job,mgr,
				hiredateS,sal,comm, deptno
				));
		insSuc=true;
	}

%>     	
	<script type="text/javascript">
		var insSuc = <%=insSuc%>
		if(insSuc){
			alert("사원정보 등록 성공")
		}
	</script>

     	
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>사원번호</th>
				    <th>사원명</th>
				    <th>직책명</th>
				    <th>관리자번호</th>
				    <th>입사일</th>
				    <th>급여</th>
				    <th>보너스</th>
				    <th>부서번호</th>
		      	</tr>
		    </thead>
		    <tbody>
		    	<%
		    	for(Emp e:dao.getEmpList()){%>
			   	<tr  class="text-center">
			        <td><%=e.getEmpno() %></td>
			        <td><%=e.getEname() %></td>
			        <td><%=e.getJob() %></td>
			        <td><%=e.getMgr() %></td>
			        <td><%=e.getHiredate() %></td>
			        <td><%=e.getSal() %></td>
			        <td><%=e.getComm() %></td>
			        <td><%=e.getDeptno() %></td>
			   	</tr>
			   	<%}%>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>