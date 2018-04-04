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
	
	
	public Boolean InsertAnimal(String animalname,String dob,String species,String type) {
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

	
}