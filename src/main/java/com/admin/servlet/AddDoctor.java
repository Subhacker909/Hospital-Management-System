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
 * Servlet implementation class AddDoctor
 */
@WebServlet("/adddoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			String fullName = request.getParameter("name");
			String dob = request.getParameter("dob");
			String qualification = request.getParameter("qualification");
			String specialist = request.getParameter("spec");
			String email = request.getParameter("email");
			String mobNo = request.getParameter("mob");
			String password = request.getParameter("password");
			
			Doctor d=new Doctor( fullName,  dob,  qualification,  specialist,  email,  mobNo,
			 password);
			
			DoctorDao dao=new DoctorDao(DBConnect.getConn());
			
			HttpSession session=request.getSession();
			if(dao.registerDoctor(d)) {
				session.setAttribute("sucmsg", "Doctor Added Successfully");
				response.sendRedirect("admin/doctor.jsp");
				
				
			}else {
				session.setAttribute("errmsg", "Something Wrong");
				response.sendRedirect("admin/doctor.jsp");
				
			}
         
			
		} catch (Exception e) {
		
		    e.printStackTrace();
		    }
		
		
	}

}
