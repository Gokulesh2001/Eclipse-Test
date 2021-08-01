

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RemoveMedicine")
public class RemoveMedicine extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int medicineID = Integer.parseInt(request.getParameter("medicine_id"));
		Medicine med = new Medicine();
		med.removeMedicine(medicineID);
		RequestDispatcher rd = request.getRequestDispatcher("remove_medicine.jsp"); 
		rd.forward(request, response);
		
	}

}
