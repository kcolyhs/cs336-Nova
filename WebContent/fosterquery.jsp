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
	<title>336 NOVA - Foster Home Search</title>
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
	
	String fosterFirst, fosterLast, fosterAddr, fosterPhone;
	if(request.getParameter("fosterFirst") != null)	{
		fosterFirst = request.getParameter("fosterFirst");
	}else{
		fosterFirst = "";
	}
	if(request.getParameter("fosterLast") != null)	{
		fosterLast = request.getParameter("fosterLast");
	}else{
		fosterLast = "";
	}
	if(request.getParameter("fosterPhone") != null)	{
		fosterPhone = request.getParameter("fosterPhone");
	}else{
		fosterPhone = "";
	}
	if(request.getParameter("fosterAddr") != null)	{
		fosterAddr = request.getParameter("fosterAddr");
	}else{
		fosterAddr = "";
	}
	%>
	<form class="form-inline" method="get" >
		<div class="form-group mb-2">
			<label for="fosterFirst" class="sr-only">First Name</label>
			<input type="text" class="form-control" name="fosterFirst" placeholder="First Name" value="<%=fosterFirst%>">
		</div>
		<div class="form-group mb-2">
			<label for="fosterLast" class="sr-only">Last Name</label>
			<input type="text" class="form-control" name="fosterLast" placeholder="Last Name" value="<%=fosterLast%>">
		</div>
		<div class="form-group mb-2">
			<label for="fosterPhone" class="sr-only">Phone</label>
			<input type="text" class="form-control" name="fosterPhone" placeholder="Phone" value="<%=fosterPhone%>">
		</div>
		<div class="form-group mb-2">
			<label for="fosterAddr" class="sr-only">Address</label>
			<input type="text" class="form-control" name="fosterAddr" placeholder="Address" value="<%=fosterAddr%>">
		</div>
		<button type="submit" class="btn btn-primary">Search</button>
	</form>
	<%
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	//Get the combobox from the index.jsp
	
	
	String str = "SELECT * FROM Foster_Home";
	boolean searching = false;
	if(!fosterFirst.equals("")){
		str = str + " WHERE Foster_Home.first_name LIKE \"%" + fosterFirst + "%\"";
		searching = true;
	}
	if(!fosterLast.equals("") && !searching){
		str = str + " WHERE Foster_Home.last_name LIKE \"%" + fosterLast + "%\"";
		searching = true;
	}else if(!fosterLast.equals("") && searching){
		str = str + " AND Foster_Home.last_name LIKE \"%" + fosterLast + "%\"";
	}
	if(!fosterPhone.equals("") && !searching){
		str = str + " WHERE Foster_Home.phone LIKE \"%" + fosterPhone + "%\"";
		searching = true;		
	}else if(!fosterPhone.equals("") && searching){
		str = str + " AND Foster_Home.phone LIKE \"%" + fosterPhone + "%\"";
	}
	if(!fosterAddr.equals("") && !searching){
		str = str + " WHERE Foster_Home.address LIKE \"%" + fosterAddr + "%\"";
		searching = true;		
	}else if(!fosterAddr.equals("") && searching){
		str = str + " AND Foster_Home.address LIKE \"%" + fosterAddr + "%\"";
	}
	//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
	//out.print("<p>" + str + "</p>");
	ResultSet result = stmt.executeQuery(str);
	
	
	out.print("<div class=\"bs-example\">");
	out.print("<table class=\"table\">");
	out.print("<thead>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Name");
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
			out.print(result.getString("first_name") + " " + result.getString("last_name"));
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
			out.print(result.getString("first_name") + " " + result.getString("last_name"));
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