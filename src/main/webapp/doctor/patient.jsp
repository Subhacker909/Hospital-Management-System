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
<%@include file="../component/allcss.jsp"%>

</head>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctorlogin.jsp"></c:redirect>

	</c:if>

	<%@include file="navbar.jsp"%>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Patient Details</p>
						<c:if test="${not empty succmsg }">
							<p class="text-center text-success fs-5">${succmsg}</p>
							<c:remove var="succmsg" scope="session" />
						</c:if>
						<c:if test="${not empty errrmsg }">
							<p class="text-center text-danger fs-5">${errrmsg}</p>
							<c:remove var="errrmsg" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">AppointmentDate</th>
									<th scope="col">Email</th>
									<th scope="col">MobNo</th>
									<th scope="col">Diseases</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>

							<tbody>
								<%
								Doctor d=(Doctor)session.getAttribute("doctObj");
								AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
								List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
								for (Appointment ap : list) {
								%>

								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppointDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getMobNo()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=ap.getStatus()%></td>
									<td>
										<%
										if ("Pending".equals(ap.getStatus()) || "Next Week".equals(ap.getStatus())) {
										%> <a
										href="comment.jsp?id=<%=ap.getId()%>"
										class="btn btn-success btn-sm">Comment</a> <%
                                         } else {
                                          %> <a
										href="#"
										class="btn btn-success btn-sm disabled">Comment</a>
										<%
										}
										%> 



									</td>
								</tr>


								<%
								}
								%>



							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>