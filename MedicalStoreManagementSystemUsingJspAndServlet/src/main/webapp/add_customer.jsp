<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Customer</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body class='bg-info'>
<form class="col-lg-6 offset-lg-3" action="AddCustomer" method="post">
  <div class="form-group" >
    <label for="exampleFormControlInput1">Customer Name</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="name" required>
    <label for="exampleFormControlInput1">Customer Mobile Number</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="mobilenumber" required>
    <label for="exampleFormControlInput1">Customer Email ID</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="email" required>
    <label for="exampleFormControlInput1">Customer Address</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="address" required>
    
  </div>
   <button type="submit" class="col-md-12 text-center btn btn-success btn-lg">Add Customer</button>
</form>
<br>
<div class="col-md-12 text-center">
  <button type="button" onclick="window.location='customer_management.jsp'" class="btn btn-outline-danger">Exit</button>
  <button type="button" onclick="window.location='home.jsp'" class="btn btn-secondary">Home</button>
</div>

</body>
</html>