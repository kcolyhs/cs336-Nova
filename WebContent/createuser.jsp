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





<div class = "container">


	<h1>Register</h1>
	<%
	String regAttempt = request.getParameter("regAttempt");
	if(regAttempt!=null&&regAttempt.equals("True")){
		try{
			Statement stmt = con.createStatement();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String str = "SELECT MAX(userid) as max FROM login";
			ResultSet result = stmt.executeQuery(str);
			result.next();
			int maxuserid = result.getInt("max");
			
			str = "SELECT username FROM login where username = \""+username+"\"";
			result = stmt.executeQuery(str);
			if(!(username.equals("")||password.equals(""))){
				
				if(result.next()){
					out.print("<div class=\"alert alert-danger\">"+
							  "<strong>ERROR:</strong> - Username already taken."+
							  "</div>");
				}else{
					out.print("<div class=\"alert alert-success\">"+
							  "<strong>Successful Registration</strong> - Welcome "+username+
							  "!<a style=\"text-align:right;float:right\" class=\"alert-link\" href=\"login.jsp\">Login Here</a>"+
							  "</div>");
					String insert = "INSERT INTO login(username,pass, userID)" 
							+ "VALUES(?, ?, ?)";
					PreparedStatement ps = con.prepareStatement(insert);
					ps.setString(1,username);
					ps.setString(2,password);
					ps.setInt(3,(maxuserid+1));
					ps.executeUpdate();
				}
			}
			else{
				out.print("<div class=\"alert alert-danger\">"+
						  "<strong>ERROR:</strong> - Please do not leave either field blank when registering."+
						  "</div>");
			}
		} catch (Exception e){
			out.println(e);
			out.println("insert failed");
		}
	}
	%>
	<form method="post" action = "createuser.jsp">
		<input type="hidden" name="regAttempt" value="True">
		<div class="input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			<input id="username" type="text" class="form-control" name="username" placeholder="Username" autofocus required>
		</div>
		<div class="input-group">
		    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
		    <input id="password" type="text" class="form-control" name="password" placeholder="Password" required>
		  </div>
		  <br>
	  	<input class="btn" type="submit" value="Register">
	</form>
</div>




</body>
</html>