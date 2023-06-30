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
<script>

</script>
<%--
1. ajax처리 순서를 기술하세요(h01_show.jsp vs z11_data.jsp 두 페이지간 기준)

2. ajax로 [화면호출]로 서버에 있는 <h3>반가워요</h3> 처리

2. ajax로 물건명[  ]가격[   ][전송 및 화면호출]로 서버에 있는 <h3>@@는 @@@원입니다.</h3> 

2. ajax로 [데이터화면호출]로 서버에 table형식의 화면 호출(DAO - public List<Manager> getManager())
	// 함수 호출
	function getSyn(page) {
		var xhr = new XMLHttpRequest();
		xhr.open("get", page, false);
		xhr.send();
		return xhr.responseText;
	}
	
	// JSON 함수 가져오기
	function callAjx() {
		var empnoVal = document.querySelectorAll("#empno").value;
		var enameVal = document.querySelectorAll("#ename").value;
		var dnameVal = document.querySelectorAll("#dname").value;
		var page = "z06_reqJson.jsp?=empno" + empnoVal + "&ename=" + enameVal + "&dname=" + dnameVal
		var empObj = JSON.parse(getSyn(page))
		var tdArr = document.querySelectorAll("#empbody td")
		tdArr[0].innerText = empObj.empno
		tdArr[1].innerText = empObj.ename
		tdArr[2].innerText = empObj.dname
	}
	
		<div class="mb-3 mt-3">
			<label for="empno">사원번호:</label> <input type="number"
				class="form-control" id="empno" placeholder="사원번호 입력" name="empno">
		</div>
		<div class="mb-3 mt-3">
			<label for="ename">사원명:</label> <input type="text"
				class="form-control" id="ename" placeholder="사원명 입력" name="ename">
		</div>
		<div class="mb-3 mt-3">
			<label for="dname">부서명:</label> <input type="text"
				class="form-control" id="dname" placeholder="부서명 입력" name="dname">
		</div>
		
		<button type="button" onclick="callAjx()" class="btn btn-primary">호출</button>
	</form>
	<table class="table table-striped table-hover">
		<thead class="table-success">
			<tr class="text-center">
				<th>사원번호</th>
				<th>사원명</th>
				<th>부서명</th>
			</tr>
		</thead>
		<tbody id="empBody">
			<tr id="" class="text-center">
				<td>John</td>
				<td>Doe</td>
				<td>john@example.com</td>
			</tr>
		</tbody>
	</table>
	
	//
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	{"empno":${param.empno},"ename":"${param.ename}","dname":"${param:dname}"}	
	
	
3. ajax로 id[  ]pass[  ] [로그인]  table형식으로 회원이 없던지 table로 출력
 --%>
<body>
    <div class="container mt-3">
       <h2>사원정보 등록</h2>
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