<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
    import="backendWeb.z01_vo.Book"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
실습예제1) jsp 스크립트릿에서 조건문을 활용하여 테이블로 
홀/짝을 만들어서 정답을 클릭했을 때, 임의의 정답/오답으로 처리되게 하세요
	1) 화면 구성
	2) 구슬게임
		1 ~ 6개 임의의 구슬 잡기
		if문과 % 연산자에 의해 홀/짝 결과 처리
		
	3) 화면에 js에 위 내용에 따른 결과 alert로 처리
		홀짝 이벤트로 맞을 때, 구슬 개수와 답 출력
		함수를 정의 (구슬의 개수, 홀짝정보, 정답여부 전달)
		이벤트 호출
		
		
 --%>
 <script type = "text/javascript">
 	function call(cnt,rst,isCor){
 		if(isCor) {
 			alert(rst + "승리입니다 구슬의 갯수:" + cnt);
 		} else {
 			alert(rst + "패배입니다 구슬의 갯수:" + cnt);
 		}
 	}
 </script>
 <%
 	int marCnt = (int)(Math.random()*6 + 1);
 	String rst = marCnt%2==0? "짝" : "홀";
 	
 %>
 
 <h2>홀/짝 맞추어 보세요</h2>
 <table width = "30%"  height = "100pt" border>
<%--
js와 jsp 연동 처리시 주의 사항
 	1. 숫자형/boolean 데이터 : '' 없이 그대로 할당 
 		ex) 변수명 = <%=%>
 	2. 문자열 데이터는 : 반드시 '',""에 할당해서 입력
 		ex) 변수 = '<%=자바변수%>'  
--%>
 	<tr><th onclick = "call(<%=marCnt%>,'홀','<%=rst%>'=='홀')">홀</th>
 	
 	<th onclick = "call(<%=marCnt%>,'짝','<%=rst%>'=='짝')">짝</th></tr>
 </table>

	<%-- 
실습예제2) jsp 스크립트릿에서 조건문/반복문을 활용하여 4행 4열을 만들어 3/6/9게임의 내용을 1~16까지 내용으로 표시하세요
 --%>
 <form>
	<table border width = "40%">
			<%
			// out.print("태그") : 화면 출력하는 jsp out 객체의 print 메서드
			for(int i = 1; i<=16; i++) {
				if(i%4==1) out.print("<tr>");
				out.print("<td>");
				out.print(i%10!=0 && i%10%3==0 ? "짝" : i);
				out.print("</td>");
				if(i%4==0) out.print("</tr>"); 
					
			}
			%>
			<tr>
	</table>
</form>
	<%-- 
실습예제3) 도서 대출 정보를 VO로 만들어 화면에 표시할 때, 테이블로 화면에 출력하세요.
 --%>
	<%
	Book b = new Book("총,균,쇠", 152424 - 123, "2023/06/12", "2023/06/19");
	%>

	<table border>
		<col width=30%>
		<col width=30%>
		<tr>
			<th>도서명</th>
			<th>일련번호</th>
			<th>대출일자</th>
			<th>반남일자</th>
		</tr>
		<tr>
			<th><input type="text" value="<%=b.getBname()%>"></th>
			<th><input type="text" value="<%=b.getSerinum()%>"></th>
			<th><input type="text" value="<%=b.getBorrowdate()%>"></th>
			<th><input type="text" value="<%=b.getReturndate()%>"></th>
		</tr>
	</table>
</body>
</html>