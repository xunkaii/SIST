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
ex) 국어, 영어, 수학, 점수를 받아서 총점/평균

1) 요청 형식 설정
a02_reqVal/a02_step02.jsp?
2) 변수 지정(문자형-요청값)
String korS = request.getParameter("kor");
String engS = request.getParameter("eng");
String mathS = request.getParameter("math");

3) 숫자형 변수 초기 0
int kor = 0; eng = 0; math = 0;

4) 조건문 null 아닐때, 형변환
if (korS != null) kor = Integer.parseInt(korS);
if (engS != null) eng = Integer.parseInt(engS);
if(mathS != null) math =  Integer.parseInt(mathS);

5) 총합 처리
 int tot = kor + eng + math;
 
6) 평균 처리
int avg = tot/3;

7) 화면 출력 처리
 --%>
 
 <%
 String korS = request.getParameter("kor");
 int kor = 0;
 if (korS != null) kor = Integer.parseInt(korS);
 
 String engS = request.getParameter("eng");
 int eng = 0;
 if (engS != null) eng = Integer.parseInt(engS);

 String mathS = request.getParameter("math");
 int math = 0;
 if(mathS != null) math = Integer.parseInt(mathS);
 
 int tot = kor + eng + math;
 int avg = tot/3;
 %>
 
<h2>숫자형 데이터 요청값 처리</h2>
<h2>국어: <%=kor %></h2>
<h2>영어: <%=eng %></h2>
<h2>수학: <%=math %></h2>
<h2>총점: <%=tot %></h2>
<h2>평균: <%=avg %></h2>
</body>
</html>