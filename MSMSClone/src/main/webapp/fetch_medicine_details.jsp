<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="sqlConnect.MySql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Fetch Purchase of Specific Customer</title>
</head>
<body>
<table class="table table-striped" >
    <%
        MySql m = new MySql();
        Connection con = m.getConnection();
        
          String query = "select * from purchases ";
          Statement st;
		try 
		{
			st = con.createStatement();
			
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) 
			  {
			%>
			
			
			<%
				  int sameId = rs.getInt("purchase_id");
				  String date = rs.getDate("created_date").toString();
			      int customerID= rs.getInt("customer_id");
			      query = "select customer_name from customers where customer_id="+customerID;
			      Statement st4 = con.createStatement();
			      ResultSet rsForCustomer = st4.executeQuery(query);
			      rsForCustomer.next();
			      String customerName = rsForCustomer.getString("customer_name");
			      query = "select * from purchases p inner join purchase_items pi on p.purchase_id=pi.purchase_id where pi.purchase_id="+sameId+" and medicine_id="+request.getParameter("medicine_id");
			      Statement st2 = con.createStatement();
			      ResultSet rsForPurchase = st2.executeQuery(query);
			      if(rsForPurchase.next())
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
			      }
			      rsForPurchase = st2.executeQuery(query);
			      double total = 0;
			       while(rsForPurchase.next())
				   {
			    	   total +=  rsForPurchase.getDouble("price") * rsForPurchase.getDouble("quantity")  ;
			    	   if(total > 0)
			    	   {
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
			        </tbody>
			        
			        
			        <% 
				   }
			  }
			
	        
			
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
       
        
        
    %>
     
</table>
<div class="col-md-12 text-center">
  <button type="button" onclick="window.location='sales_report.jsp'" class="btn btn-outline-danger">Exit</button>
  <button type="button" onclick="window.location='home.jsp'" class="btn btn-secondary">Home</button>
</div>
</body>
</html>