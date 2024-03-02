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
 * Servlet implementation class UpdateDoctor
 */
@WebServlet("/updatedoctor")
public class UpdateDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			String fullName = request.getParameter("name");
			String dob = request.getParameter("dob");
			String qualification = request.getParameter("qualification");
			String specialist = request.getParameter("spec");
			String email = request.getParameter("email");
			String mobNo = request.getParameter("mob");
			String password = request.getParameter("password");
			
			Doctor d=new Doctor( id,fullName,  dob,  qualification,  specialist,  email,  mobNo,
			 password);
			
			DoctorDao dao=new DoctorDao(DBConnect.getConn());
			
			HttpSession session=request.getSession();
			if(dao.updateDoctor(d)) {
				session.setAttribute("succmsg", "Doctor Updated Successfully");
				response.sendRedirect("admin/viewdoctor.jsp");
				
				
			}else {
				session.setAttribute("errrmsg", "Something Wrong");
				response.sendRedirect("admin/viewdoctor.jsp");
				
			}
         
			
		} catch (Exception e) {
		
		    e.printStackTrace();
		    }
		
	}

}
