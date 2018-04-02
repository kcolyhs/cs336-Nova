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
</head>
<body>
<%= con %>
<div class="page-header">
  <h1>My First Bootstrap Page Header</h1>
  <p>This part is inside a .container class. </p> 
  <p>The .container class provides a responsive fixed width container.</p>           
</div>
<div class="row">
  <div class="col-sm-4">.col-sm-4</div>
  <div class="col-sm-4">.col-sm-4</div>
  <div class="col-sm-4">.col-sm-4</div>
</div>
<div class= "well">Basic Well</div>


<div class='alert alert-success alert-dismissible'>
<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
<strong>SUCCESS!</strong>Animal has been registered
</div>

<div class ="page-header">
	Submit Form
</div>

<div class = "well">
	<form method="post">
			<input type="hidden" name="reqType" value="animal">
			<table>
				<tr>
					<td>
						<b>Name</b>
					</td>
					<td>
						<input type="text" name="name" placeholder="Insert Animal's Name">
					</td>
				</tr>
				<tr>
					<td>
						<b>DoB</b>
					</td>
					<td>
						<input type="date" name="DoB">
					</td>
				</tr>
				<tr>
					<td>
						<b>Species</b>
					</td>
					<td>
						<input type="text" name="species" placeholder="Insert Animal's Species">
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="submit" class = "btn btn-primary">
		</form>
</div>

<p>Search icon on a styled button:
    <button type="button" class="btn btn-info">
      <span class="glyphicon glyphicon-search"></span> Search
    </button>
</p>

</body>
</html>

<%!
public void jspDestroy(){
	db.closeConnection(con);
}
%>

