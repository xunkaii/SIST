<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<%--

 --%>
</head>
<body>
	<div class="container mt-3">
		<h2>사원정보 등록</h2>
		<table class="table table-striped table-hover">
			<tbody>
				<tr class="text-center">
					<c:forEach var="cnt" begin="1" end="10">
						<td>${cnt}</td>
					</c:forEach>
				</tr>
			</tbody>
		</table>
		<table class="table table-striped table-hover">
			<tbody>
				<tr class="text-center">
					<c:forEach var="cnt" begin="5" end="30" step = "3">
						<td>${cnt}</td>
					</c:forEach>
				</tr>
			</tbody>
		</table>
		<%
		request.setAttribute("rainbow",
				new String[] {"red", "orange", "yellow","green", "blue", "navy", "purple"});
		%>
		<table class="table table-striped table-hover">
			<tbody>
				<tr class="text-center">
					<c:forEach var="color" items ="${rainbow}">
						<td style = "background-color:${color}">${color}</td>
					</c:forEach>
				</tr>
			</tbody>
		</table>		
		<%--
		ex1) 3의 배수를 3부터 51까지 출력하새요
		ex2) 가위,바위,보르 배열로 선언하여 출력하세요
		 --%>
		<table class="table table-striped table-hover">
			<tbody>
				<tr class="text-center">
					<c:forEach var="cnt" begin="3" end="51" step = "3">
						<td>${cnt}</td>
					</c:forEach>
				</tr>
			</tbody>
		</table>
		
		<%
		request.setAttribute("rsp", 
				new String[] {"가위","바위","보"});
		%>
		<%--
		<c:forEach>의 옵션
		1. index : 루프 실행에서 현재 인덱스, count(루프실행횟수)
		2. begin : 시작 속성, end : 마지막 속성, step : 증/감속성
		3. first : 현재 실행이 루프의 첫번째 실행인 경우 true
		4. last : 현재 실행이 루프의 마지막 실행인 경우 true
		 --%>
				<table class="table table-striped table-hover">
			<tbody>
				<tr class="text-center">
					<c:forEach var="rsp" items="${rsp }">
						<td>${rsp}</td>
					</c:forEach>
				</tr>
			</tbody>
		</table>
				<table class="table table-striped table-hover">
			<tbody>
				<tr class="text-center">
					<c:forEach varStatus="sts" var = "scissor" items="${rsp}">
						<td>[${sts.index}] ${sts.count}
							${scissor}
							${sts.first}/${sts.last}</td>
					</c:forEach>
				</tr>
			</tbody>
		</table>		
	</div>
</body>
</html>