<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db336.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%! 
ApplicationDB db;
Connection con;
public void jspInit(){
	db = new ApplicationDB();
	con =  db.getConnection();
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>336 NOVA - </title>
</head>
<body>
<%= con %><br>
animal_name:<%= request.getParameter("animal_name") %><br>
age:<%=request.getParameter("age_min")+"-"+request.getParameter("age_max") %><br>

<img src="<%=request.getContextPath()%>/images/dog.jpg">

<%= session.isNew() %>
</body>
</html>

<%!
public void jspDestroy(){
	db.closeConnection(con);
}
%>

