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
	<title>336 NOVA - Vet Search</title>
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

try {
	

	//Get the database connection
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();
	
	String vetName, vetPhone, vetAddr;
	if(request.getParameter("vetName") != null)	{
		vetName = request.getParameter("vetName");
	}else{
		vetName = "";
	}
	if(request.getParameter("vetPhone") != null)	{
		vetPhone = request.getParameter("vetPhone");
	}else{
		vetPhone = "";
	}
	if(request.getParameter("vetAddress") != null)	{
		vetAddr = request.getParameter("vetAddress");
	}else{
		vetAddr = "";
	}
	%>
	<form class="form-inline" method="get" >
		<div class="form-group mb-2">
		<label for="vetName" class="sr-only">Name</label>
			<input type="text" class="form-control" name="vetName" placeholder="Name" value="<%=vetName%>">
		</div>
		<div class="form-group mb-2">
			<label for="vetPhone" class="sr-only">Phone</label>
			<input type="text" class="form-control" name="vetPhone" placeholder="Phone" value="<%=vetPhone%>">
		</div>
		<div class="form-group mb-2">
			<label for="vetAddress" class="sr-only">Address</label>
			<input type="text" class="form-control" name="vetAddress" placeholder="Address" value="<%=vetAddr%>">
		</div>
		<button type="submit" class="btn btn-primary">Search</button>
	</form>
	<%
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	//Get the combobox from the index.jsp
	
	
	String str = "SELECT * FROM Veterinarian";
	boolean searching = false;
	if(!vetName.equals("")){
		str = str + " WHERE Veterinarian.Name LIKE \"%" + vetName + "%\"";
		searching = true;
	}
	if(!vetPhone.equals("") && !searching){
		str = str + " WHERE Veterinarian.phone LIKE \"%" + vetPhone + "%\"";
		searching = true;
	}else if(!vetPhone.equals("") && searching){
		str = str + " AND Veterinarian.phone LIKE \"%" + vetPhone + "%\"";
	}
	if(!vetAddr.equals("") && !searching){
		str = str + " WHERE Veterinarian.address LIKE \"%" + vetAddr + "%\"";
		searching = true;		
	}else if(!vetAddr.equals("") && searching){
		str = str + " AND Veterinarian.address LIKE \"%" + vetAddr + "%\"";
	}
	//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
	//out.print("<p>" + str + "</p>");
	ResultSet result = stmt.executeQuery(str);
	
	
	out.print("<div class=\"bs-example\">");
	out.print("<table class=\"table\">");
	out.print("<thead>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Veterinarian Name");
	out.print("</th>");
	out.print("<th>");
	out.print("Phone");
	out.print("</th>");
	out.print("<th>");
	out.print("Address");
	out.print("</th>");
	out.print("</tr>");
	out.print("</thead>");
	out.print("<tbody>");
	
	boolean alternate = false;
	//parse out the results
	if(!result.isBeforeFirst()){
		out.print("<tr class=\"warning\">");
		out.print("<td>");
		out.print("No match");
		out.print("</td>");
		out.print("<td>");
		out.print("No match");
		out.print("</td>");
		out.print("<td>");
		out.print("No match");
		out.print("</td>");
		out.print("</tr>");	
		
	}
	else
	{
	while (result.next()) {
		//make a row
		if(alternate){
			out.print("<tr class=\"active\">");
			out.print("<td>");
			out.print(result.getString("Name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("phone"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("address"));
			out.print("</td>");
			out.print("</tr>");	
			alternate = false;
		}else{
			out.print("<tr class=\"default\">");
			out.print("<td>");
			out.print(result.getString("Name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("phone"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("address"));
			out.print("</td>");
			out.print("</tr>");	
			alternate = true;			
		}
	}
	}
	out.print("</tbody>");
	out.print("</table>");

	//close the connection.
	con.close();

} catch (Exception e) {
}
%>
</body>
</html>