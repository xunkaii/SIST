<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.google.gson.Gson"
    import="java.util.List"
    import="backendWeb.z01_vo.Code"
	import="backendWeb.a01_dao.A04_PreparedDao"    
    %>
<%
/*
	요청값 : title
	import 처리(dao,Gson,Code)
	Gson으로 json 데이터 로딩	
*/
String title = request.getParameter("title");
if(title==null)title="";
String refnoS = request.getParameter("refno");
int refno = 0;
if(refnoS!=null && !refnoS.equals("")) 
	refno = Integer.parseInt(refnoS);
A04_PreparedDao dao = new A04_PreparedDao();
Gson g = new Gson();
%>
<%=g.toJson(dao.getCodeList(title, refno))%>



