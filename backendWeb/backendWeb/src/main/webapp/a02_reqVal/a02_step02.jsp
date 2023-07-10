<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
ex) 국어, 영어, 수학 점수를 받아서 총점/평균 처리.
1) 요청형식 설정
a02_step02.jsp?kor=70&eng=80&math=90
2) 변수 지정(문자형-요청값)
String korS = request.getParamter("kor"); 
String engS = request.getParamter("eng"); 
String mathS = request.getParamter("math"); 
3) 숫자형 변수 초기 0
int kor = 0, eng=0, math=0;
4) 조건문 null일 아닐 때, 형변환
if(korS!=null) kor = Integer.parseInt(korS);
if(engS!=null) eng = Integer.parseInt(engS);
if(mathS!=null) math = Integer.parseInt(mathS);
5) 총합 처리
int tot = kor + eng + math;

6) 평균 처리
int avg = tot/3;

7) 화면 출력 처리

 --%>
<%
String korS = request.getParameter("kor"); 
String engS = request.getParameter("eng"); 
String mathS = request.getParameter("math");
int kor = 0, eng=0, math=0;
if(korS!=null) kor = Integer.parseInt(korS);
if(engS!=null) eng = Integer.parseInt(engS);
if(mathS!=null) math = Integer.parseInt(mathS);
int tot = kor + eng + math;
int avg = tot/3;
%>
<h2>숫자형 데이터 요청값 처리</h2>
<h3>국어:<%=kor %></h3>
<h3>영어:<%=eng %></h3>
<h3>수학:<%=math %></h3>
<h3>총점:<%=tot %></h3>
<h3>평균:<%=avg %></h3>


</body>
</html>