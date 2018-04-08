<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db336.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<!DOCTYPE html>
<%! 
ApplicationDB db;
Connection con;
QueryHandler qh;
public void jspInit(){
	db = new ApplicationDB();
	con =  db.getConnection();
	qh = new QueryHandler(con,db);
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
<%
    //Parse the form data
    if(request.getParameter("createanimal")!=null){

    	String animaltype = request.getParameter("animaltype");
    	String animalname = request.getParameter("animalname");
    	String DoB = request.getParameter("dob");
    	String species = request.getParameter("species");
    	if(animaltype==null){
    		//ERROR NO TYPE
    		out.print("<div class=\"alert alert-danger alert-dismissible\">\n" + 
    				"  <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n" + 
    				"  <strong>Error!</strong> - "+" Animal is missing a type field.\n" + 
    				"</div >");
    	}else if(animalname==null||animalname.equals("")){
    		//MISSING NAME
    		out.print("<div class=\"alert alert-danger alert-dismissible\">\n" + 
        				"  <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n" + 
        				"  <strong>Error!</strong> - "+" Animal is missing a name.\n" + 
        				"</div >");
    	}else if(DoB==null||DoB.equals("")){
    		//MISSING DOB
    		out.print("<div class=\"alert alert-danger alert-dismissible\">\n" + 
        				"  <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n" + 
        				"  <strong>Error!</strong> - "+animalname+" is missing the its Date of Birth.\n" + 
        				"</div >");
    	}else{
    		if(species==null){
    			species="unknown";
    		}
        	if(qh.insertAnimal(animalname,DoB,species,animaltype)){
        		//INSERT SUCCESS
        		out.print("<div class=\"alert alert-success alert-dismissible\">\n" + 
        				"  <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n" + 
        				"  <strong>Success!</strong> - "+animalname+" has been registered.\n" + 
        				"</div >");
        	}else{
        		//INSERT FAILURE
        		out.println("INSERT FAILURE");
        	}
        			
        			
    	}
    }
    
%>
		
	
	
	
<%
String typeselect=request.getParameter("animal_type");
if(typeselect==null)
	typeselect="";
%>
<div class="container">
	<h1 align="center">Register an Animal 
	<button data-toggle="collapse" data-target="#instructions" class="btn btn-danger">
		<span class="glyphicon glyphicon-info-sign"></span>
	</button>
	</h1>
	<div id="instructions" class="collapse">
		<div class=.container>
			<h3>Instructions</h3>
			<ol>
				<li>Select the correct type of animal to enter</li>
				<li>Enter the animal's DOB. </li>
				
			</ol><ul>
					<li>Enter the animal's species.</li>
					<li>Capitalize the first letter.</li>
					<li>Leave blank if species is unknown</li>
				</ul>
		</div>	
	</div>
	<form  method="post" action="#">
		<input type="hidden" name="createanimal" value="true">
		<div class="form-group">
			<label for="typeselect">Select Animal Type</label>
			<select class="form-control" id="typeselect"name="animaltype">
					<option value="dog" 	<%if(typeselect.equals("dog"))out.print("selected"); %> >Dog</option>
					<option value="cat"		<%if(typeselect.equals("cat"))out.print("selected"); %> >Cat</option>
					<option value="reptile" <%if(typeselect.equals("reptile"))out.print("selected"); %> >Reptile</option>
					<option value="bird" 	<%if(typeselect.equals("bird"))out.print("selected"); %> >Bird</option>
					<option value="other" 	<%if(typeselect.equals("other"))out.print("selected"); %> >Other</option>
				</select>
		</div>
		<div class="form-group">
			<div class="input-group">
				<span class="input-group-addon">Animal Name</span>
				<input id="username" type="text" class="form-control" name="animalname" placeholder="Name" required autofocus>
			</div>
			<div class="input-group">
			    <span class="input-group-addon">Date of Birth</span>
			    <input id="password" type="date" class="form-control" name="dob" required>
			</div>
			<div class="input-group">
			    <span class="input-group-addon">Species</span>
			    <input id="password" type="text" class="form-control" name="species" placeholder="Species">
			</div>
		  		<input class="btn" type="submit" value="Register Animal">
  		</div>
	</form>
	
</div>
</body>
</html>

<%!
public void jspDestroy(){
	db.closeConnection(con);
}
%>

