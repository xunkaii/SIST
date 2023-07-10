<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
</head>
<body>
    <div class="container mt-3">
    	<h2>구구단 문제</h2>
    	<%
    	int rgrade = (int)(Math.random()*8+2);
    	int rcnt = (int)(Math.random()*9+1);
    	%>
    	<form class="form" action="" method="post">
    	    <div class="mb-3 mt-3 d-inline-flex">
	            <input type="text" name="grade" class="form-control w-25" 
	      	     id="grade"  value="<%=rgrade%>" size="1"  >  
	      	     <span class="input-group-text">x</span>
	      	    <input type="text"  name="cnt" class="form-control w-25" 
	      	     id="cnt"  value="<%=rcnt%>" >  
	      	    <span class="input-group-text">=</span> 
	            <input type="text"  name="result" class="form-control w-25" 
	      	     id="result"  value="">  	
	         	<button type="submit" class="btn btn-primary w-25">정답확인</button>
         	</div>
     	</form>
      	<%
		String gradeS = request.getParameter("grade");      	
		String cntS = request.getParameter("cnt");
		String resultS = request.getParameter("result");
		if(resultS!=null&&!resultS.equals("")){
			int grade = Integer.parseInt(gradeS);	
			int cnt = Integer.parseInt(cntS);
			int result = Integer.parseInt(resultS);
			if(grade*cnt == result){
		%>
			<jsp:forward page="a09_cor.jsp"/>
		<%
			}else{
		%>
			<script>
				alert('오답\n다시 풀어보세요');
				// 이전 페이지에 입력되어 전달한 값을 DOM의 속성으로 할당. 
				document.querySelector("#grade").value="<%=gradeS%>";
				document.querySelector("#cnt").value="<%=cntS%>";
			</script>
		<%		
			}
      	%>
      	<%}%>
      	<script type="text/javascript">
      		document.querySelector("#result").focus();
      	</script>
    </div>
</body>
</html>