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
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</head>
<body>
<div id="header" style="background-color:red;">
	<div class = "page-header" style="padding:20px;margin-bottom:0px;margin-top:0px;color:white">
		<h1 >CS336 - NOVA <small style="color:white" align="right">Animal Shelter Database Services</small></h1>
	</div>	
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">NOVA</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="home.jsp">Home</a></li>
	      <li class="dropdown">
		      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Animals
		        <span class="caret"></span></a>
		        <ul class="dropdown-menu">
		          <li><a href="createanimal.jsp">Register</a></li>
		          <li><a href="#">Search</a></li>
		          <li><a href="#">Page 1-3</a></li>
		        </ul>
	      </li>
	      <li><a href="#">Page 2</a></li>
	      <li><a href="#">Page 3</a></li>
	    </ul>
	  </div>
	</nav>
</div>




</body>
</html>

<%!
public void jspDestroy(){
	db.closeConnection(con);
}
%>

