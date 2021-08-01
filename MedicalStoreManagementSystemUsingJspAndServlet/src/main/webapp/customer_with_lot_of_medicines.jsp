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
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Customer Who bought lot of medicines</title>
</head>
<body>
<table class="table table-striped" >
    <%
        MySql m = new MySql();
        Connection con = m.getConnection();
        String query = "select customer_id from  purchases p inner join purchase_items pi on p.purchase_id=pi.purchase_id group by customer_id order by sum(quantity) desc";
        Statement st;
        st = con.createStatement(); 
		ResultSet rs = st.executeQuery(query);
		rs.next();
		int customerID = rs.getInt(1);
        query = "select * from customers where customer_id="+customerID;
       
		try 
		{
			st = con.createStatement();
			
			 rs = st.executeQuery(query);
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
  <button type="button" onclick="window.location='sales_report.jsp'" class="btn btn-outline-danger">Exit</button>
  <button type="button" onclick="window.location='home.jsp'" class="btn btn-secondary">Home</button>
</div>
</body>
</html>