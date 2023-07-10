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
	<div class="container mt-3">
		<h2>회원정보 등록</h2>
		<%--
    	ex) 회원정보(회원아이디, 패스워드, 이름, 권한, 포인트)를 요청값을 처리하는 form을 만들고
    	useBean으로 등록하여 출력되게 하세요
    	 --%>
		<form action="" method="post">
			<div class="mb-3 mt-3">
				<label for="id">아이디:</label> <input type="text" class="form-control"
					id="id" placeholder="아이디 입력" name="id">
			</div>
			<div class="mb-3 mt-3">
				<label for="pass">비밀번호:</label> <input type="text"
					class="form-control" id="pass" placeholder="비밀번호 입력" name="pass">
			</div>
			<div class="mb-3 mt-3">
				<label for="name">이름:</label> <input type="text"
					class="form-control" id="name" placeholder="이름 입력" name="name">
			</div>

			<div class="mb-3 mt-3">
				<label for="auth">권한:</label> <input type="text"
					class="form-control" id="auth" placeholder="권한 입력" name="auth">
			</div>
			<div class="mb-3 mt-3">
				<label for="point">포인트:</label> <input type="number"
					class="form-control" id="deptno" placeholder="포인트 입력"
					name="point">
			</div>
			<button type="submit" class="btn btn-primary">등록</button>
		</form>
		<jsp:useBean id = "member" class = "backendWeb.z01_vo.Member"></jsp:useBean>
		<jsp:setProperty property = "*" name = "member"/>
		<table class="table table-striped table-hover">
			<thead class="table-success">
				<tr class="text-center">
					<th>아이디</th>
					<th>패스워드</th>
					<th>이름</th>
					<th>권한</th>
					<th>포인트</th>
				</tr>
			</thead>
			<tbody>
				<tr class="text-center">
					<td>${member.id }</td>
					<td>${member.pass }</td>
					<td>${member.name}</td>
					<td>${member.auth}</td>
					<td>${member.point}</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>