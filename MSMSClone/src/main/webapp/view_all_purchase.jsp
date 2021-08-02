<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
   
    <%@page import="java.text.DateFormat"%>
    <%@page import="java.text.SimpleDateFormat"%>
    <%@page import="java.util.Arrays"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="java.util.List"%>
    <%@ page import="java.sql.*" %>
    <%@ page import ="javax.sql.*" %>
    <%@ page import ="sqlConnect.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>View All Customers</title>
</head>
<%if(session.getAttribute("userID") != null) {

if(session.getAttribute("role").equals("Admin")){ %>
<body>
<table class="table table-striped" >
    <%
        MySql m = new MySql();
        Connection con = m.getConnection();
        
          String query = "select * from purchases";
          Statement st;
		try 
		{
			st = con.createStatement();
			
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) 
			  {
				
			%>
			
			 <thead>
			    	   <tr>
			            <th scope="col">
			            Customer Name
			            </th>
			            <th scope="col">
			            Medicine Name
			            </th>
			           <th scope="col">
			            Medicine Quantity
			           </th>
			            <th scope="col">
			            Medicine Price
			            </th>
						</tr>
			</thead>
						 <tbody>
			<%
				  int sameId = rs.getInt("purchase_id");
				  String date = rs.getDate("created_date").toString();
			      int customerID= rs.getInt("customer_id");
			      query = "select customer_name from customers where customer_id="+customerID;
			      Statement st4 = con.createStatement();
			      ResultSet rsForCustomer = st4.executeQuery(query);
			      rsForCustomer.next();
			      String customerName = rsForCustomer.getString("customer_name");
			      query = "select * from purchases p inner join purchase_items pi on p.purchase_id=pi.purchase_id where pi.purchase_id="+sameId;
			      Statement st2 = con.createStatement();
			      ResultSet rsForPurchase = st2.executeQuery(query);
			     
			      double total = 0;
			       while(rsForPurchase.next())
				   {
			    	   total +=  rsForPurchase.getDouble("price") * rsForPurchase.getDouble("quantity")  ;
			    	   %>
			    	  
			    	   <tr>
		                 
	                     <th scope="row">  <%= customerName %> </th>
	                     <td>
	                  <%  
	                  query = "select medicine_name from medicines where medicine_id="+rsForPurchase.getInt("medicine_id");
	   			      Statement st3 = con.createStatement();
				      ResultSet rsForMedicine= st3.executeQuery(query);
				      rsForMedicine.next();
				      String medicineName = rsForMedicine.getString("medicine_name");
				      %>
				      <%=medicineName  %>
	                     </td> 
	                     <td>
	                     <%= rsForPurchase.getInt("quantity")%>
	                     </td>
	                     <td>
	                     <%= rsForPurchase.getDouble("price")%>
	                     </td>
	                            
	                </tr>
	               <tr></tr>
	                
	                <% 
			        }
			       %>
			        <tr>
		                 
	                   <th scope="row"> Total </th>
	                     <td>
	                     
	                     </td> 
	                     <td>
	                     
	                     </td>
	                     <td>
	                     <%=total%>
	                     </td>
	                     </tr>
	                     <tr>
	                     <th scope="row"> Date </th>
	                     <td>
	                     
	                     </td> 
	                     <td>
	                     
	                     </td>
	                     <td>
	                      <%= date %>
	                     </td>    
	                </tr>
			        </tbody>
			        
			        
			        <% 
				  
			  }
			
	        
			
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
       
        
        
    %>
     
</table>
<div class="col-md-12 text-center">
  <button type="button" onclick="window.location='purchase_management.jsp'" class="btn btn-outline-danger">Exit</button>
  <button type="button" onclick="window.location='home.jsp'" class="btn btn-secondary">Home</button>
</div>
</body>
<% 
}
else
{
	%>
	<body>
<table class="table table-striped" >
    <%
        MySql m = new MySql();
        Connection con = m.getConnection();
        
          String query = "select * from purchases where customer_id="+session.getAttribute("userID");
          Statement st;
		try 
		{
			st = con.createStatement();
			
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) 
			  {
				
			%>
			
			 <thead>
			    	   <tr>
			            <th scope="col">
			            Customer Name
			            </th>
			            <th scope="col">
			            Medicine Name
			            </th>
			           <th scope="col">
			            Medicine Quantity
			           </th>
			            <th scope="col">
			            Medicine Price
			            </th>
						</tr>
			</thead>
						 <tbody>
			<%
				  int sameId = rs.getInt("purchase_id");
				  String date = rs.getDate("created_date").toString();
			      int customerID= rs.getInt("customer_id");
			      query = "select customer_name from customers where customer_id="+customerID;
			      Statement st4 = con.createStatement();
			      ResultSet rsForCustomer = st4.executeQuery(query);
			      rsForCustomer.next();
			      String customerName = rsForCustomer.getString("customer_name");
			      query = "select * from purchases p inner join purchase_items pi on p.purchase_id=pi.purchase_id where pi.purchase_id="+sameId;
			      Statement st2 = con.createStatement();
			      ResultSet rsForPurchase = st2.executeQuery(query);
			     
			      double total = 0;
			       while(rsForPurchase.next())
				   {
			    	   total +=  rsForPurchase.getDouble("price") * rsForPurchase.getDouble("quantity")  ;
			    	   %>
			    	  
			    	   <tr>
		                 
	                     <th scope="row">  <%= customerName %> </th>
	                     <td>
	                  <%  
	                  query = "select medicine_name from medicines where medicine_id="+rsForPurchase.getInt("medicine_id");
	   			      Statement st3 = con.createStatement();
				      ResultSet rsForMedicine= st3.executeQuery(query);
				      rsForMedicine.next();
				      String medicineName = rsForMedicine.getString("medicine_name");
				      %>
				      <%=medicineName  %>
	                     </td> 
	                     <td>
	                     <%= rsForPurchase.getInt("quantity")%>
	                     </td>
	                     <td>
	                     <%= rsForPurchase.getDouble("price")%>
	                     </td>
	                            
	                </tr>
	               <tr></tr>
	                
	                <% 
			        }
			       %>
			        <tr>
		                 
	                   <th scope="row"> Total </th>
	                     <td>
	                     
	                     </td> 
	                     <td>
	                     
	                     </td>
	                     <td>
	                     <%=total%>
	                     </td>
	                     </tr>
	                     <tr>
	                     <th scope="row"> Date </th>
	                     <td>
	                     
	                     </td> 
	                     <td>
	                     
	                     </td>
	                     <td>
	                      <%= date %>
	                     </td>    
	                </tr>
			        </tbody>
			        
			        
			        <% 
				  
			  }
			
	        
			
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
       
        
        
    %>
     
</table>
<div class="col-md-12 text-center">
  <button type="button" onclick="window.location='purchase_management.jsp'" class="btn btn-outline-danger">Exit</button>
  <button type="button" onclick="window.location='home.jsp'" class="btn btn-secondary">Home</button>
</div>
</body>
	
	<% 
}
}
else
{
response.sendRedirect("login.html");

}%>

</html>