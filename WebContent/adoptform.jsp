<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db336.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%! 
ApplicationDB db;
Connection con;
QueryHandler qh;
public void jspInit(){
	db = new ApplicationDB();
	con =  db.getConnection();
	qh = new QueryHandler(con,db);
}
public void jspDestroy(){
	db.closeConnection(con);
}
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>336 NOVA - </title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</head>
<body>
<% 
Object sessionID = session.getAttribute("userid");
if ((sessionID == null) || ((String)sessionID).equals("")){
	response.setHeader("Refresh", "0;url=login.jsp?loginAttempt=needed");
	out.print(WebsiteElements.getHeader(false));
}else if(!qh.isRegAdopter(Integer.valueOf((String)sessionID))){
	response.setHeader("Refresh", "0;url=regadopt.jsp");
}
else
	out.print(WebsiteElements.getHeader(true));
%>
<div class="container">
	<h1>Select a Shelter</h1>
	<form method="get" action="adoptform2.jsp">
	<%
		out.print(qh.getShelterDropdown());
	%>
	<br>
  		<input type="submit" class="btn btn-info" value="Submit Button">
	</form >
	
</div>





</body>
</html>