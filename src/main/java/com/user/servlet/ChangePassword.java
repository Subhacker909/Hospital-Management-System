package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/changepassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			String newpass = request.getParameter("newpass");
			String oldpass = request.getParameter("oldpass");

			HttpSession session=request.getSession();
			UserDao dao=new UserDao(DBConnect.getConn());
			  User u=  (User)session.getAttribute("userObj");
                  int id=u.getId();
             boolean f= dao.changeOldPassword(id, oldpass, newpass);
	           if(f) {
	        	   session.setAttribute("sucmsg", "Password Changed Successfully");
	        	   response.sendRedirect("changepassword.jsp");
	           }else {
	        	   session.setAttribute("errmsg", "Invalid  Password");
	        	   response.sendRedirect("changepassword.jsp");
	           }
			
		} catch (Exception e) {
		
		    e.printStackTrace();
		}
		
		
	}

}
