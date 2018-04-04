<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db336.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOGIN RESULT</title>
</head>
<body>
	<%
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			Statement stmt = con.createStatement();
			//retrieves parameters
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			//out.print("username:"+username+"<br>");
			//out.print("password:"+password+"<br>");
			//gets next userid
			String str = "SELECT MAX(userid) as max FROM login";
			ResultSet result = stmt.executeQuery(str);
			result.next();
			int maxuserid = result.getInt("max");
			//out.print("max:"+maxuserid);
			
			str = "SELECT username FROM login where username = \""+username+"\"";
			result = stmt.executeQuery(str);
			if(result.next()){
				out.print("Username Taken");
				out.print("<form method = \"post\" action=\"createuser.jsp\">"
				+"<table>"
				+"<tr><td>Username</td><td><input type=\"text\" name=\"username\"></td></tr>"
				+"<tr><td>Password</td><td><input type=\"text\" name=\"password\"></td></tr>"	
				+"</table>"
				+"<input type=\"submit\" value=\"CREATE ACCOUNT\">"
				+"</form>");
				return;
			}
			
			
			String insert = "INSERT INTO login(username,pass, userID)" 
					+ "VALUES(?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(insert);
			ps.setString(1,username);
			ps.setString(2,password);
			ps.setInt(3,(maxuserid+1));
			ps.executeUpdate();
			con.close();
			out.print("User Created. Login Here:");
			out.print("<form method = \"post\" action=\"login.jsp\">"
			+"<table>"
			+"<tr><td>Username</td><td><input type=\"text\" name=\"username\"></td></tr>"
			+"<tr><td>Password</td><td><input type=\"text\" name=\"password\"></td></tr>"	
			+"</table>"
			+"<input type=\"submit\" value=\"SIGN IN\">"
			+"</form>");
			
		} catch (Exception e){
			out.println(e);
			out.println("insert failed");
		}
	%>

</body>
</html>