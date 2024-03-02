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
			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Add Doctor</p>
						<c:if test="${not empty sucmsg }">
							<p class="text-center text-success fs-5">${sucmsg}</p>
							<c:remove var="sucmsg" scope="session" />
						</c:if>
						<c:if test="${not empty errmsg }">
							<p class="text-center text-danger fs-5">${errmsg}</p>
							<c:remove var="errmsg" scope="session" />
						</c:if>
						<form action="../adddoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label><input required
									name="name" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label><input required name="dob"
									type="date" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label><input required
									name="qualification" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label><select required
									name="spec" class="form-control">
									<option>--Select--</option>
									<% SpecialistDao dao=new SpecialistDao(DBConnect.getConn());
									  List<Specialist> list=dao.getAllSpecialist();
									  for(Specialist s:list)
									  {%>
										  <option><%=s.getSpecialistName() %></option>
										  
									  <% }
									
									%>


								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label><input required
									name="email" type="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Mob No</label><input required
									name="mob" type="number" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label><input required
									name="password" type="password" class="form-control">
							</div>
							<button type="submit" class="btn bg-success">Submit</button>
						</form>
					</div>
				</div>
			</div>

			</div></div>
</body>
</html>