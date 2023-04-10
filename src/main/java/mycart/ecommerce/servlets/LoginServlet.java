package mycart.ecommerce.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mycart.ecommerce.connection.Connection;
import mycart.ecommerce.dao.UserDao;
import mycart.ecommerce.entity.User;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public LoginServlet() {
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try(PrintWriter out = response.getWriter()){
			
			String uEmail = request.getParameter("email");
			String uPassword = request.getParameter("password");
			
			//authenticating user
			UserDao userDao = new UserDao(Connection.getConnection());
			User user = userDao.getUserByEmailAndPassword(uEmail, uPassword);
			
			HttpSession session = request.getSession();
			
			if(user==null) {
				session.setAttribute("message", "Invalid credentials!");
				response.sendRedirect("login.jsp");
				return;
			}
			else {
				out.println("<h1>Welcome</h1>");
				//login
				session.setAttribute("current-user",user);
				if(user.getUserType().equals("admin")) {
					//admin.jsp
					response.sendRedirect("admin.jsp");
				}else if(user.getUserType().equals("normal")) {
					//normal.jsp
					response.sendRedirect("normal.jsp");
				}else {
					out.println("No identified user type found!");
				}

			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
