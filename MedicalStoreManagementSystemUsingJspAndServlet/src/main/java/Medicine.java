


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import sqlConnect.MySql;







public class Medicine 
{

	
	
	
	
	public void addMedicine(String medicineName,String medicineType,double medicinePrice,int medicineQuantity)
	{
		MySql m = new MySql();
	    Connection con = m.getConnection();
		String query = "insert into medicines(medicine_name, medicine_type, price, quantity) values('"+medicineName+"','"+medicineType+"',"+medicinePrice+","+medicineQuantity+")";
		Statement st;
		try 
		{
			st = con.createStatement();
			st.executeUpdate(query);
			
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
	}

	public void updateMedicine(int medicineID, String medicineName, String medicineType, double medicinePrice,
			int medicineQuantity) 
	{
		MySql m = new MySql();
	    Connection con = m.getConnection();
		String query = "update medicines set medicine_name=?, medicine_type=?, price=?, quantity=? where medicine_id="+medicineID;
		PreparedStatement st;
		try 
		{
			st = con.prepareStatement(query);
			st.setString(1, medicineName);
			st.setString(2, medicineType);
			st.setDouble(3, medicinePrice);
			st.setInt(4, medicineQuantity);
			
			st.executeUpdate();
			
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
		
	}
	
	public void removeMedicine(int medicineID)
	{
		MySql m = new MySql();
	    Connection con = m.getConnection();
		String query = "delete from medicines where medicine_id="+medicineID;
		PreparedStatement st;
		try 
		{
			st = con.prepareStatement(query);
			st.executeUpdate();
			
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
	}
	
	
}
