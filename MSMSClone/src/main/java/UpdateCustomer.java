

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/UpdateCustomer")
public class UpdateCustomer extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			int customerID = Integer.parseInt(request.getParameter("customerID"));
			String customerName = request.getParameter("name");
			long customerMobileNumber =Long.parseLong(request.getParameter("mobilenumber"));
			String customerEmailID =request.getParameter("email");
			String customerAddress = request.getParameter("address");
			String role = request.getParameter("role");
			Customer cus = new Customer();
			cus.updateCustomer(customerID, customerName, customerMobileNumber, customerEmailID, customerAddress,role);
			RequestDispatcher rd = request.getRequestDispatcher("update_customer.jsp"); 
			rd.forward(request, response);
			
		}
	}


