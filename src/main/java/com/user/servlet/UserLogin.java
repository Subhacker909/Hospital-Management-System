package com.user.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/userlogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			HttpSession session=request.getSession();
			UserDao dao=new UserDao(DBConnect.getConn());
			User user= dao.login(email, password);
			
	           if(user!=null) {
	        	   session.setAttribute("userObj", user);
	        	   response.sendRedirect("user/index.jsp");
	           }else {
	        	   session.setAttribute("errmsg", "Invalid Email or Password");
	        	   response.sendRedirect("userlogin.jsp");
	           }
			
		} catch (Exception e) {
		
		    
		}
		
	}

}
