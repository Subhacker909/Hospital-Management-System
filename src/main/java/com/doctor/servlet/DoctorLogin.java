package com.doctor.servlet;

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

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

/**
 * Servlet implementation class DoctorLogin
 */
@WebServlet("/doctorlogin")
public class DoctorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			Doctor doctor = dao.login(email, password);
			HttpSession session = request.getSession();
			if (doctor!=null) {
				session.setAttribute("doctObj", doctor);
				response.sendRedirect("doctor/index.jsp");

			} else {
				session.setAttribute("errmsg", "Invalid Email or Password");
				response.sendRedirect("doctorlogin.jsp");
			}

		} catch (Exception e) {

		}
	}

}
