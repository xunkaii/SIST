<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<%--
# ajax front단 비동기옵션 처리와 Gson lib활용하여 json 데이터 가져오기
1. front단 비동기 처리
	xhr.onreadyStatechange=function(){
         xhr.readyState : 서버와 토인을 단계별로 코드값을 가져온다.
         0: 객체를 만든다
         1,2: 서버에서 데이터를 받을 준비
         3: 서버에서 데이터를 일부 받음
         4: 서버에서 데이터를 모두 받음
    xhr.status : http응답 코드 200~299(정상적으로 받음)
         일반적으로 200으로 설정. 안에서 정상적으로 데이터가 있을 때 처리한다.
         
    xhr.responseText를 이 핸들러 메서드 안에서 비동기식으로 받은 데이터를 처리한다.
    }
	

2. back단 Gson lib 활용하기
	1) 화면을 dao의 객체 tr/td로 만드는데
	2) json 데이터로 만들어서 전송하는 경우가 일반적이다
		Person					==> {"name":"홍길동","age":25,"loc":"서울"}
			name/age/loc
	3) Gson lib은 자동으로 처리해주는 패키지 class이다

# 처리 순서
1. 사용할 파일
	1) a11_Gson_Asyn_Ajax.jsp(프론트 처리)
	2) z11_memberCheck.jsp(백엔드 처리)
	
2. (백엔드처리) z11_memberCheck.jsp?id=himan
	1) 요청값 처리 
		String id = request.getParameter("id");
	2) Dao, VO, gson, import
		com.google.gson.Gson
	3) Member m = dao.checkMember(id)
	4) if(m != null)
			<%=gson.toJson(m)%>
	   else
	   	{"id":""}
	   	
3. (프런트처리)
	1) 화면 구형
		id: [   ] [등록여부확인] ==> 클릭시 이벤트 핸들러
	2) 이벤트핸들러 함수
		function asynAjx(page) {
			
			xhr.open("get", page, true)
			xhr.onreadystatechange = function() {
				if(xhr.status == 200&xhr.readyState == 4) {
					return xhr.responseText;
				}
			}
		}
		function checkMember() {
			var idVal = document.querySelector("#id")
			var  memObj = JSON.parse(asynAjx(page+"?id="idval))
			if(memObj.id != null) {
				alert(memObj.id+"는 등록된 아이디입니다")
			}else{
				alert(idVal+"는 등록가능합니다")
			}
		}
		
 --%>
 <script type = "text/javascript">
 	// 비동기처리 공통 ajax 모듈
 	function asynAjax(page){
 		var xhr = new XMLHttpRequest()
 		xhr.open("get", page, true) // 비동기옵션(true)
 		xhr.send()
 		var ret = ""
 		xhr.onreadystatechange = function() {
 			// 상태값을 확인해서 전송이 완료되고, 200(정상)일 때, 리턴 처리
 			if(xhr.readyState==4 && xhr.status == 200){
 				console.log(xhr.responseText);
 		 		var memObj = JSON.parse()
 		 		console.log(memObj)
 		 		if(memObj.id === "") {
 		 			alert (idObj.value + "은 사용가능한 아이디입니다")
 		 		} else {
 		 			alert(memObj.id + "이미 등록되어 있습니다\n 다른 아이디를 입력하세요")
 		 			idObj.value = ""
 		 			idObj.focus()
 		 		}
 				
 				
 			}
 		}
 		// return ret;
 	} 
 	function checkMember() {
 		var idObj = document.querySelector("#id");
 		// ajax 확인전, 공백이나 크기에 대한 check 후 ajax 처리 
 		
 		// alert("아이디 유효성check: " + idVal)
 		var page = "z11_memberCheck.jsp?id="+idObj.value
 		// asyGet(page)
 		var xhr = new XMLHttpRequest()
 		xhr.open("get",  page, true)
 		xhr.send()
 		xhr.onreadystatechange = function() {
 			if(xhr.readyState == 4 && xhr.status == 200) {
 				var memObj = JSON.parse(xhr.responseText)
				console.log(memObj)
		 		if(memObj.id === "") {
		 			alert (idObj.value + "은 사용가능한 아이디입니다")
		 		} else {
		 			alert(idObj.value + "이미 등록되어 있습니다\n 다른 아이디를 입력하세요")
		 			idObj.value = ""
		 			idObj.focus()
		 		}
 			}
 		}
 	}
 </script>
<body>
	<div class="container mt-3">
		<h2>회원정보 둥록</h2>
		<form action="" method="post">
			<div class="mb-3 mt-3">
				<label for="id">회원아이디:</label> <input type="text"
					class="form-control" id="id" placeholder="회원아이디 입력" name="id">
			</div>
			<button onclick="checkMember()" type="button" class="btn btn-success">아이디 유효성check</button>
			<div class="mb-3 mt-3">
				<label for="ename">사원명:</label> <input type="text"
					class="form-control" id="ename" placeholder="사원명 입력" name="ename">
			</div>
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