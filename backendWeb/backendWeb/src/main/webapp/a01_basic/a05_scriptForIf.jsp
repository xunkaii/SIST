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
# 반복문과 조건문 활용
1. 여러가지 유형의 script를 통한 java/html 코드를 처리할 수 있다.
2. 반복문과 조건문을 활용하면, 로직에 의한 여러가지 형태의 화면을 구현이
	가능하다.
3. 주로 사용되는 연산식
	1) 비교연산자 ==, !=
	2) 논리연산자 &&, ||, !
	3) 사칙연산자(나머지연산자)
		% : 반복문에서 주로 특정한 index의 구분코드를 반복적으로
		처리하여 화면을 구현할 때 사용된다.
		<tr>을 특정 조건에 따른 사용
		if(cnt%4==1) 
	4) 문자열 비교
		equals() :정확하게 같을 때, 
		indexOf() : 포함되어 있을 때
	5) 숫자 비교
	
4. 처리 유형 형태
	1) 기본 로직을 이용한 반복문/조건문 처리
	2) 반복문 밖에 전역변수를 활용하여 처리하는 형태
 --%>
<%-- 1~10까지 출력하되 총합산을 마지막에 출력 하세요
	출력형태 1 + 2  + 3....... = 총합..
 --%> 
 	<h2>
 	<%--
 	1. java 코드로 처리
 	2. <%%> 처리할 내용, <%=%>을 구분, 화면을 처리할 부분.
 	 --%>
	<%
	int tot = 0;
	for(int cnt=1;cnt<=10;cnt++){
		tot+=cnt;
	%> 
		<%=cnt%>
	<%
		if(cnt==10){
	%>
			= <%=tot%>
	<%	}else{
	%>
			+
	<%	
		}
	}
	%>
		
	</h2>
	<%
	int rGrade = (int)(Math.random()*8+2);
	%>
	<table border width="20%">
		<tr><th><%=rGrade%>단</th></tr>
		<%for(int cnt=1;cnt<=9;cnt++){ %>
		<tr><th><%=rGrade %> X <%=cnt %> = <%=rGrade*cnt %></th></tr>
		<%} %>
	</table>
	<%-- ex1)  반복문을 활용하여 임의의 구구단을 설정하고,
			  테이블을 통해서 출력하세요
			  @@ 단			  
			  @ X 1 = @@
			  @ X 2 = @@
			  @ X 3 = @@
			  @ X 4 = @@
			  ...
	--%>
	<%
	 
	%>
	<table width="20%" border>
		<tr><th>no</th><th>구분</th></tr>
		<%for(int cnt=1;cnt<=10;cnt++){ 
			int rNum =(int)(Math.random()*10+1);
		%>
		<tr><th><%=cnt %></th>
			<th><%=rNum%2==0?"짝수":"홀" %></th></tr>
		<%}%>
	</table>
	<%--		  
		  ex2) 홀수/짝수 표시
		  	  1~10 출력		  	  
		  	  no  구분
		  	  1   홀수
		  	  2   짝수
		  	  3   홀수
		  	  ..
		  	  10  짝수	
		  ex3) form 화면에서
		       테이블로  학번 국어  영어   수학   평균 
		                1  [70] [80]  [90] 
		                
		  	   점수부분은 <input 형식을 value값에 점수가 입력되어
		  	   출력되게 하고. 반복문을 통해서 학생 5명을 출력하되
		  	   점수는 임의로 0~100사이에 나오게 하세요
	  --%>
	  <form>
	  	<table border width="40%">
			<tr><th>학번</th><th>국어</th><th>영어</th><th>수학</th><th>평균</th></tr>
			<%
			int sum =0;
			for(int cnt=1;cnt<=5;cnt++){ 
				int kor = (int)(Math.random()*101);
				int eng = (int)(Math.random()*101);
				int math = (int)(Math.random()*101);
				int avg = (kor+eng+math)/3;
				sum += avg;
			%>	  	
			<tr><th><%=cnt %></th>
				<th><input type="text" size="2" value="<%=kor%>"></th>
				<th><input type="text" size="2" value="<%=eng%>"></th>
				<th><input type="text" size="2" value="<%=math%>"></th>
				<th><%=avg%></th></tr>
			<%}%>
			<tr><th colspan="4">총평균</th><th><%=sum/5%></th></tr>		  	
	  	</table>
	  </form>

	
	

</body>
</html>