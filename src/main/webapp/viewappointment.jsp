<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.*"%>
<%@page import="com.entity.*"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital Management System</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.backImg {
	background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
		url("img/hospital.jpg");
	height: 15vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>


</head>
<body>
	<%@include file="user/navbar.jsp"%>
	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-7">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Appointment List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">AppointDate</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>

								</tr>
							</thead>

							<tbody>
								<%
								User user = (User) session.getAttribute("userObj");
								AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
								DoctorDao dao5 = new DoctorDao(DBConnect.getConn());
								List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
								for (Appointment ap : list) {
									Doctor d = dao5.getDoctorById(ap.getDoctorId());
								%>

								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppointDate()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=d.getFullName()%></td>
                                     <td><% if("Pending".equals(ap.getStatus())){%>
                                        <a href="#" class="btn btn-sm btn-warning">Pending</a>
                                    	 
                                     <%}else{%>
                                    	 <%=ap.getStatus()%>
                                     <%}
                                     
                                     
                                     %></td>
								</tr>


								<%
								}
								%>

							</tbody>
						</table>

					</div>
				</div>
			</div>
			<div class="col-md-5 p-3">
				<img alt="" src="img/doct.jpg">
			</div>

		</div>
	</div>
</body>
</html>