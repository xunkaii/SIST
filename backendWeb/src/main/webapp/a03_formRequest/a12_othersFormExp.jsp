<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
 <title>Insert title here</title>
</head>
<body>

<div class="container mt-3">
  <h2 style="text-align:center;">사원정보등록</h2>
  
  <form action="a13_insertEmp.jsp">
    <div class="mb-3 mt-3">
      <label for="empno">사원번호</label>
      <input type="text" class="form-control" id="empno" placeholder="사원번호 입력" name="empno">
    </div>
    <div class="mb-3">
      <label for="ename">사원명</label>
      <input type="text" class="form-control" id="ename" placeholder="사원명 입력" name="ename">
    </div>
    <div class="mb-3 mt-3">
      <label for="job">직책명</label>
      <select class="form-control" id="job" name="job">
         <option>=직책명선택=</option>
         <option>ANALYST</option>
         <option>CLERK</option>
         <option>SALESMAN</option>
         <option>MANAGER</option>
         <option>PRESIDENT</option>
      </select>
    </div>
     <div class="mb-3 mt-3">
      <label for="mgr">관리자</label>
      <select class="form-control" id="mgr" name="mgr">
         <option value="0000">관리자선택</option>
         <option value="7566">JONES</option>
         <option value="7698">BLAKE</option>
         <option value="7782">CLARK</option>
         <option value="7902">FORD</option>
         <option value="7839">KING</option>
      </select>
     </div>
     <div class="mb-3 mt-3">
      <label for="hiredateS">입사일</label>
      <input type="date" class="form-control" id="hiredateS" placeholder="입사일 선택" name="hiredateS">
    </div>
    <div class="mb-3 mt-3">
      <label for="sal">급여</label>
      <input type="number" class="form-control" id="sal" placeholder="급여선택" name="sal">
    </div>
    <div class="mb-3 mt-3">
      <label for="comm">보너스</label>
      <input type="number" class="form-control" id="comm" placeholder="보너스선택" name="comm">
    </div>
    <%
    String [][] depts = {{"10","ACCOUNTING"},{"20", "RESEARCH"},{"30","SALES"},{"40","OPERATIONS"}};
    %>
    <div class="mb-3">
    <label for ="deptno">부서:</label>
      <label class="form-check-label">
      <%for(String[] dept: depts){ %>
      <input type="radio"  name="deptno" class="form-check-input" value="<%=dept[0]%>"><%=dept[1]%>
      <%} %>
      </label>
    </div>
    <button type="submit" class="btn btn-primary">등록</button>
  </form>
</div>
</body>
</html>