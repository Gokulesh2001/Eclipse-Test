<%@page import="java.sql.ResultSet"%>
<%@page import="sqlConnect.MySql"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Purchase</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body class='bg-info'>
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
	                </tr>
	                
	            <% 
	        }
			
		} 
		catch (Exception e) 
		{
			System.out.println(e);
		}
       
        
        
    %>
     </tbody>
</table> 
<table class="table table-striped" >
    <%
       
        
        
         query = "select * from medicines";
        
		try 
		{
			st = con.createStatement();
			
			ResultSet rs = st.executeQuery(query);
			 %>
			 <thead>
			<tr>
			<th scope="col">
            Medicine ID
            </th>
            <th scope="col">
            Medicine Name
            </th>
            <th scope="col">
            Medicine Type
            </th>
           <th scope="col">
            Medicine Price
           </th>
            <th scope="col">
            Medicine Quantity
            </th>
			</tr>
			 </thead>
			 <tbody>
			<%
			while(rs.next())
	        {
	            %>
	                <tr>
	                 
	                     <th scope="row">  <%= rs.getInt("medicine_id")%> </th>
	                     <td>
	                     <%= rs.getString("medicine_name")%>
	                     </td> 
	                     <td>
	                     <%= rs.getString("medicine_type")%>
	                     </td>
	                     <td>
	                     <%= rs.getDouble("price")%>
	                     </td>
	                     <td>
	                     <%= rs.getInt("quantity")%>
	                     </td>       
	                </tr>
	                
	            <% 
	        }
			
		} 
		catch (Exception e) 
		{
			System.out.println(e);
		}
       
        
        
    %>
     </tbody>
</table>

<div class="alert alert-primary" role="alert">
  Please purchase available medicines.
</div>
<form class="col-lg-6 offset-lg-3" action="AddPurchase" method="post">
  <div class="form-group" >
    <label for="exampleFormControlInput1">Customer ID</label>
    <input type="text" class="form-control" id="exampleFormControlInput1"  name="customer_id" required>
    <div id="medrows">
    <br>
    <label for="exampleFormControlInput1">Medicine ID</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="medicine_id" required>
    <label for="exampleFormControlInput1">Medicine Quantity</label>
    <input type="text" class="form-control" id="exampleFormControlInput1" name="medicine_quantity" required>
      <br>
      </div>
    <input style="float: right;" type="button" id="addrows" name="addrows" class="btn btn-secondary" 
        value="Add Rows" onclick="add();">
  </div>
  <br>
   <button type="submit" class="col-md-12 text-center btn btn-success btn-lg">Add Purchase</button>
</form>
<br>
<div class="col-md-12 text-center">
  <button type="button" onclick="window.location='purchase_management.jsp'" class="btn btn-outline-danger">Exit</button>
  <button type="button" onclick="window.location='home.jsp'" class="btn btn-secondary">Home</button>
</div>


<script type="text/javascript">
   function add() {
	   var br = document.createElement("br");
     var element1 = document.createElement("Label");
     element1.setAttribute("for", "exampleFormControlInput1");
     element1.innerHTML ="Medicine ID";
     var element2 = document.createElement("Input");
     element2.setAttribute("type", "text");
     element2.setAttribute("class", "form-control");
     element2.setAttribute("id","exampleFormControlInput1");
     element2.setAttribute("name","medicine_id");
     
     var element3 = document.createElement("Label");
     element3.setAttribute("for", "exampleFormControlInput1");
     element3.innerHTML ="Medicine Quantity";
     var element4 = document.createElement("Input");
     element4.setAttribute("type", "text");
     element4.setAttribute("class", "form-control");
     element4.setAttribute("id","exampleFormControlInput1");
     element4.setAttribute("name","medicine_quantity");
     var obj = document.getElementById("medrows");
     obj.appendChild(br);
     obj.appendChild(element1);
     obj.appendChild(element2);
     obj.appendChild(element3);
     obj.appendChild(element4);
     obj.appendChild(br);
   }
</SCRIPT>
</body>
</html>