<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.7.0.js"
	type="text/javascript"></script>

<script type="text/javascript">
	// window.onload와 동일한 메서드
	$(document).ready(function() {

		$("h2").text("jquery 로딩 성공")
	});
</script>


</head>
<body>
	<%-- 3 useBean을 이용하여 id, pass입력하여 
인증여부를 Dao에서 확인하세요(A05_MemberDao.java) --%>
	<div class="container mt-3">
		<h2>id,pass 인증여부</h2>
		<form action="" method="post">
			<div class="mb-3 mt-3">
				<label for="id">아이디:</label> <input type="text" class="form-control"
					id="id" placeholder="아이디 입력" name="id">
			</div>
			<div class="mb-3 mt-3">
				<label for="pass">비밀번호:</label> <input type="text"
					class="form-control" id="pass" placeholder="비밀번호 입력" name="pass">
			</div>
			<button type="submit" class="btn btn-primary">인증여부</button>
		</form>
		<jsp:useBean id="ins" class="backendWeb.z01_vo.Member"></jsp:useBean>
		<jsp:setProperty property="*" name="ins" />
		<jsp:useBean id="dao" class="backendWeb.a01_dao.A05_MemberDao" />
		<c:if test="${not empty ins.id}">
     		${dao.checkMem(id)}
     	</c:if>
		<table class="table table-striped table-hover">
			<thead class="table-success">
				<tr class="text-center">
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>포인트</th>
					<th>권한</th>
					<th>가입날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="mem" items="${dao.getmemList()}">
					<tr class="text-center">
						<td>${mem.id}</td>
						<td>${mem.pass}</td>
						<td>${mem.name}</td>
						<td><fmt:formatNumber value="${mem.point}" /></td>
						<td>${mem.auth}</td>
						<td><fmt:formatDate value="${mem.regdate}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<%--
     4 useBean을 이용하여 insertDepartments메서드로 등록하고 출력하세요(
     --%>
	<div class="container mt-3">
		<h3>departments 등록하기</h3>
		<form action="" method="post">
			<div class="mb-3 mt-3">
				<label for="department_id">부서번호:</label> <input type="number"
					class="form-control" id="department_id" placeholder="부서번호 입력"
					name="department_id">
			</div>
			<div class="mb-3 mt-3">
				<label for="department_name">부서명:</label> <input type="text"
					class="form-control" id="department_name" placeholder="부서명 입력"
					name="department_name">
			</div>
			<div class="mb-3 mt-3">
				<label for="manager_id">상사id:</label> <input type="number"
					class="form-control" id="manager_id" placeholder="상사id번호 입력"
					name="manager_id">
			</div>
			<div class="mb-3 mt-3">
				<label for="location_id">위치id:</label> <input type="number"
					class="form-control" id="location_id" placeholder="위치id 입력"
					name="location_id">
			</div>
			<button type="submit" class="btn btn-primary">등록</button>
		</form>
	</div>
	<jsp:useBean id="insD" class="backendWeb.z01_vo.Department"/>
	<jsp:setProperty property="*" name="insD"/>
	<jsp:useBean id="dao2" class="backendWeb.a01_dao.A04_PreparedDao"/>
	<c:if test="${not empty insD.department_name}">
			${dao.insertDepartment(ins)}
		</c:if>
	<table class="table table-striped table-hover">
		<thead class="table-success">
			<tr class="text-center">
				<th>department_id</th>
				<th>department_name</th>
				<th>manager_id</th>
				<th>location_id</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dep" items="${dao.insertDepartments()}">
				<tr class="text-center">
					<td>${dep.department_id}</td>
					<td>${dep.department_name}</td>
					<td>${dep.manager_id}</td>
					<td>${dep.location_id}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>