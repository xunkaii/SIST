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
<body>
<%--
실습과제
1. 요청값과 다중데이터 처리, form 형식 처리, form의 여러가지 형식에 따른 처리를 
조원들과 함께 먼저 정리후 아래 문제를 풀어 보세요.
	요청값과 다중데이터 처리
		- getparameter로 가져오는거
		- select / checkbox 같은 경우로 여러개를 가져오는거
		- 다중데이터는 배열 형태로 서버에서 받는다
		- 서버에서는 받은 배열을 순회하면서 각각의 값을 처리할 수 있다
		  if(req != null)
		  	for(int idx = 0; idx<req.length; idx++) {
		  		if(res
		  		문자열일 때 res[idx]
		  		숫자형일 때 int 숫자변수 = Integer.parseInt(res[idx])
		  	}
	form 형식
		- 대표적인 형식에는 텍스트 입력란(input type = "")
		
		
	여러가지 형식
		
2. form형식으로 다중 처리하는 예제를 아래 3가지 형식으로 선언하고 다음 페이지에 출력하세요
	   1) 구매할 물건명 입력(type=text)
	   2) 결재할 물건의 가격(type=checkbox) : 선택된 것만
	   3) select로 구매할 물건의 가격 : ctrl로 선택된 것만
3. bootstrap형식으로 회원등록 화면 form 만들고, 등록시, 요청값 받아 VO객체로 생성 및 
   출력한 내용을 처리하세요.
 --%>
<%
String[] prices = {"1000", "2000", "3000", "4000"};
%>
    <h2>구매할 물건 및 가격</h2>
    <form action = "0619_quiz3.jsp">
    	물건명:<input type = "text" name = "item"><br>
    	
    	물건의 가격:<%for(String price : prices) { %>
    		<input type = "checkbox" name = "price" value="<%=price %>"/><%=price %>
    	<%} %><br>
    	
    	구매할 물건의 가격
    	<select name = "price2" multiple>
    		<%for(String price2 : prices) {%>
    			<option><%=price2 + "[ctrl]" %></option>
    		<%} %>
    	</select><br>
    	<input type = "submit" value = "제출">
    </form>
    


</body>
</html>