<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="Z01_National_Library.joinMem_DB_con"
	import="Z01_National_Library.vo.vo_joinMem"%>
<%
joinMem_DB_con dao = new joinMem_DB_con();
String id = request.getParameter("username");
String pass = request.getParameter("password");

vo_joinMem mem = dao.login(id, pass);
boolean isSuccess = mem != null;

if (isSuccess) {
	String username = mem.getId();
	String password = mem.getPass();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type = "text/javascript">
var isSuccess =
	<%=isSuccess%>
		; // java ==> js 전환
		if (isSuccess) {
			alert("로그인 성공")
		} else {
			alert("로그인 실패\n다시 로그인")
			// 페이지 이동 명령어
			location.href = "z_National_Library/login.html"
		}
</script>
</head>
<body>
<h2>로그인한 아이디: ${param.username}</h2>
</body>
</html>