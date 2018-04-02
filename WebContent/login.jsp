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
<div class="container">
<%
	try{
		String loginAttempt = request.getParameter("loginAttempt");
		if(loginAttempt!=null&&loginAttempt.equals("True")){
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
	
			Statement stmt = con.createStatement();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			String str = "SELECT pass,userID from login where username = \""+username+"\"";
			
			ResultSet result = stmt.executeQuery(str);
			if(!result.next()){
				out.print("<div class=\"alert alert-danger\">"+
						  "<strong>Unsuccessful Login</strong> - Username does not exist."+
						  "</div>");
			}else if(password.equals(result.getString("pass"))){
				out.print("<div class=\"alert alert-success\">"+
						  "<strong>Successful Login</strong> - Welcome "+username+
						  "!<a style=\"text-align:right;float:right\" class=\"alert-link\" href=\"home.jsp\">Continue</a>"+
						  "</div>");
	
		        session.setAttribute("userid", result.getString("userID"));
		        out.println("USERID:"+result.getInt("userID"));
				
			}else{
				out.print("<div class=\"alert alert-danger\">"+
						  "<strong>Unsuccessful Login</strong> - Password was incorrect."+
						  "</div>");
			}
		}
	}catch(Exception e){
		out.print(e);
	}
%>
</div>
<div class = "container">
	<h1>Login</h1>
	<form method="post" action = "#">
		<input type="hidden" name="loginAttempt" value="True">
		<div class="input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			<input id="username" type="text" class="form-control" name="username" placeholder="Username">
		</div>
		<div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
		    <input id="password" type="password" class="form-control" name="password" placeholder="Password">
		  </div>
		  <br>
	  	<input class="btn" type="submit" value="Login">
	</form>
</div>



</body>
</html>