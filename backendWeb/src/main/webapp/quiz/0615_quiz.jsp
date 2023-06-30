<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "backendWeb.z01_vo.Kimbap"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
// -- 4. 깁밥의 가격과 갯수를 3종류를 요청값으로 받아서 
// 해당 내용의 계산 결과를 테이블에 총비용과 함께 출력하세요.
String name[] = request.getParameterValues("name");
String price[] = request.getParameterValues("price");
String cnt[] = request.getParameterValues("cnt");
int tot = 0;
%>
<table width = "30%" border>
<tr><th>김밥종류</th><th>가격</th><th>개수</th><th>합계</th></tr>
<%
if(name!=null){
	for(int idx=0; idx<name.length;idx++){
		%>
		<tr><td><%=name[idx] %></td><td><%=price[idx]%></td><td><%=cnt[idx]%></td><td><%=Integer.parseInt(price[idx])*Integer.parseInt(cnt[idx])%></td></tr>
		<%
		tot+=Integer.parseInt(price[idx])*Integer.parseInt(cnt[idx]);
	}
}
%>
<tr><th>합산</th><th colspan='3'><%=tot %></th></tr>
</table>
</body>
</html>