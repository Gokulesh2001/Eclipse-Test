

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddPurchase")
public class AddPurchase extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int customerID = Integer.parseInt(request.getParameter("customer_id"));
		String[]  medicineIDs = request.getParameterValues("medicine_id");
		String[]  medicineQuantities = request.getParameterValues("medicine_quantity");
		
		Purchase pur = new Purchase();
		if(pur.addMedicine(customerID, medicineIDs, medicineQuantities))
		{
		RequestDispatcher rd = request.getRequestDispatcher("add_purchase.jsp"); 
		rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("purchase_error.jsp"); 
			rd.forward(request, response);
		}
	}

}
