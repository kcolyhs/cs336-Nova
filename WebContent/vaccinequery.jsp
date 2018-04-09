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
	<title>336 NOVA - Vaccination Records</title>
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
	
	String vetName, date, vaccName, animalName;
	if(request.getParameter("vetName") != null)	{
		vetName = request.getParameter("vetName");
	}else{
		vetName = "";
	}
	if(request.getParameter("date") != null)	{
		date = request.getParameter("date");
	}else{
		date = "";
	}
	if(request.getParameter("vaccName") != null)	{
		vaccName = request.getParameter("vaccName");
	}else{
		vaccName = "";
	}
	if(request.getParameter("animalName") != null)	{
		animalName = request.getParameter("animalName");
	}else{
		animalName = "";
	}
	%>
	<form class="form-inline" method="get" >
		<div class="form-group mb-2">
		<label for="vetName" class="sr-only">Shelter Name</label>
			<input type="text" class="form-control" name="vetName" placeholder="Vet Name" value="<%=vetName%>">
		</div>
		<div class="form-group mb-2">
			<label for="date" class="sr-only">Phone</label>
			<input type="text" class="form-control" name="date" placeholder="Date" value="<%=date%>">
		</div>
		<div class="form-group mb-2">
			<label for="vaccName" class="sr-only">Address</label>
			<input type="text" class="form-control" name="vaccName" placeholder="Vaccine Name" value="<%=vaccName%>">
		</div>
		<div class="form-group mb-2">
			<label for="animalName" class="sr-only">Address</label>
			<input type="text" class="form-control" name="animalName" placeholder="Animal Name" value="<%=animalName%>">
		</div>
		<button type="submit" class="btn btn-primary">Search</button>
	</form>
	
	<%
	//Create a SQL statement
	Statement stmt = con.createStatement();
	//Get the combobox from the index.jsp
	
	
	String str = "SELECT vet.Name,i.Date, vac.vacc_name, a.Name FROM Animal as a INNER JOIN Issues_R as i ON i.animalID = a.animalID INNER JOIN Vaccines as vac on vac.vaccineID = i.vaccineID INNER JOIN Veterinarian as vet ON vet.vetID = i.vetID";
	boolean searching = false;
	if(!vetName.equals("")){
		str = str + " WHERE vet.Name LIKE \"%" + vetName + "%\"";
		searching = true;
	}
	if(!date.equals("") && !searching){
		str = str + " WHERE i.Date LIKE \"%" + date + "%\"";
		searching = true;
	}else if(!date.equals("") && searching){
		str = str + " AND i.Date LIKE \"%" + date + "%\"";
	}
	if(!vaccName.equals("") && !searching){
		str = str + " WHERE vac.vacc_name LIKE \"%" + vaccName + "%\"";
		searching = true;		
	}else if(!vaccName.equals("") && searching){
		str = str + " AND vac.vacc_name LIKE \"%" + vaccName + "%\"";
	}
	if(!animalName.equals("") && !searching){
		str = str + " WHERE a.Name LIKE \"%" + animalName + "%\"";
		searching = true;		
	}else if(!animalName.equals("") && searching){
		str = str + " AND a.Name LIKE \"%" + animalName + "%\"";
	}
	//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
	//out.print("<p>" + str + "</p>");
	str = str + " ORDER BY i.Date DESC";
	ResultSet result = stmt.executeQuery(str);
	
	
	out.print("<div class=\"bs-example\">");
	out.print("<table class=\"table\">");
	out.print("<thead>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Veterinarian");
	out.print("</th>");
	out.print("<th>");
	out.print("Date");
	out.print("</th>");
	out.print("<th>");
	out.print("Vaccine");
	out.print("</th>");
	out.print("<th>");
	out.print("Animal");
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
		out.print("</tr>");	
		
	}
	else
	{
	while (result.next()) {
		//make a row
		if(alternate){
			out.print("<tr class=\"active\">");
			out.print("<td>");
			out.print(result.getString("vet.Name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("i.Date"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("vac.vacc_name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("a.Name"));
			out.print("</td>");
			out.print("</tr>");	
			alternate = false;
		}else{
			out.print("<tr class=\"default\">");
			out.print("<td>");
			out.print(result.getString("vet.Name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("i.Date"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("vac.vacc_name"));
			out.print("</td>");
			out.print("<td>");
			out.print(result.getString("a.Name"));
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