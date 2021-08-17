import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import sqlConnect.MySql;

public class Customer 
{

	static Connection con = null;
	
	public void connect()
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
	}
	
	public void addCustomer(String customerName,long customerMobileNumber,String customerEmailId,String customerAddress, String role)
	{
		connect();
		String query = "insert into customers(customer_name, customer_mobile_no, customer_email_id, customer_address, role_) values('"+customerName+"',"+customerMobileNumber+",'"+customerEmailId+"','"+customerAddress+"','"+role+"')";
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
	public void updateCustomer(int customerID, String customerName,long customerMobileNumber,String customerEmailId,String customerAddress, String role)
	{
		MySql m = new MySql();
	    Connection con = m.getConnection();
		String query = "update customers set  customer_name=?, customer_mobile_no=?, customer_email_id=? ,customer_address=?, role_=? where customer_id="+customerID;
		PreparedStatement st;
		try 
		{
			st = con.prepareStatement(query);
			st.setString(1, customerName);
			st.setLong(2, customerMobileNumber);
			st.setString(3, customerEmailId);
			st.setString(4, customerAddress);
			st.setString(5, role);
			
			st.executeUpdate();
			
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
		
	}
	
	public void removeCustomer(int customerID)
	{
		MySql m = new MySql();
	    Connection con = m.getConnection();
		String query = "delete from customers where customer_id="+customerID;
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
