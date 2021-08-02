<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" href="index.css">
</head>
<%if(session.getAttribute("userID") != null) {%>
<body>
	<div class="container">
		<div class="indexbox">
			
			<h2>Medical Store Management</h2>
			<form action="medicine_management.jsp"><button class="button1">Medicine Management</button></form>
			<form action="customer_management.jsp"><button class="button1">Customer Management</button></form>
			<form action="purchase_management.jsp"><button class="button1">Purchase Management</button></form>
			<%if(session.getAttribute("role").equals("Admin") ) {%>
			<form action="sales_report.jsp"><button class="button1">Sales Report</button></form>
			<%} %>
			<form action="Logout" ><button class="button1">Logout</button></form>
		</div>
	</div>
</body>
<%}
else
{
response.sendRedirect("login.html");

}%>

</html>