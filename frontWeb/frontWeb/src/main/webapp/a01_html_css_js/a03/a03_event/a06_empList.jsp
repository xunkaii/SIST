<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     import = "frontWeb.practice.A04_PreparedDao"
    import = "frontWeb.vo.Employee"
    import = "java.util.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>사원정보 리스트</h2>
<table>
<%
A04_PreparedDao dao = new A04_PreparedDao();
Map<String, String> sch = new HashMap<String, String>();
sch.put("name","");
sch.put("minsal","0");
sch.put("maxsal","999999");
for(Employee e: dao.getEmpList(sch)){
%>
	<tr>
		<td><%=e.getEmployee_id() %></td>
		<td><%=e.getFirst_name() %></td>
		<td><%=e.getSalary() %></td>
		<td><%=e.getDepartment_id() %></td>
	</tr>
<%}%>
</table>
</body>
</html>