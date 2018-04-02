<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db336.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
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
<% out.print(WebsiteElements.getHeader());%>
<%
    //Parse the form data
    if(request.getParameter("reqType")!=null){
        String animal_name = request.getParameter("name");
        String DoB = request.getParameter("DoB");
        String type = request.getParameter("");
        out.println(DoB);
    }
    
    
    
	//Generate the SQL statement and print out the response from the databases 
%>
	<br>
	Debug<br>
	Connection:<%= con %><br>
	Session:<%=session.getId() %>
	
	<h2 align="center">Register an Animal</h2>
	<!-- Process the previous request -->
	<h3>Instructions</h3>
	<ul>
		<li>Fill in the information for the new animal</li>
		<li>Leave any unknown or N/A fields blank</li>
		<li>Fields marked with a * are mandatory</li>
		<li>For the species/type/ <i>Capitalize The First Letter of Each Word</i></li>
	</ul>
	<div>
		<table>
			<tr>
				<td width=70px>
					<b>Type</b>
				</td>
				<td>
					<select name="animal_type">
						<option value="dog">Dog</option>
						<option value="cat">Cat</option>
						<option value="reptile">Reptile</option>
						<option value="bird">Bird</option>
						<option value="other">Other</option>
					</select>
				</td>
			</tr>
		</table>
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
			<input type="submit" value="submit">
		</form>
	</div>





</body>
</html>

<%!
public void jspDestroy(){
	db.closeConnection(con);
}
%>

