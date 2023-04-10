package mycart.ecommerce.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import mycart.ecommerce.connection.Connection;
import mycart.ecommerce.entity.User;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		try(PrintWriter out = response.getWriter()) {
			
			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			String userPhone = request.getParameter("user_phone");
			String userAddress = request.getParameter("user_address");
			
			if(userName.isEmpty()) {
				out.println("Name can not be null");
				return;
			}
			
			//creating user object 
			User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "normal");
			Session hibernateSession = Connection.getConnection().openSession();
			Transaction tx = hibernateSession.beginTransaction();
			
			int userId = (int) hibernateSession.save(user);
			
			tx.commit();
			hibernateSession.close();
			
			HttpSession session = request.getSession();
			session.setAttribute("message", "Registration successfull with " + userId);
			response.sendRedirect("register.jsp");
			return;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
