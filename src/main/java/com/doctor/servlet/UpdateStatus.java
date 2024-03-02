package com.doctor.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.AppointmentDao;
import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

/**
 * Servlet implementation class UpdateStatus
 */
@WebServlet("/updatestatus")
public class UpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			int did=Integer.parseInt(request.getParameter("did"));
			String comment = request.getParameter("comment");

             AppointmentDao ap=new AppointmentDao(DBConnect.getConn());
            boolean f= ap.updateAppointmentCommentStatus(id, did, comment);
			HttpSession session = request.getSession();
			if (f==true) {
				session.setAttribute("sucmsg", "Status Updated Successfully");
				response.sendRedirect("doctor/patient.jsp");

			} else {
				session.setAttribute("errmsg", "Something wrong");
				response.sendRedirect("doctor/patient.jsp");
			}

		} catch (Exception e) {
               e.printStackTrace();
		}
		
	}

}
