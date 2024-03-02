package com.user.servlet;

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
import com.entity.Appointment;
import com.entity.Doctor;

/**
 * Servlet implementation class AddAppointment
 */
@WebServlet("/addappointment")
public class AddAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			int userId=Integer.parseInt(request.getParameter("userid"));
			String fullName = request.getParameter("fullName");
			String gender = request.getParameter("gender");
			String age = request.getParameter("age");
			String appointDate = request.getParameter("appointDate");
			String email = request.getParameter("email");
			String mobNo = request.getParameter("mobNo");
			String diseases = request.getParameter("diseases");
			int doctorId = Integer.parseInt(request.getParameter("doct"));
			String address = request.getParameter("address");

			Appointment ap=new Appointment(userId,fullName,  gender,  age,  appointDate,  email,
					 mobNo,  diseases,  doctorId,  address, "Pending");
			
           AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
           
			HttpSession session=request.getSession();
			if(dao.addAppointment(ap)) {
				session.setAttribute("sucmsg", "Appointment Generated Successfully");
				response.sendRedirect("userappointment.jsp");
				
				
			}else {
				session.setAttribute("errmsg", "Something Wrong");
				response.sendRedirect("userappointment.jsp");
				
			}
         
			
		} catch (Exception e) {
		
		    e.printStackTrace();
		    }
		
	}

}
