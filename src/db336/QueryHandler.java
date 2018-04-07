package db336
;
import java.sql.*;


public class QueryHandler{
	
	private ApplicationDB db;
	private Connection con;
	
	public QueryHandler(Connection conpar,ApplicationDB dbpar) {
		this.db=dbpar;
		this.con=conpar;
	}
	
	
	public Boolean insertAnimal(String animalname,String dob,String species,String type) {
		String query = "INSERT INTO Animal(animalID,DoB,Species,Type,Age,Name) VALUES(?, ?, ?, ?, ?, ?)";
		try {
			//Query database for new max animalID
			Statement stmt = con.createStatement();
			String maxquery = "SELECT MAX(animalID) as max FROM Animal";
			ResultSet result = stmt.executeQuery(maxquery);
			result.next();
			int maxID = result.getInt("max");
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, maxID+1);
			ps.setDate(2, java.sql.Date.valueOf(dob));
			ps.setString(3, species);
			ps.setString(4,type);
			ps.setInt(5, 0);
			ps.setString(6,animalname);
			ps.executeUpdate();
			
			
		}catch(Exception e){
			System.out.print(e);
			return false;
		}
		return true;
	}
	//==============================
	public Boolean insertAdopter(String firstname, String lastname,String address,String phone, String email,int userid) {
	String query = "INSERT INTO Adopter(userID,first_name,last_name,address,phone,email) VALUES(?, ?, ?, ?, ?, ?)";
	try {
		Statement stmt = con.createStatement();
		String maxquery = "SELECT MAX(animalID) as max FROM Animal";
		ResultSet result = stmt.executeQuery(maxquery);
		result.next();
		int maxID = result.getInt("max");
		
		PreparedStatement ps = con.prepareStatement(query);
		ps.setInt(1, userid);
		ps.setString(2,firstname);
		ps.setString(3, lastname);
		ps.setString(4,address);
		ps.setString(5, phone);
		ps.setString(6,email);
		ps.executeUpdate();
	}catch(Exception e){
		System.out.print(e);
		return false;
	}
	return true;
	}
	//==============================
	public String getShelterDropdown() {
		String dropdown = "<select class=\"form-control\" name=\"shelter\" id=\"shelterselect\">\n";
		try {
			Statement stmt = con.createStatement();
			String shelterquery = "SELECT shelterID,shelter_name  FROM Shelter";
			ResultSet result = stmt.executeQuery(shelterquery);
			while(result.next()) {
				int shelterid = result.getInt("shelterID");
				String sheltername = result.getString("shelter_name");
				dropdown+="<option value="+shelterid+">"+sheltername+"</option>/n";
			}
		}catch(Exception e) {
			System.out.print(e);
		}
		
		dropdown +="</select>\n";
		return dropdown;
	}

	
}