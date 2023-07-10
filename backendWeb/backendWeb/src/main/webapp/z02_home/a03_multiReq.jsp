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
?price=3000&cnt=3&price=3500&cnt=2&price=4000&cnt=3
깁밥의 가격과 갯수를 3종류를 요청값으로 받아서 
해당 내용의 계산 결과를 테이블에 총비용과 함께 출력하세요.
 --%>
<h2>김밥 계산서</h2>
<table width="40%" border> 
	<tr><th>no</th><th>가격</th><th>갯수</th></tr>
<%
// 장바구니에서 최종 결재할 내용을 check후, 결재 내역을 출력해서
// 화면에 표시할 때..
String []priceS = request.getParameterValues("price");
String []cntS = request.getParameterValues("cnt");
int tot=0;
if(priceS!=null){
	for(int idx=0;idx<priceS.length;idx++){
		int price = Integer.parseInt(priceS[idx]);
		int cnt = Integer.parseInt(cntS[idx]);
		out.print("<tr>");		
		out.print("<th>"+(idx+1)+"</th>");		
		out.print("<th>"+price+"</th>");		
		out.print("<th>"+cnt+"</th>");		
		out.print("</tr>");	
		tot+=price*cnt;
	}
}
%><tr><th colspan="2">총액</th><th><%=tot%></th></tr> 
</table> 

</body>
</html>