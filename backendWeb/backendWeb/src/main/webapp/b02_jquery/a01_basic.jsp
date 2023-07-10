<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var = "path" value = "${pageContext.request.contextPath}"/>
<%--
pageContext.request.contextPath
: 웹서버와 연동된 프로젝트명으로 default webapp위치를 잡아준다
: 프로젝트명이 다를지라도 webapp 하위의 여러 자원들을 절대 경로로 접근이 가능하다
 --%>

<fmt:requestEncoding value="utf-8"/>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
   
    <script src = "https://code.jquery.com/jquery-3.7.0.js" type="text/javascript"></script>
    
    <script type="text/javascript">
    	// window.onload와 동일한 메서드
    	$(document).ready( function(){
    		
    		$("h2").text("jquery 로딩 성공")
    		// 모든 h2가 클릭이 되면
    		$("h2").click(function() {
    			// $(this) : 클릭한 html의 레이블이 클릭되었습니다
    			$(this).text("클릭되었습니다.");
    			$("h3").text("모든 h3 글자 변경")
    		})
    	});
    	// ex) p를 5개 만들고 클릭해보세요 출력 클릭시, touch me? 클릭한 것만
    	$(document).ready(function() {
    		$("p").text("클릭해보세요")
    		$("p").click(function(){
    			$(this).text("touch me");
    		})
    	});
    	/*
    	# jquery 선택자
    	1. $("선택자")
    		단일 선택으로 처리할 수 있고
    		동일한 태그에 모든 기능을 처리할 때도 for문 없이도 가능하다
    		$("h1").text("일괄변경")
    		h1이 여러 개 있더라도 한꺼번에 모두다 label을 일괄변경이 가능하다
    		$("h1").eq(index번호).text("특정 내용변경")
    		$("h1").eq(0).text("첫번째 내용 변경")
    		
    	# 레이블 변경
    	1. innerText ==> 
    		$("선택자").text("변경할데이터")
    		$("선택자").text()
    	2. innerHTML
    		$("선택자").html("<h2>안녕</h2>")	
    		$("선택자").html()
    	3. value
    		$("[name=name]").val("할당")
    		$("[name=name]").val()
    	4. 기본속성
    		1) align = "center" img = "a01_img.jpg"
    			$("선택자").attr("align", "center")
    			$("선택자").attr("img", "a01_img.jpg")
    	5. style 속성
    		1) style = "background:red; color:blue;"
    			$("선택자").css("background", "red")
    			$("선택자").css("color", "blue")
    			$("선택자").css({
    				background:"red",
    				color:"blue"
    			})
    	# 이벤트
    	$("선택자").이벤트명(익명함수);
    			$("h1").click(function(){
    					// this: h1 중에서 클릭한 대상 객체
    					$(this).css("background", "yellow")
    			});
    			
    	*/
    	
    </script>      
    
    
</head>
<body>
    <div class="container mt-3">
    	<h2>사원정보 등록</h2>
    	<h2>사원정보 등록</h2>
    	<h2>사원정보 등록</h2>
    	<h2>사원정보 등록</h2>
    	<h2>사원정보 등록</h2>
    	<h2>사원정보 등록</h2>
    	<h3>dd</h3>
    	<h3>dd</h3>
    	<h3>dd</h3>
    	<h3>기본경로:${path}</h3>
    	<%--/backendWeb/ : webapp 경로와 동일 절대 경로 --%>
    	<img src = "/backendWeb/z01_upload/sample.png" width = "100px" height = "100px">
    	<form action="" method="post">
         	<div class="mb-3 mt-3">
            <label for="empno">사원번호:</label>
            <input type="number" class="form-control" 
      	     id="empno" placeholder="사원번호 입력" name="empno">
         	</div>
         	<div class="mb-3 mt-3">
            <label for="ename">사원명:</label>
            <input type="text" class="form-control" 
      	     id="ename" placeholder="사원명 입력" name="ename">
         	</div>
         	<button type="submit" class="btn btn-primary">등록</button>
     	</form>
		<table class="table table-striped table-hover">
			<thead class="table-success">
		      	<tr  class="text-center">
				    <th>Firstname</th>
				    <th>Lastname</th>
				    <th>Email</th>
		      	</tr>
		    </thead>
		    <tbody>
			   	<tr  class="text-center">
			        <td>John</td>
			        <td>Doe</td>
			        <td>john@example.com</td>
			   	</tr>
		 	</tbody>
		</table>      	
    </div>
</body>
</html>