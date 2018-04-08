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
Object sessionID = session.getAttribute("userid");
if ((sessionID == null) || ((String)sessionID).equals("")){
	response.setHeader("Refresh", "0;url=login.jsp?loginAttempt=needed");
	out.print(WebsiteElements.getHeader(false));
}
else
	out.print(WebsiteElements.getHeader(true));
%>
<%
    //Parse the form data
    if(request.getParameter("createfoster")!=null){
    	String phone = request.getParameter("phone");
    	String address = request.getParameter("address");
    	String firstname= request.getParameter("firstname");
    	String lastname= request.getParameter("lastname");
	
		boolean error=false;
		String errormsg="<strong>Error!</strong><br> <ul>";
		if(!phone.matches("\\d{3}-\\d{3}-\\d{4}")){
			error = true;
			errormsg += "<li>Phone is not formatted correctly.</li>";
		}if(firstname==null||firstname.equals("")||lastname==null||lastname.equals("")){
			error = true;
			errormsg += "<li>Both first and last name must be non-empty.</li>";
    	}if(address==null||address.equals("")){
			error = true;
			errormsg += "<li>Email is missing.</li>";
    	}if(!error){
        	if(qh.insertFoster(firstname,lastname,address,phone)){
        		//INSERT SUCCESS
        		out.print("<div class=\"alert alert-success alert-dismissible\">\n" + 
        				"  <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n" + 
        				"  <strong>Success!</strong> - "+firstname+","+lastname+" has been registered.\n" + 
        				"</div >");
        	}else{
    			error = true;
    			errormsg += "<li>SQL Insert failed;</li>";
        	}
    	}else{
    		errormsg="<div class=\"alert alert-danger alert-dismissible\">\n" + 
    				"  <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n" +
    				errormsg + "</ul>" +
    				"</div >";
 			out.print(errormsg);
    	}
    }
    
%>
		
	
	
	
<%
String typeselect=request.getParameter("animal_type");
if(typeselect==null)
	typeselect="";
%>
<div class="container">
	<h1 align="center">Register as a Foster Home 
	<button data-toggle="collapse" data-target="#instructions" class="btn btn-danger">
		<span class="glyphicon glyphicon-info-sign"></span>
	</button>
	</h1>
	<div id="instructions" class="collapse">
		<div class=.container>
			<h3>Instructions</h3>
			<ol>
				<li>Enter the name of the owner of the Foster Home</li>
				<li>Enter the phone number in the form "xxx-xxx-xxxx". </li>
				<li>Enter the address in the form "111 Streetname St."
			</ol>
		</div>	
	</div>
	<form  method="get" action="#">
		<input type="hidden" name="createfoster" value="true">
		
		<div class="form-group">
			<div class="input-group">
				<span class="input-group-addon">First Name</span>
				<input id="name" type="text" class="form-control" name="firstname" placeholder="First Name" required autofocus>
			</div>
			<div class="input-group">
				<span class="input-group-addon">Last Name</span>
				<input id="name" type="text" class="form-control" name="lastname" placeholder="Name" required autofocus>
			</div>
			<div class="input-group">
			    <span class="input-group-addon">Phone</span>
			    <input id="phone" type="tel" class="form-control" name="phone" required placeholder="xxx-xxx-xxxx">
			</div>
			<div class="input-group">
			    <span class="input-group-addon">Address</span>
			    <input id="address" type="text" class="form-control" name="address" placeholder="Address" required>
			</div>
		  		<input class="btn" type="submit" value="Register Shelter">
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

