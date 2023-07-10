<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Insert title here</title>
    <script src = "https://code.jquery.com/jquery-3.7.0.js"></script>
        <script type = "text/javascript">
    	// window.onload와 동일한 메서드
    	$(document).ready(function(){
    		// $("선택").text : innerText와 동일
    		
    		$("h2").text("jquery 로딩 성공")
    	});
    </script>
</head>
<body>
<c:set var = "msg" value ="jstl로딩성공"/>
    <div class="container mt-3">
    <%--
    <c : set var = "변수명" value="데이터/>
    ex) 물건명 가격 개수 c:set으로 선언하고 출력처리
    scope = "session" 이동함 a02_show.jsp에서 확인
    --%>
    <c:set var = "msg" value="jstl로딩 성공"/>
    <c:set var = "num01" value="25"/>
    <c:set var = "num02" value="25"/>
    <c:set var = "tot" value="${num01*num02}"/>
    
    <c:set var = "item" value = "사과" scope = "session"/>
    <c:set var = "price" value = "1000" scope = "session"/>
    <c:set var = "cnt" value = "5" scope = "session"/>
    <c:set var = "tots" value = "${price * cnt}" scope = "session"/>
    
    
       <h3>사원정보 등록</h3>
       <h3>${msg}</h3>
       <h3>${num01 + num02}</h3>
       <h3>${tot}</h3>
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