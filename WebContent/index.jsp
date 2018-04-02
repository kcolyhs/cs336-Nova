<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db336.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>cs336 NOVA login</title>
</head>
<body>

<p ><b>LOGIN PAGE</b></p>

LOGIN	
<br>
	<form method = "post" action="login.jsp">
		<table>
			<tr>
				<td>Username</td><td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>Password</td><td><input type="password" name="password"></td>
			</tr>
			
		</table>
		<input type="submit" value="SIGN IN">
		
	</form>						  

<p>
	Create an account
</p>
<br>
	<form method = "post" action="createuser.jsp">
		<table>
			<tr>
				<td>Username</td><td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>Password</td><td><input type="text" name="password"></td>
			</tr>
			
		</table>
		<input type="submit" value="CREATE ACCOUNT">
		
	</form>

</body>
</html>