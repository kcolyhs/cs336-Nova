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
<title>336 NOVA - Animal Search</title>
</head>
<body>
	<center>
		<h2>Search for Animal</h2>
	</center>
	<form method = "post" action = "animalqueryresults.jsp" target = "_blank">
		<table>
		<tr>
			<td>name</td><td> <input type="text" name="animal_name"></td>
		</tr>
		<tr>
			<td>age</td><td> <input type="number" name="age_min" min = "0">-
			<input type="number" name  = age_max min = "0"></td>
		</tr>
		</table>
		<br>
		<input type="submit" value = "Search">
		
	</form>	
<%= con %>
<br>
<%= request.getContextPath() %><br>
<%= session.isNew()%>
<img src="<%=request.getContextPath()%>/img/dog.jpg">
<img src="/portal_content/img/dog.jpg" alt="">
</body>
</html>

<%!
public void jspDestroy(){
	db.closeConnection(con);
}
%>

