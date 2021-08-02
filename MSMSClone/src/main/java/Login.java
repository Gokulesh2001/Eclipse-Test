import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sqlConnect.MySql;


	@WebServlet("/Login")
	public class Login extends HttpServlet {
		
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String userName = request.getParameter("username");
			long customerMobileNumber = Long.parseLong(request.getParameter("phno"));
			MySql m = new MySql();
			String query = "select * from customers where customer_name='"+userName+"' and customer_mobile_no="+customerMobileNumber;
			Connection con = m.getConnection();
			try {
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(query);
				
				if(rs.next())
				{
					HttpSession session = request.getSession();
					session.setAttribute("userID", rs.getInt("customer_id"));
					session.setAttribute("role", rs.getString("role_"));
					response.sendRedirect("home.jsp");
				}
				else
				{
					response.sendRedirect("login.html");
				}
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
		}

}
