

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RemoveCustomer")
public class RemoveCustomer extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int customerID = Integer.parseInt(request.getParameter("customer_id"));
		Customer med = new Customer();
		med.removeCustomer(customerID);
		RequestDispatcher rd = request.getRequestDispatcher("remove_customer.jsp"); 
		rd.forward(request, response);
	}

}
