<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
  import = "z99_project.a01_dao.*"
  import = "z99_project.a02_vo.*"
  import="java.util.*"
    %>
<%
String car_numberS = request.getParameter("car_number");
int car_number = 0;
if(car_numberS != null) car_number = Integer.parseInt(car_numberS);
S2carDao dao = new S2carDao();
dao.deleteS2Car(car_number);
%>