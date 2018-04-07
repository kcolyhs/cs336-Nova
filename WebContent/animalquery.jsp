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
	<title>336 NOVA - Animal Search</title>
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
	
	String animalName, animalSpecies, animalType, animalAge, animalDoB;
	if(request.getParameter("animalName") != null)	{
		animalName = request.getParameter("animalName");
	}else{
		animalName = "";
	}
	if(request.getParameter("animalSpecies") != null)	{
		animalSpecies = request.getParameter("animalSpecies");
	}else{
		animalSpecies = "";
	}
	if(request.getParameter("animalAge") != null)	{
		animalAge = request.getParameter("animalAge");
	}else{
		animalAge = "";
	}
	if(request.getParameter("animalDoB") != null)	{
		animalDoB = request.getParameter("animalDoB");
	}else{
		animalDoB = "";
	}
	if(request.getParameter("animalType") != null)	{
		animalType = request.getParameter("animalType");
	}else{
		animalType = "All";
	}
	
	%>
	<form class="form-inline" method="get" >
		<div class="form-group mb-2">
		<label for="animalName" class="sr-only">Shelter Name</label>
			<input type="text" class="form-control" name="animalName" placeholder="Name" value="<%=animalName%>">
		</div>
		<div class="form-group mb-2">
			<label for="animalSpecies" class="sr-only">Phone</label>
			<input type="text" class="form-control" name="animalSpecies" placeholder="Species" value="<%=animalSpecies%>">
		</div>
		<div class="form-group mb-2">
			<label for="animalAge" class="sr-only">Address</label>
			<input type="text" class="form-control" name="animalAge" placeholder="Age" value="<%=animalAge%>">
		</div>
		<div class="form-group mb-2">
			<label for="animalDoB" class="sr-only">Address</label>
			<input type="text" class="form-control" name="animalDoB" placeholder="Date of " value="<%=animalDoB%>">
		</div>
		<div class="form-group mb-2">
			<label for="animalType" class="sr-only">Address</label>
			<select class="form-control" name="animalType">
				<option>All</option>
				<option>Dog</option>
				<option>Cat</option>
				<option>Bird</option>
				<option>Reptile</option>
				<option>Other</option>
			</select>
		</div>
		<button type="submit" class="btn btn-primary">Search</button>
	</form>
	
	<%
	//Create a SQL statement
	Statement stmt = con.createStatement();
	//Get the combobox from the index.jsp
	
	
	String str = "SELECT * FROM Animal";
	boolean searching = false;
	if(!animalName.equals("")){
		str = str + " WHERE Animal.Name LIKE \"%" + animalName + "%\"";
		searching = true;
	}
	if(!animalSpecies.equals("") && !searching){
		str = str + " WHERE Animal.Species LIKE \"%" + animalSpecies + "%\"";
		searching = true;
	}else if(!animalSpecies.equals("") && searching){
		str = str + " AND Animal.Species LIKE \"%" + animalSpecies + "%\"";
	}
	if(!animalAge.equals("") && !searching){
		str = str + " WHERE Animal.Age LIKE \"%" + animalAge + "%\"";
		searching = true;		
	}else if(!animalAge.equals("") && searching){
		str = str + " AND Animal.Age LIKE \"%" + animalAge + "%\"";
	}
	if(!animalDoB.equals("") && !searching){
		str = str + " WHERE Animal.DoB LIKE \"%" + animalDoB + "%\"";
		searching = true;		
	}else if(!animalDoB.equals("") && searching){
		str = str + " AND Animal.DoB LIKE \"%" + animalDoB + "%\"";
	}
	if(animalType.equals("All")){
		
	}
	else if(!animalType.equals("") && !searching){
		str = str + " WHERE Animal.Type LIKE \"%" + animalType + "%\"";
		searching = true;		
	}else if(!animalType.equals("") && searching){
		str = str + " AND Animal.Type LIKE \"%" + animalType + "%\"";
	}
	//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
	//out.print("<p>" + str + "</p>");
	//out.print("<p>" + animalType + "</p>");
	ResultSet result = stmt.executeQuery(str);
	
	
	out.print("<div class=\"bs-example\">");
	out.print("<table class=\"table\">");
	out.print("<thead>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Name");
	out.print("</th>");
	out.print("<th>");
	out.print("Species");
	out.print("</th>");
	out.print("<th>");
	out.print("Age");
	out.print("</th>");
	out.print("<th>");
	out.print("Date of Birth");
	out.print("</th>");
	out.print("<th>");
	out.print("Type");
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
			out.print(result.getString("Species"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("Age"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("DoB"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("Type"));
			out.print("</td>");
			out.print("</tr>");	
			alternate = false;
		}else{
			out.print("<tr class=\"default\">");
			out.print("<td>");
			out.print(result.getString("Name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("Species"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("Age"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("DoB"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("Type"));
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