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
<%
	int grade = (int)(Math.random()*8+2);
	int cnt = (int)(Math.random()*9+1);
	int corNum = grade * cnt;
%>
<body>
    <div class="container mt-3">
       <h2>구구단</h2>
       <form action="" method="post">
            <div class="mb-3 mt-3">
            <input type="number" class="form-control" 
              value = "<%=grade%>" size = "1"> X
            <input type="number" class="form-control" 
               value = "<%=cnt%>" size = "1" > 
            <input type="number" class="form-control" 
               value = "" id = "inSum" size = "1" >
            </div>
            <div class="mb-3 mt-3">
            <button id ="rstBtn" type="button" class="btn btn-primary">정답확인</button>
            
        </form>
    </div>
    <script type = "text/javascript">
    var grade = <%=corNum%>
    	var rstBtn = document.querySelector("#rstBtn")
    	rstBrn.onclick = function() {
    		var inSumVal = document.querySelector("#inSum").value
    		if(corNum == inSumVal) {
    			alert("정답");
    		}else {
    			alert("오답");
    		}
    	}
    	/*
    	# front back 연결 코드
    	1. jsp로 html이 만들어진 결과로 
    	2. 화면단에서 처리된다는 내용 기억
    	*/
    </script>
</body>
</html>