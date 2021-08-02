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
<title>Most Purchased Medicine</title>
</head>
<body>
<table class="table table-striped" >
    <%
	    MySql m = new MySql();
	    Connection con = m.getConnection();
	    String query = "select medicine_id from  purchases p inner join purchase_items pi on p.purchase_id=pi.purchase_id group by customer_id order by sum(quantity) desc";
	    Statement st;
	    st = con.createStatement(); 
		ResultSet rs1 = st.executeQuery(query);
		%>
		 <thead>
			<tr>
			<th scope="col">
            Medicine ID
            </th>
            <th scope="col">
            Medicine Name
            </th>
            <th scope="col">
            Medicine Type
            </th>
           <th scope="col">
            Medicine Price
           </th>
            <th scope="col">
            Medicine Quantity
            </th>
			</tr>
			 </thead>
		<% 
		while(rs1.next())
		{
		int medicineID = rs1.getInt(1);
         query = "select * from medicines where medicine_id="+medicineID;
        
		try 
		{
			st = con.createStatement();
			
			ResultSet rs = st.executeQuery(query);
			 %>
			
			 <tbody>
			<%
			while(rs.next())
	        {
	            %>
	                <tr>
	                 
	                     <th scope="row">  <%= rs.getInt("medicine_id")%> </th>
	                     <td>
	                     <%= rs.getString("medicine_name")%>
	                     </td> 
	                     <td>
	                     <%= rs.getString("medicine_type")%>
	                     </td>
	                     <td>
	                     <%= rs.getDouble("price")%>
	                     </td>
	                     <td>
	                     <%= rs.getInt("quantity")%>
	                     </td>       
	                </tr>
	                
	            <% 
	        }
			
		} 
		catch (Exception e) 
		{
			System.out.println(e);
		}
		}
        
        
    %>
     </tbody>
</table>
<div class="col-md-12 text-center">
  <button type="button" onclick="window.location='sales_report.jsp'" class="btn btn-outline-danger">Exit</button>
  <button type="button" onclick="window.location='home.jsp'" class="btn btn-secondary">Home</button>
</div>
</body>
</html>