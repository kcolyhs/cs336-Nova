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
	
	 <style>
  body {
      position: relative; 
  }
  .affix {
      top:0;
      width: 100%;
      z-index: 9999 !important;
  }
  .navbar {
      margin-bottom: 0px;
  }

  .affix ~ .container-fluid {
     position: relative;
     top: 50px;
  }
  </style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
<div id="header" style="background-color:red;">
	<div class = "page-header" style="padding:20px;margin-bottom:0px;margin-top:0px;color:white">
		<h1 >CS336 - NOVA <small style="color:white" align="right">Animal Shelter Database Services</small></h1>
	</div>	
	<nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="114">
	  <div class="container-fluid">
    	<div class="navbar-header">
	     <a class="navbar-brand" href="home.jsp"><span class="glyphicon glyphicon-home"></span> Home</a>
	    </div>
	    <ul class="nav navbar-nav">
      		<li class="active"></li>
	     	<li class="dropdown">
		      	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Animals
		        <span class="caret"></span></a>
		        <ul class="dropdown-menu">
		         	<li><a href="createanimal.jsp">Register an Animal</a></li>
		         	<li><a href="animalquery.jsp">Search Animals</a></li>
		          	<li><a href="#">Search for a Veterinarian</a></li>
		          	<li><a href="#">Adopt an Animal</a></li>
		        </ul>
	      	</li>
	      	<li>
	      		<a class="dropdown-toggle" data-toggle="dropdown" href="#">Shelters/Fosters
		        <span class="caret"></span></a>
		        <ul class="dropdown-menu">
		         	<li><a href="createanimal.jsp">Register a Shelter</a></li>
		         	<li><a href="#">Search for Shelters</a></li>
		         	<li><a href="createanimal.jsp">Register a Foster Home</a></li>
		         	<li><a href="#">Search for Foster Homes</a></li>
		        </ul>
	        </li>
	      	<li>
	      	<a class="dropdown-toggle" data-toggle="dropdown" href="#"> Vets/Medicine
		        <span class="caret"></span></a>
		        <ul class="dropdown-menu">
		         	<li><a href="createanimal.jsp">Register a Veterinarian</a></li>
		         	<li><a href="#">Search for a Veterinarian</a></li>
		          	<li><a href="#">Check Vaccination Records</a></li>
		        </ul>
	        </li>
	      	<li><a href="#">Register to Adopt</a></li>
	    </ul>
	    <ul class="nav navbar-nav"style="float:right;align-text:right">
	    	<li><a href="login.jsp"><span class="glyphicon glyphicon-user"></span> Login</a></li>
	    	<li><a href="createuser.jsp"><span class="glyphicon glyphicon-pencil"></span> Register</a></li>
	    	<li><a href="logout.jsp"><span class="glyphicon glyphicon-lock"></span> Logout</a></li>
	    </ul>
	  </div>
	  
	</nav>
</div>

<div class=".container">
	
	<table class="table table-hover table-striped">
    <thead>
      <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Species</th>
        <th>Age</th>
      </tr>
    </thead>
    <tbody>
	  	<tr>
	        <td>Terry</td>
	        <td>Dog</td>
	        <td>Golden Retriever</td>
	        <td>5</td>
        </tr>
	  	<tr>
	        <td>Terry</td>
	        <td>Dog</td>
	        <td>Golden Retriever</td>
	        <td>5</td>
        </tr>
	  	<tr>
	        <td>Terry</td>
	        <td>Dog</td>
	        <td>Golden Retriever</td>
	        <td>5</td>
        </tr>
    </tbody>	
	</table>
</div>




</body>
</html>

<%!
public void jspDestroy(){
	db.closeConnection(con);
}
%>

