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
<title>Remove Customer</title>
</head>
<body>
<table class="table table-striped" >
    <%
        MySql m = new MySql();
        Connection con = m.getConnection();
        
        int counter=1;
        String query = "select * from customers";
        Statement st;
		try 
		{
			st = con.createStatement();
			
			ResultSet rs = st.executeQuery(query);
			 %>
			 <thead>
			<tr>
			<th scope="col">
            Customer ID
            </th>
            <th scope="col">
            Customer Name
            </th>
            <th scope="col">
            Customer Mobile Number
            </th>
           <th scope="col">
            Customer Email ID
           </th>
            <th scope="col">
            Customer Address
            </th>
			</tr>
			 </thead>
			 <tbody>
			<%
			while(rs.next())
	        {
	            %>
	                <tr>
	                 
	                     <th scope="row">  <%= rs.getInt("customer_id")%> </th>
	                     <td>
	                     <%= rs.getString("customer_name")%>
	                     </td> 
	                     <td>
	                     <%= rs.getLong("customer_mobile_no")%>
	                     </td>
	                     <td>
	                     <%= rs.getString("customer_email_id")%>
	                     </td>
	                     <td>
	                     <%= rs.getString("customer_address")%>
	                     </td>    
	                     <td >
	                      <form  action="RemoveCustomer" method="post">
	                      <input type="hidden"  name="customer_id" value="<%=rs.getInt("customer_id")%>" >
	                     <button type="submit" class="btn btn-link"  >Remove</button>
	                     </form>
	                     </td>       
	                </tr>
	                
	            <% 
	        }
			
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
       
        
        
    %>
     </tbody>
</table>
<div class="col-md-12 text-center">
  <button type="button" onclick="window.location='customer_management.jsp'" class="btn btn-outline-danger">Exit</button>
  <button type="button" onclick="window.location='home.jsp'" class="btn btn-secondary">Home</button>
</div>
</body>
</html>
 