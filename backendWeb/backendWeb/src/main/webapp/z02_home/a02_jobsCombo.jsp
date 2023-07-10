<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="backendWeb.a01_dao.A04_PreparedDao"
    import="backendWeb.z01_vo.Job"
    import="java.util.*"
    %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function call(obj){
		alert("선택한 직책 코드:"+obj.value)
	}
</script>
</head>
<body>
<%
	A04_PreparedDao dao= new A04_PreparedDao();
    List<Job> jobs = dao.getJobs();
%> 
직책:
<select name="job" onchange="call(this)">
	<option value=''>직책을 선택</option>
	<%for(Job job:jobs){ %>
	<option value='<%=job.getJob_id()%>'>
		<%=job.getJob_title()%>
		(<%=job.getMin_salary() %> ~
		 <%=job.getMax_salary() %>)</option>
	<%} %>
</select>
<%--
# 직책정보를 jsp에서 Combo 박스로 출력하세요(- jobs 테이블 참고, DAO,JSP처리)
0. 화면 구현
	select는 처리 형태 확인 value/화면출력 동일여부 확인
1. sql 작성
	SELECT * 
	FROM jobs
	ORDER BY job_title
	
	;
	-- <OPTION value='job_id'>jobTitle(@@~@@)</option>
	-- job_id, job_title, min_salary, max_salary

2. VO작성/String 
	class Job
	private String job_id;
	private String job_title;
	private int min_salary;
	private int max_salary;

	backendWeb.z01_vo.Job
3. Dao 작성/메서드 추가
	backendWeb.a01_dao.A04_PreparedDao
    backendWeb.z01_vo.Job
4. jsp import(DAO/VO)
5. for-each문을 통해서 출력 처리 확인..


 
 

 --%>
</body>
</html>