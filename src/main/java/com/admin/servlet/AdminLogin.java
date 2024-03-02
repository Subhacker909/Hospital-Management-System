package com.admin.servlet;

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

import com.entity.User;


@WebServlet("/adminlogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			HttpSession session=request.getSession();
			
           if("admin@gmail.com".equals(email) && "admin".equals(pass)) {
        	   session.setAttribute("adminObj", new User());
        	   response.sendRedirect("admin/index.jsp");
           }else {
        	   session.setAttribute("errmsg", "Invalid Email or Password");
        	   response.sendRedirect("adminlogin.jsp");
           }
		
		} catch (Exception e) {
		   e.printStackTrace();
		    
		}
	}

}
