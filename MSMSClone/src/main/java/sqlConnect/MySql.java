package sqlConnect;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySql {

	

	static Connection con = null;
	
	public Connection getConnection()
	{
		String url = "jdbc:mysql://localhost:3306/medicalstoremanagementsystemClone";
		String user = "root";
		String password = "8015684492";
		
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			 con = DriverManager.getConnection(url, user, password);
		} 
		catch (Exception e) 
		{
             System.out.println(e);
		}
		return con;
	}
}
