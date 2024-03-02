package com.admin.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

/**
 * Servlet implementation class DeleteDoctor
 */
@WebServlet("/deletedoctor")
public class DeleteDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			int id=Integer.parseInt(request.getParameter("id"));
						
			DoctorDao dao=new DoctorDao(DBConnect.getConn());
			
			HttpSession session=request.getSession();
			if(dao.deleteDoctorById(id)) {
				session.setAttribute("succmsg", "Doctor Deleted Successfully");
				response.sendRedirect("admin/doctor.jsp");
				
				
			}else {
				session.setAttribute("errrmsg", "Something Wrong");
				response.sendRedirect("admin/doctor.jsp");
				
			}
         
			
		} catch (Exception e) {
		
		    e.printStackTrace();
		    }
		
		
	}

}
