<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales Report</title>
<link rel="stylesheet" href="index.css">
</head>
<body>
	<div class="container">
		<div class="indexbox">
			<p><p>
			<h2>Sales Report</h2>
			<form action="today_purchase.jsp"><button class="button1">Today Purchases</button></form>
			<form action="customer_with_lot_of_medicines.jsp"><button class="button1">Customer Who bought lot of medicines</button></form>
			<form action="most_purchased_medicine.jsp"><button class="button1">Most purchased medicine</button></form>
			<form action="fetch_customer_purchase.jsp"><button class="button1">Fetch Purchase of Specific Customer</button></form>
			<form action="fetch_medicine_purchase.jsp"><button class="button1">Fetch Purchase of Specific Medicine</button></form>
			<form action="home.jsp"><button class="button1">Exit</button></form>
		</div>
	</div>
</body>
</html>