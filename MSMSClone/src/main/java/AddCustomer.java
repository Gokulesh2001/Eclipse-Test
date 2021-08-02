



import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AddCustomer")
public class AddCustomer extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String customerName = request.getParameter("name");
		long customerMobileNumber = Long.parseLong(request.getParameter("mobilenumber"));
		String customerEmailId = request.getParameter("email");
		String customerAddress = request.getParameter("address");
		String role = request.getParameter("role");
		Customer cus = new Customer();
		cus.addCustomer(customerName, customerMobileNumber, customerEmailId, customerAddress, role);
		RequestDispatcher rd = request.getRequestDispatcher("add_customer.jsp"); 
		rd.forward(request, response);
		
	}

}
