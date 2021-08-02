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
<title>Update Medicine Details</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body>
	<%
	
	int medicineID = Integer.parseInt(request.getParameter("medicine_id"));
	 MySql m = new MySql();
     Connection con = m.getConnection();
     
     String query = "select * from medicines where medicine_id="+medicineID;
     Statement st;
		try 
		{
			st = con.createStatement();
			
			ResultSet rs = st.executeQuery(query);
			rs.next();
	%>
	<form class="col-lg-6 offset-lg-3" action="UpdateMedicine" method="post">
  <div class="form-group" >
    <label for="exampleFormControlInput1">Medicine Name</label>
    <input type="text" class="form-control" id="exampleFormControlInput1"  name="name" value="<%= rs.getString("medicine_name")%>"  required>
    <label for="exampleFormControlSelect1">Medicine Type</label>
    <select class="form-control" id="exampleFormControlSelect1" name="type"  required>
      <option>Tablet</option>
      <option>Liquid</option>
    </select>
    <label for="exampleFormControlInput1">Medicine Price</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="price" value="<%= rs.getString("price")%>"   required>
    <label for="exampleFormControlInput1">Medicine Quantity</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="quantity" value="<%= rs.getString("quantity")%>"   required>
    <input type="hidden"  name="medicineID" value="<%= medicineID%>" >
  </div>
   <button type="submit" class="col-md-12 text-center btn btn-success btn-lg">Update Medicine</button>

</form>
<br>
<div class="col-md-12 text-center">
  <button type="button" onclick="window.location='update_medicine.jsp'" class="btn btn-outline-danger">Exit</button>
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