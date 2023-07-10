<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "backendWeb.z01_vo.Salgrade"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
</head>
<%--
  <h1>Salgrade 등록</h1>
  <form id="salgradeForm">
    <div>
      <label for="grade">Grade:</label>
      <input type="number" name="grade" required>
    </div>
    <div>
      <label for="lowSal">Low Salary:</label>
      <input type="number" name="lowSal" required>
    </div>
    <div>
      <label for="highSal">High Salary:</label>
      <input type="number" name="highSal" required>
    </div>
    <button type="submit" >확인</button>
  </form>
 --%>
<body>
    <div class="container mt-3">
    	<h2>급여 등급 등록</h2>
    	<form action=""  method="post" >
    	<%--
    	required : 필수로 처리하여 입력이 되지 않았을 때,
    	submit가 처리되지 않게 한다.
    	
    	 --%>
    	<%
    	String gradeS = request.getParameter("grade");
    	int grade = 0;
    	if(gradeS!=null) grade = Integer.parseInt(gradeS);

    	String losalS = request.getParameter("losal");
    	int losal = 0;
    	if(losalS!=null) losal = Integer.parseInt(losalS);
    	String hisalS = request.getParameter("hisal");
    	int hisal = 0;
    	if(hisalS!=null) hisal = Integer.parseInt(hisalS);
    	//Vo 확인 class 만들기..

    	
    	//초기화면 구분..
      	if(gradeS!=null){
      		Salgrade sal = new Salgrade(grade,losal,hisal);
      		// log("문자열 타입") : jsp단에서 서버에 log에 나올 출력 처리.
      		//log(sal.getGrade()); 에러 발생..
      		log("등급:"+sal.getGrade());
      		log("최소:"+sal.getLosal());
      		log("최대:"+sal.getHisal());
      		
    	}  	
      	log("java단 종료");
    	%>
    	
         	<div class="mb-3 mt-3 ">
	            <label for="grade">등급:</label>
	            <input type="number" class="form-control" 
	      	     id="grade" placeholder="등급 입력" name="grade" required>
         	</div>
         	<div class="mb-3 mt-3">
            <label for="losal">최소값:</label>
            <input type="number" class="form-control" 
      	     id="losal" placeholder="최소값 입력" name="losal" required>
         	</div>  	         	
         	<div class="mb-3 mt-3">
            <label for="hisal">최대값:</label>
            <input type="text" class="form-control" 
      	     id="hisal" placeholder="최대값입력" name="hisal" required>
         	</div>
         	<button type="submit" class="btn btn-primary">등록</button>
     	</form>
    </div>
</body>
</html>