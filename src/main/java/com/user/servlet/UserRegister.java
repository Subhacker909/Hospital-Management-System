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
import java.sql.Statement;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

/**
 * Servlet implementation class UserRegister
 */
@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegister() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String pass = request.getParameter("pass");

			User u=new User(name,email,pass);
			UserDao dao=new UserDao(DBConnect.getConn());
			
			
			HttpSession session=request.getSession();
			if(dao.UserRegister(u)) {
				session.setAttribute("sucmsg", "User Registered Successfully!!!");
				response.sendRedirect("signup.jsp");
			}else {
				session.setAttribute("errmsg", "Something Went Wrong!!!");
				response.sendRedirect("signup.jsp");

			}
		} catch (Exception e) {
		
		    
		}
	}

}
