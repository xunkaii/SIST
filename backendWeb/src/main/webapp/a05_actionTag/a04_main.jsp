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
if(mathS != null) math = Integer.parseInt(mathS);

int tot = kor + eng + math;
%>

<body>
    <div class="container mt-3">
     	<jsp:include page = "a05_sub.jsp">
      		<jsp:param name = "name" value = "<%=name %>"/>
      		<jsp:param name = "kor" value = "<%=kor %>"/>
      		<jsp:param name = "eng" value = "<%=eng %>"/>
      		<jsp:param name = "math" value = "<%=math %>"/>
      		
      	</jsp:include>
    </div>
</body>
</html>