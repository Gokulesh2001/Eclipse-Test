<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Management</title>
<link rel="stylesheet" href="index.css">
</head>
<body>
	<div class="container">
		<div class="indexbox">
			<p><p>
			<h2>Customer Management</h2>
			<form action="add_customer.jsp"><button class="button1">Add Customer</button></form>
			<form action="update_customer.jsp"><button class="button1">Update Customer</button></form>
			<form action="remove_customer.jsp"><button class="button1">Remove Customer</button></form>
			<form action="view_all_customer.jsp"><button class="button1">View All Customers</button></form>
			<form action="home.jsp"><button class="button1">Exit</button></form>
		</div>
	</div>
</body>
</html>