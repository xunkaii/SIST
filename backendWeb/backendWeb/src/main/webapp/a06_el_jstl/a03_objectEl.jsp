<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "backendWeb.z01_vo.Person"
    import = "backendWeb.z01_vo.Member"
    import = "backendWeb.z01_vo.Job_history"
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
	<%
	// Member(String id, String pass, String name, String auth, int point) {
	session.setAttribute("p01", 
			new Person("홍길동",25,"서울"));
	session.setAttribute("mem", 
			new Member("himan","7777","홍길동","관리자",3000));
	
	// ex) db에 job_history기준을 VO를
    // 만들어 session으로 할당하고 출력하세요..
    // Date타입은 추가적으로 String으로 만들어 출력되게 하세요.
    /*
    CREATE TABLE "SCOTT"."JOB_HISTORY" 
   (	"EMPLOYEE_ID" NUMBER(6,0) CONSTRAINT "JHIST_EMPLOYEE_NN" NOT NULL ENABLE, 
	"START_DATE" DATE CONSTRAINT "JHIST_START_DATE_NN" NOT NULL ENABLE, 
	"END_DATE" DATE CONSTRAINT "JHIST_END_DATE_NN" NOT NULL ENABLE, 
	"JOB_ID" VARCHAR2(10) CONSTRAINT "JHIST_JOB_NN" NOT NULL ENABLE, 
	"DEPARTMENT_ID" NUMBER(4,0),
	
	private int employee_id;
    private Date start_date;
    private String start_dateS;
    private Date end_date;
    private String end_dateS;
    private String job_id;
    private int deprtment_id;
    
    
    Job_history(int employee_id, String start_dateS, 
    String end_dateS, String job_id, int deprtment_id)
	
    ~12:05
	*/
	session.setAttribute("jh", new Job_history(1000, 
			"2023-06-26", "2023-06-289", "사원", 1001));
	%>
	
    <div class="container mt-3">
    	<h2>el 활용</h2>
    	<a href='a03_session.jsp'>세션 확인하러 가기</a>
    	<h3>아이디:${jh.employee_id}</h3>
    	<h3>시작일:${jh.start_dateS}</h3>
    	<h3>종료일:${jh.end_dateS}</h3>
    	<h3>직책id:${jh.job_id}</h3>
    	<h3>부서id:${jh.deprtment_id}</h3>
    	<h3>이름:${p01.name}</h3>
    	<%-- p01.getXXX 
    		주의 getXXX로 호출되는 property이다..
    	--%>
    	<h3>나이:${p01.age}</h3>
    	<h3>사는곳:${p01.loc}</h3>
    	<h2>회원 정보</h2>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>아이디</th>
				    <th>패스워드</th>
				    <th>이름</th>
				    <th>권한</th>
				    <th>포인트</th>
		      	</tr>
		    </thead>
		    <tbody>
			   	<tr  class="text-center">
			        <td>${mem.id}</td>
			        <td>${mem.pass}</td>
			        <td>${mem.name}</td>
			        <td>${mem.auth}</td>
			        <td>${mem.point}</td>
			   	</tr>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>