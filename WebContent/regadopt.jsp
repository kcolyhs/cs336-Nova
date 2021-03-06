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
if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")){
	out.print(WebsiteElements.getHeader(false));
	response.setHeader("Refresh", "0;url=login.jsp?loginAttempt=needed");
	}
else
	out.print(WebsiteElements.getHeader(true));
%>
<%
    if(request.getParameter("regadopt")!=null){
        //Parse the form data
    	String firstname = request.getParameter("firstname");
    	String lastname = request.getParameter("lastname");
    	String phone = request.getParameter("phone");
    	String email = request.getParameter("email");
    	String address = request.getParameter("address");
    	int sessionid = Integer.valueOf((String)session.getAttribute("userid"));
    	

		Statement stmt = con.createStatement();
		String query = "SELECT userid FROM Adopter where userid="+sessionid;
		ResultSet result = stmt.executeQuery(query);
		
		boolean error=false;
		String errormsg="<strong>Error!</strong><br> <ul>";
		if(result.next()){
			error = true;
			errormsg += "<li>User is already registered.</li>";
    	}if(!phone.matches("\\d{3}-\\d{3}-\\d{4}")){
			error = true;
			errormsg += "<li>Phone is not formatted correctly.</li>";	
		}if(firstname==null||lastname==null){
			error = true;
			errormsg += "<li>Both first and last name must be non-empty.</li>";
    	}if(email==null||email.equals("")){
			error = true;
			errormsg += "<li>Email is missing.</li>";
    	}if(!error){
        	if(qh.insertAdopter(firstname,lastname,address,phone,email,sessionid)){
        		//INSERT SUCCESS
        		out.print("<div class=\"alert alert-success alert-dismissible\">\n" + 
        				"  <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n" + 
        				"  <strong>Success!</strong> - "+lastname+","+firstname+" has been registered.\n" + 
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


<div class="container">
	<h1>Register to be an Adopter</h1>
	<form  method="get" action="#">
		<input type="hidden" name="regadopt" value="true">
		<div class="form-group row">
			<div class="col-md-6">
				<div class="form-group">
					<div id="name" class="input-group">
						<span class="input-group-addon">Name</span>
						<input id="username" type="text" class="form-control" name="firstname" placeholder="firstname" required autofocus>
						<input id="username" type="text" class="form-control" name="lastname" placeholder="lastname" required>
					</div><br>
					<div class="input-group">
					    <span class="input-group-addon">Phone</span>
					    <input id="password" type="tel" class="form-control" name="phone" placeholder="xxx-xxx-xxxx">
					    <span class="input-group-addon">Email</span>
					    <input id="password" type="email" class="form-control" name="email" required>
					</div>
				</div>
				
			</div>	
			<div class="col-md-6">
				<div class="input-group">					
			    	<span class="input-group-addon">Documentation</span>
			    	<input id="Documentation" type="file" class="form-control" name="documentation">
		    	</div><br>
		    	<div class="input-group">
				    <span class="input-group-addon">Address</span>
				    <input id="password" type="text" class="form-control" name="address">
				</div>
			</div>	
		</div>
		<input class="btn" type="submit" value="Register">
	</form>
</div>
</body>
</html>