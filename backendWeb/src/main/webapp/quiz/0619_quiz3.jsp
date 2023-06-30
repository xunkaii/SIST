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
<% 
String itemS = request.getParameter("item");
if(itemS == null) itemS = "";
%>
<h2>구매한 물건명: <%=itemS %></h2>
<%
String prices[] = request.getParameterValues("price");
if( prices != null) {
	for(int idx = 0; idx<prices.length; idx++) {
		out.print("<h3>" + (idx+1) + ") " + prices[idx] + "</h3>");
	}
}

String price2[] = request.getParameterValues("price2");
if(price2 != null) {
	for(int idx = 0; idx<price2.length; idx++) {
		out.print("<h3>" + (idx+1) + ") " + price2[idx] + "</h3>");
	}
}
%>


</body>
</html>