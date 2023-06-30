<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>좋아하는 음식(선택완료)</h2>
<%
String foods[] = request.getParameterValues("food");
if(foods != null) {
	for(int idx = 0; idx<foods.length; idx++) {
		out.print("<h3>" + (idx+1) + ") "  +foods[idx] + "</h3>");
	}
} else {
	out.print("<h2> ,,, </h2>");
}
%>

<h3> 내가 살았던 지역(선택완료)</h3>
<% 
// ex) 살았던 지역 서울 경기 인천 강원도 충청도 경상도 전라도 제주도
String locs[] = request.getParameterValues("loc");
if(locs!=null)
	for(int idx=0;idx<locs.length;idx++){
		if(locs[idx]!=null && !locs[idx].equals(""))
			out.print("<h3>"+(idx+1)+") "+locs[idx]+"</h3>");
	}
%>
</body>
</html>