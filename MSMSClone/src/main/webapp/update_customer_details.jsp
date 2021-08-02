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
<title>Add Customer</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body >
    <%
	
	int customerID = Integer.parseInt(request.getParameter("customer_id"));
    MySql m = new MySql();
    Connection con = m.getConnection();
    
    
    String query = "select * from customers where customer_id="+customerID;
    Statement st;
	try 
	{
		st = con.createStatement();
		
		ResultSet rs = st.executeQuery(query);
		rs.next();
	%>
<form class="col-lg-6 offset-lg-3" action="UpdateCustomer" method="post">
  <div class="form-group" >
    <label for="exampleFormControlInput1">Customer Name</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="name" value="<%=rs.getString("customer_name") %>" required>
    <label for="exampleFormControlInput1">Customer Mobile Number</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="mobilenumber" value="<%=rs.getLong("customer_mobile_no") %>" required>
    <label for="exampleFormControlInput1">Customer Email ID</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="email" value="<%=rs.getString("customer_email_id")%>" required>
    <label for="exampleFormControlInput1">Customer Address</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="address"  value="<%=rs.getString("customer_address")%>" required>
    <% if(session.getAttribute("role").equals("Admin")){%>
    <label for="exampleFormControlSelect1">Role</label>
        <select class="form-control" id="exampleFormControlSelect1" name="role" required>
      <option>Admin</option>
      <option>Customer</option>
    </select>
    <%} %>
    <input type="hidden"  name="customerID" value="<%= customerID%>" >
  </div>
   <button type="submit" class="col-md-12 text-center btn btn-success btn-lg">Update Customer</button>
</form>
<br>
<div class="col-md-12 text-center">
  <button type="button" onclick="window.location='customer_management.jsp'" class="btn btn-outline-danger">Exit</button>
  <button type="button" onclick="window.location='home.jsp'" class="btn btn-secondary">Home</button>
</div>
<%

		}
		catch(Exception e)
		{
			System.out.println(e);
		}
%>

</body>
</html>