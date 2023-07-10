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

	a06_buyProdlist.jsp?name=사과&price=3000&name=바나나&price=4000&name=딸기&price=12000
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
<h2>구매내역</h2>
<table border width="30%">
	<tr><th>no</th><th>물건명</th><th>가격</th></tr> 
<%
	String names[]=request.getParameterValues("name");
	String prices[]=request.getParameterValues("price");
	int tot = 0;
	if(names!=null)
	for(int idx=0;idx<names.length;idx++){
		out.print("<tr>");
		out.print("<th>"+(idx+1)+"</th>");
		out.print("<th>"+names[idx]+"</th>");
		out.print("<th>"+prices[idx]+"</th>");
		out.print("</tr>");
		tot += Integer.parseInt(prices[idx]);
	}
%> 
	<tr><th colspan='2'>총비용</th><th><%=tot%></th></tr>
</table>

</body>
</html>