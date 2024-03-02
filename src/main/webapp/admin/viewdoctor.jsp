<%@page import="com.entity.Specialist"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.*"%>
<%@page import="java.util.*"%>
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
	<div class="container-fluid p-5">
		<div class="row">

			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Doctor Details</p>
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
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Action</th>

								</tr>
							</thead>

							<tbody>
								<%
								DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
								List<Doctor> list2 = dao2.getAllDoctor();
								for (Doctor d : list2) {
								%>
								<tr>
									<td><%=d.getFullName()%></td>
									<td><%=d.getDob()%></td>
									<td><%=d.getQualification()%></td>
									<td><%=d.getSpecialist()%></td>
									<td><%=d.getEmail()%></td>
									<td><%=d.getMobNo()%></td>
									<td><a href="editdoctor.jsp?id=<%=d.getId()%>"
										class="btn btn-sm btn-primary">Edit</a> <a
										href="../deletedoctor?id=<%=d.getId()%>"
										class="btn btn-sm btn-danger">Delete</a></td>

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