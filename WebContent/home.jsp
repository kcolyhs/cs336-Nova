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
if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == ""))
	out.print(WebsiteElements.getHeader(false));
else
	out.print(WebsiteElements.getHeader(true));
%>


<h1>CS366 Project Home Page</h1>
<div class="container">
	<h2>Things you can do on this website</h2>
	<ul>
		<li>Register an animal and then search for it along with the 1000+ other animals</li>
		<li>Search for a Shelter/Foster Home</li>
		<li>Check the vaccination records for a specific date/animal/vet</li>
		<li>Register a new Shelter/Foster Home</li>
		<li>Create a new user and register to adopt</li>
		<li>Choose a shelter and adopt an animal(The database will record the adoption and remove it from the shelter's animal list)</li>
	</ul>
	<h2>Possible Future Improvements</h2>
	<ul>
		<li>Add more searching functions for searching animals/vaccination records</li>
		<li>Add ways to directly move animals into shelter/foster home relationships from website</li>
		<li>Create a permissions hierarchy instead of just Users->Adopters</li>
	</ul>
</div>


<img src="${pageContext.request.contextPath}/images/img.jpg"/>



</body>
</html>