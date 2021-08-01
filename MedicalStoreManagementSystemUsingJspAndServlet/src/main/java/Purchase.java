import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import sqlConnect.MySql;

public class Purchase 
{

	public boolean addMedicine(int customerID,String[] medicineIDs,String[] medicineQuantities)
	{
		MySql m = new MySql();
	    Connection con = m.getConnection();
		String query = "insert into purchases(customer_id, created_date) values("+customerID+",NOW())";
		Statement st;
		int maxId = -1;
		
		try 
		{
			st = con.createStatement();
			st.executeUpdate(query);
			//Taking last inserted id from purchases table 
			st = con.createStatement();
		    query = "SELECT MAX(purchase_id) FROM purchases";
			ResultSet rs = st.executeQuery(query);
			rs.next();
			maxId = rs.getInt("MAX(purchase_id)");
			
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
		for(int i = 0; i < medicineIDs.length; i++)
		{
			int medicineID = Integer.parseInt(medicineIDs[i]);
			int medicineQuantity = Integer.parseInt(medicineQuantities[i]);
			 try {
				  st = con.createStatement();
				  query = "SELECT * FROM medicines where medicine_id ="+medicineID;
				  
				 
				  ResultSet rs = st.executeQuery(query);
				   rs.next();
				  
				   int medicineCount = rs.getInt("quantity");
				   if(medicineCount - medicineQuantity < 0)
				   {
					   return false;
				   }
				  double medicinePrice = rs.getDouble("price");
				  
				 //insert into purchaseItems table 
				  query = "insert into purchase_items(medicine_id,purchase_id,quantity,price) values("+medicineID+","+maxId+","+medicineQuantity+","+medicinePrice+")";

				  st.executeUpdate(query);
				  
				  //Decreasing the quantity of medicine
				  query = "update medicines set quantity ="+(medicineCount-medicineQuantity)+" where medicine_id ="+medicineID;

				  st.executeUpdate(query);
				 
				  }
				  catch(Exception e)
				  {
					  System.out.println(e);
				  }
			
		}
		 return true;	  
	}
}
