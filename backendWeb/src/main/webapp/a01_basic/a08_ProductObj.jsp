<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "backendWeb.z01_vo.Product"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
ex) 구매물품 상세 정보로 테이블과 form 요소 객첵를 이용하여, 물건명, 가격
갯수, 상품정보를 table안에 표현하되 VO객체를 만들어 value값에 할당하세요
 --%>
 
 <%
 Product p= new Product("노트북", 1200000, 1, "전자기기");
 %>
 
<table border>
	<col width = 30%><col width = 30%>
	<tr>
		<th>물건명</th>
		<th>가격</th>
		<th>개수</th>
		<th>상품정보</th>
	</tr>
	<tr>
		<th><input type = "text" value = "<%=p.getPname()%>"></th>
		<th><input type = "text" value = "<%=p.getPrice()%>"></th>
		<th><input type = "text" value = "<%=p.getCnt()%>"></th>
		<th><input type = "text" value = "<%=p.getPinfo()%>"></th>
	</tr>
</table>
</body>
</html>