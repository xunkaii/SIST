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
    <%
    // DB에서 가져온 데이터..
    String name = "사과";
    int price = 2000;
    int cnt = 5;
    %>
    <script type="text/javascript">
    var name = "<%=name%>"
    var price = <%=price%>
    var cnt = <%=cnt%>
    function check01(){
    	alert(name)
    }
    function check02(){
    	alert(price)
    }
    function check03(){
    	alert(cnt)
    }
    function check04(){
    	var tot = price*cnt;
    	if(tot>=50000){
    		alert(tot+" 고가")	
    	}else{
    		alert(tot+" 저가")
    	}   	
    }
    
    </script>
</head>
<body>
    <div class="container mt-3">
    	<h1>구매 정보</h1>
    	<h2 onclick="check01()">물건명 확인</h2>
    	<h2 onclick="check02()">가격 확인</h2>
    	<h2 onclick="check03()">갯수 확인</h2>
    	<h2 onclick="check04()">고가 여부</h2>
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