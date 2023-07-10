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

	<%-- 1. 1부터 10까지의 숫자 중 홀수만 출력하세요. --%>
	<table class="table table-striped table-hover">
		<tbody>
			<tr class="text-center">
				<c:forEach var="cnt" begin="1" end="10" step="2">
					<td>${cnt}</td>
				</c:forEach>
			</tr>
		</tbody>
		<%-- 2.  2. 배열에 저장된 동물 이름을 출력하세요. --%>
		<%
		request.setAttribute("animal", new String[] { "강아지", "고양이", "사자", "토끼", "코끼리", "기린", "얼룩말" });
		%>
		<tbody>
			<tr class="text-center">
				<c:forEach var="animal" items="${animal}">
					<td>${animal}</td>
				</c:forEach>
			</tr>
		</tbody>
	</table>
	<%-- 3. JSTL을 사용하여 나이를 입력받아, age 변수가 18 이상인 경우 "성인입니다"라는 
		메시지를 출력하고, 그렇지 않은 경우 "미성년자입니다"라는 메시지를 출력해야 합니다 --%>

	<%--
		4. backendWeb.a01_dao.A05_MemberDao의  List<Member> mlist() 메서드를 이용하여, MVC패턴으로 회원정보를 출력하세요
		 --%>
	<div class="container mt-3">
		<h2></h2>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container-fluid">
				<form method="post" class="d-flex align-items-center">
					<input type="text" class="form-control me-2" id="id"
						placeholder="아이디입력" value="${param.id}" name="id"
						aria-label="Search"> <input type="text"
						class="form-control me-2" id="pass" placeholder="비밀번호 입력"
						value="${param.pass}" name="pass" aria-label="Search">

					<button type="submit" class="btn btn-primary" style="width: 200px;">조회</button>
				</form>
			</div>
		</nav>

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
				<c:forEach var="m" items="${memList}">
					<tr class="text-center">
						<td>${m.id}</td>
						<td>${m.pass}</td>
						<td>${m.name}</td>
						<td>${m.point}</td>
						<td>${m.auth}</td>
						<td>${m.regdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>























