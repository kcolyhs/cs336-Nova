<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db336.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGGED IN?</title>
</head>
<body>

	<%
		try{;
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			Statement stmt = con.createStatement();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			String str = "SELECT pass from login where username = \""+username+"\"";
			
			boolean success = false;
			
			ResultSet result = stmt.executeQuery(str);
			if(!result.next()){
				out.print("User not found<br>");
			}else if(password.equals(result.getString("pass"))){
				out.print("<p>LOGIN SUCCESSFUL!</p>");
				success = true;
			}else{
				out.print("Password incorrect<br>");
			}
			if(!success){
				out.print("Login unsuccessful<br>");
				out.print("<form method = \"post\" action=\"login.jsp\">"
				+"<table>"
				+"<tr><td>Username</td><td><input type=\"text\" name=\"username\"></td></tr>"
				+"<tr><td>Password</td><td><input type=\"text\" name=\"password\"></td></tr>"	
				+"</table>"
				+"<input type=\"submit\" value=\"SIGN IN\">"
				+"</form>");
			}
			
		}catch(Exception e){
			out.print(e);
		}
	%>

</body>
</html>