<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.*"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital Management System</title>
<%@include file="../component/allcss.jsp"%>

</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty adminObj }">
		<c:redirect url="../adminlogin.jsp"></c:redirect>
	</c:if>
	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-4 text-center">Patient Details</p>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Age</th>
							<th scope="col">Appointment Date</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Diseases</th>
							<th scope="col">Doctor Name</th>
							<th scope="col">Address</th>
							<th scope="col">Status</th>

						</tr>
					</thead>

					<tbody>
						<%
						AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
						DoctorDao dao1 = new DoctorDao(DBConnect.getConn());
						List<Appointment> list = dao.getAllAppointment();

						for (Appointment ap : list) {
							  Doctor d=  dao1.getDoctorById(ap.getDoctorId());
						%>
						<tr>
							<th><%=ap.getFullName()%></th>
							<td><%=ap.getGender() %></td>
							<td><%=ap.getAge()%></td>
							<td><%=ap.getAppointDate()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getMobNo() %></td>
							<td><%=ap.getDiseases()%></td>
							<td><%=d.getFullName()%></td>
							<td><%=ap.getAddress() %></td>
							<td><%=ap.getStatus() %></td>
						</tr>

						<%
						}
						%>


					</tbody>
				</table>

			</div>
		</div>
	</div>

</body>
</html>