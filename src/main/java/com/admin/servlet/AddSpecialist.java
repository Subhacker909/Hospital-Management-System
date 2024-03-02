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

import com.dao.SpecialistDao;
import com.db.DBConnect;

/**
 * Servlet implementation class Specialist
 */
@WebServlet("/addspecialist")
public class AddSpecialist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			String name = request.getParameter("name");

			SpecialistDao dao=new SpecialistDao(DBConnect.getConn());
			boolean f=dao.addSpecialist(name);
			HttpSession session=request.getSession();
			
			
			if(f) {
				session.setAttribute("sucmsg", "Specialist Added");
				response.sendRedirect("admin/index.jsp");
				
			}else {
				session.setAttribute("errmsg", "Something Wrong");
				response.sendRedirect("admin/index.jsp");
			}
			
		} catch (Exception e) {
		
		    e.printStackTrace();
		}
		
	}

}
