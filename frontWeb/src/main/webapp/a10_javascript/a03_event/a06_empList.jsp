<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="frontWeb.A04_PreparedDao"
    import="frontWeb.vo.Employee"
    import="java.util.*"
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>사원정보 리스트</h2>
<%-- name="name" value="<%=name%>" --%>
<%-- name="minSal" value="<%=minSal%>" --%>
<%
// a06_empList.jsp

// a06_empList.jsp?name=a&minSal=0&maxSal=99999
String name = request.getParameter("name"); 
if(name==null) name="";
String minSal = request.getParameter("minSal"); 
if(minSal==null) minSal="0";
String maxSal = request.getParameter("maxSal"); 
if(maxSal==null) maxSal="99999";
%>
<form>
사원명:<input type="text" name="name" value="<%=name%>"/><br>
최소급여:<input type="text" name="minSal" value="<%=minSal%>"/><br>
최대급여:<input type="text" name="maxSal" value="<%=maxSal%>"/><br>
<input type="submit" value="검색"/>
</form>
<table border>
	<tr><th>사원번호</th><th>사원명1</th><th>사원명2</th><th>급여</th>
	    <th>부서번호</th></tr>
	<%
	A04_PreparedDao dao = new A04_PreparedDao();
	Map<String,String> sch = new HashMap<String,String>();
	sch.put("name",name);
	sch.put("minSal",minSal);
	sch.put("maxSal",maxSal);
	//  name minSal maxSal
	for(Employee e: dao.getEmpList(sch)){ 
	%>
	<tr>
	     <td><%=e.getEmployee_id() %></td>
	     <td><%=e.getFirst_name() %></td>
	     <td><%=e.getLast_name() %></td>
	     <td><%=e.getSalary() %></td>
	     <td><%=e.getDepartment_id()%></td>
	</tr>
	<%}%>
</table>

</body>
</html>