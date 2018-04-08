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
<div class="container">
	<%
		int shelterid = Integer.valueOf(request.getParameter("shelter"));
	%>
	<h1><% out.print(qh.getShelterName(shelterid));%></h1>
	<div class=".container">
	<form method="get" action="adoptform3.jsp">
	<input type="hidden" name="shelterid" value="<%out.print(shelterid);%>">

	<table class="table table-hover table-striped">
    <thead>
      <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Species</th>
        <th>Age</th>
        <th>Select</th>
      </tr>
    </thead>
    <tbody>
	<%	try {
		Statement stmt = con.createStatement();
		String shelterquery = "SELECT * FROM ShelteredIn_R as s INNER JOIN Animal as a on s.animalID=a.animalID where s.shelterID="+shelterid;
		ResultSet result = stmt.executeQuery(shelterquery);
		while(result.next()) {
			int animalid = result.getInt("animalID");
			String name = result.getString("Name");
			String type = result.getString("Type");
			String species = result.getString("Species");
			int age = result.getInt("Age");
			out.print("<tr>");
			out.print("<td>"+name+"</td>\n");
			out.print("<td>"+type+"</td>\n");
			out.print("<td>"+species+"</td>\n");
			out.print("<td>"+age+"</td>\n");
			out.print("<td>");
			out.print("<input type=radio name=animalid value="+animalid+">");
			out.print("<td>");
			out.print("</tr>"); 
		}
	}catch(Exception e) {
		System.out.print(e);
	}
	%>
    </tbody>	
	</table>
		<input class="btn btn-info" type="submit" value="Adopt Selected Animal">
	</form>
	
</div>
	
</div>





</body>
</html>