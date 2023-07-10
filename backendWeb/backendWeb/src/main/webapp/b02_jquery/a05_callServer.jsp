<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
	$(document).ready(function() {
		$("#regBtn").click(function() {
			var pnameVal = $("#product").val();
			$.ajax({
				url : "${path}/prod.do",
				data : $("#frm").serialize(),
				type : "post",
				dataType : "text",
				success : function(data) {
					console.log(data);
					alert(data);
				},
				error : function(err) {
					console.log("#Error Occurred");
					console.log(err);
				}
			});
		});
	});
</script>


</head>
<body>
	<div class="container mt-3">
		<h2>사원정보 등록</h2>
		<form id="frm" method="post">
			<div class="mb-3 mt-3">
				<label for="product">사원번호:</label> <input type="text"
					class="form-control" id="product" placeholder="물건명 입력"
					name="product">
			</div>
			<div class="mb-3 mt-3">
				<label for="price">사원번호:</label> <input type="text"
					class="form-control" id="price" placeholder="가격 입력" name="price">
			</div>
			<div class="mb-3 mt-3">
				<label for="cnt">사원번호:</label> <input type="text"
					class="form-control" id="cnt" placeholder="개수 입력" name="cnt">
			</div>
			<button type="button" id="regBtn" class="btn btn-primary"
				width="200px">등록</button>
		</form>
		<table class="table table-striped table-hover">
			<thead class="table-success">
				<tr class="text-center">
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody>
				<tr class="text-center">
					<td>John</td>
					<td>Doe</td>
					<td>john@example.com</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>