<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--
# 다중의 데이터 요청값 받기.
1. 형식
	받을페이지?key1=값1&key1=값2&key1=값3
	1) 요청값 처리 객체 
		String arry[]=request.getParameterValues("key1");
	2) 실무 유형
		- 구매한 물건을 여러 개 등록하는 경우
		- 구매한 갯수를 여러 개 등록하는 경우
		- 좋아하는 옵션을 여러개 등록할 때, check가 된 것만 등록하는 경우
	
# 여러 유형 데이터 받기 정리
1. default 문자열받기
2. 숫자형(정수형/실수형)
3. boolean형 받기.
 --%>
</head>
<body>
	<h1>구매한 과일!!</h1>
	<%
	// 페이지?fruits=사과&fruits=바나나&fruits=딸기
	String fruits[] = request.getParameterValues("fruits");
	if(fruits!=null){
		for(String fruit:fruits){
			out.print("<h2>"+fruit+"</h2>");
		}
	}
	// ex) 가입할 회원의 id들...반복문을 통해서 
    //     1) @@@
    //     2) @@@
    //     3) @@@   넘버링되어 출력하게하세요.
	// ?member=himan&member=goodMan&member=higirl
	%>
	<h1>가입한 회원 id</h1>
	<%
	String members[] = request.getParameterValues("member");
    if(members!=null){
    	for(int idx=0;idx<members.length;idx++){
    		out.print("<h2>"+(idx+1)+") "+members[idx]+"</h2>");
    	}
    }
	%>
	<h2>구매한 물건들의 가격과 총계</h2>
	<%
	// ?price=3000&price=2000&price=1000
	String pricesS[] = request.getParameterValues("price");
	int tot = 0;
	if(pricesS != null){
		for(int idx=0;idx<pricesS.length;idx++){
			int price = Integer.parseInt( pricesS[idx] );
			out.print("<h2>"+(idx+1)+") "+price+"</h2>");
			tot+=price;
		}
	}
	%>
	<h2>총계:<%=tot%></h2>	
	<%-- a06_buyProdlist.jsp
	ex) 물건명=@@@&가격=@@@&물건명&가격=@@@.....
	물건명배열, 가격배열을 따로 받아서.
		테이블로 
		구매내역..
		no  물건명  가격
		1	@@@    @@
		2	@@@    @@
		3	@@@    @@
		4	@@@    @@
		   총비용 @@
	 --%>	
	



</body>
</html>