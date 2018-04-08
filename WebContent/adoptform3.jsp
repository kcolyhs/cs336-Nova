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
if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == ""))
	out.print(WebsiteElements.getHeader(false));
else
	out.print(WebsiteElements.getHeader(true));
%>
<%
	int shelterID = Integer.valueOf(request.getParameter("shelterid"));
	int animalID = Integer.valueOf(request.getParameter("animalid"));
	int sessionID = Integer.valueOf((String)session.getAttribute("userid"));
	java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
%>
<div class=container>
<%
	try{
	Statement stmt = con.createStatement();

	String query = "INSERT INTO Adopts_From_R(userID,shelterID,animalID,Date) VALUES (?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(query);

	ps.setInt(1,sessionID);
	ps.setInt(2,shelterID);
	ps.setInt(3,animalID);
	ps.setDate(4,date);
	ps.executeUpdate();
	query = "DELETE FROM ShelteredIn_R where animalID=?";
	ps = con.prepareStatement(query);
	ps.setInt(1,animalID);
	ps.executeUpdate();
	
	
	
	out.print("<div class=\"alert alert-success alert-dismissible\">\n" + 
			"  <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n" + 
			"  <strong>Success!</strong> - ID#"+sessionID+" has adopted animal#"+ animalID+" .\n" + 
			"</div >");
	
	}catch(Exception e){
		System.out.println(e);
	}

	
%>
</div>




</body>
</html>