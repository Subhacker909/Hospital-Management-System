<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.*"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.Specialist"%>

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
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Edit Doctor Details</p>
						<c:if test="${not empty sucmsg }">
							<p class="text-center text-success fs-5">${sucmsg}</p>
							<c:remove var="sucmsg" scope="session" />
						</c:if>
						<c:if test="${not empty errmsg }">
							<p class="text-center text-danger fs-5">${errmsg}</p>
							<c:remove var="errmsg" scope="session" />
						</c:if>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						DoctorDao dao3 = new DoctorDao(DBConnect.getConn());
						Doctor d = dao3.getDoctorById(id);
						%>

						<form action="../updatedoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label><input required
									name="name" type="text" class="form-control"
									value="<%=d.getFullName()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label><input required name="dob"
									type="date" class="form-control" value="<%=d.getDob()%>">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label><input required
									name="qualification" type="text" class="form-control"
									value="<%=d.getQualification()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label><select required
									name="spec" class="form-control">

									<option><%=d.getSpecialist()%></option>
									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>

									<%
									}
									%>

								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label><input required
									name="email" type="email" class="form-control"
									value="<%=d.getEmail()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label><input required
									name="mob" type="number" class="form-control"
									value="<%=d.getMobNo()%>">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label><input required
									name="password" type="text" class="form-control"
									value="<%=d.getPassword()%>">
							</div>
							<input type="hidden" name="id" value="<%=d.getId()%>">
							<button type="submit" class="btn bg-success col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
</body>
</html>