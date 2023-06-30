<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// <jsp:param name="ename" value="himan"/>
String ename = request.getParameter("ename");
String job = request.getParameter("job");
%>
<%-- 요청값 상위에 있는 a01_basic.jsp로 넘겨준다. --%>
<form action="a01_basic.jsp" method="post">
	<div class="mb-3 mt-3">
		<label for="ename">사원명:</label> <input type="text"
			class="form-control" id="ename" value="<%=ename%>"
			placeholder="사원명 입력" name="ename">
	</div>
	<div class="mb-3 mt-3">
		<label for="job">직책:</label> <input type="text" class="form-control"
			id="job" value="<%=job%>" placeholder="직책 입력" name="job">
	</div>

	<button type="submit" class="btn btn-primary">검색</button>
</form>
