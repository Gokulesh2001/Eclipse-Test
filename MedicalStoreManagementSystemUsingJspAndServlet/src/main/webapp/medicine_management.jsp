<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Medicine Management</title>
<link rel="stylesheet" href="index.css">
</head>
<body>
	<div class="container">
		<div class="indexbox">
			<p><p>
			<h2>Medicine Management</h2>
			<form action="add_medicine.jsp"><button class="button1">Add Medicine</button></form>
			<form action="update_medicine.jsp"><button class="button1">Update Medicine</button></form>
			<form action="remove_medicine.jsp"><button class="button1">Remove Medicine</button></form>
			<form action="view_all_medicine.jsp"><button class="button1">View All Medicines</button></form>
			<form action="home.jsp"><button class="button1">Exit</button></form>
		</div>
	</div>
</body>
</html>