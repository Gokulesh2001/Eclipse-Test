<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Medicine</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body >
<form class="col-lg-6 offset-lg-3" action="AddMedicine" method="post">
  <div class="form-group" >
    <label for="exampleFormControlInput1">Medicine Name</label>
    <input type="text" class="form-control" id="exampleFormControlInput1"  name="name"  required>
    <label for="exampleFormControlSelect1">Medicine Type</label>
    <select class="form-control" id="exampleFormControlSelect1" name="type" required>
      <option>Tablet</option>
      <option>Liquid</option>
    </select>
    <label for="exampleFormControlInput1">Medicine Price</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="price" required>
    <label for="exampleFormControlInput1">Medicine Quantity</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="quantity" required>
    
  </div>
   <button type="submit" class="col-md-12 text-center btn btn-success btn-lg">Add Medicine</button>
</form>
<br>
<div class="col-md-12 text-center">
  <button type="button" onclick="window.location='medicine_management.jsp'" class="btn btn-outline-danger">Exit</button>
  <button type="button" onclick="window.location='home.jsp'" class="btn btn-secondary">Home</button>
</div>

</body>
</html>