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
String name = request.getParameter("name");
if(name == null) name = "";

String korS = request.getParameter("kor");
int kor = 0;
if(korS != null) kor = Integer.parseInt(korS);

String engS = request.getParameter("eng");
int eng = 0;
if(engS != null) eng = Integer.parseInt(engS);

String mathS = request.getParameter("math");
int math = 0;
if(mathS != null) math = Integer.parseInt(mathS);;

int tot = kor + eng + math;
%>
<body>
    <div class="container mt-3">
     	<form method="post">
            <div class="mb-3 mt-3">
            <label for="name">이름:</label>
            <input type="text" class="form-control" 
              id="name" value = "<%=name%>" placeholder="이름 입력" name="name">
            </div>
            
            <div class="mb-3 mt-3">
            <label for="kor">국어:</label>
            <input type="text" class="form-control" 
              id="kor" value = "<%=kor%>" placeholder="국어 입력" name="kor">
            </div>
            
            <div class="mb-3 mt-3">
            <label for="eng">영어:</label>
            <input type="text" class="form-control" 
              id="eng" value = "<%=eng%>" placeholder="영어 입력" name="eng">
            </div>

            <div class="mb-3 mt-3">
            <label for="math">수학:</label>
            <input type="text" class="form-control" 
              id="math" value = "<%=math%>" placeholder="수학 입력" name="math">
            </div>

            <button type="submit" class="btn btn-primary">등록</button>
        </form>
        
     	<table class="table table-striped table-hover">
         <thead class="table-success">
               <tr  class="text-center">
                <th>이름</th>
                <th>국어</th>
                <th>영어</th>
                <th>수학</th>
                <th>평균</th>
               </tr>
          </thead>
          <tbody>
               <tr class="text-center">
                 <td><%=name %></td>
                 <td><%=kor%></td>
                 <td><%=eng %></td>
                 <td><%=math %></td>
                 <td><%=tot/3 %></td>
               </tr>
          </tbody>
      </table>         
    </div>
</body>
</html>