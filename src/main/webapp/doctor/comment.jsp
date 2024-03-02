<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.*"%>
<%@page import="com.entity.*"%>
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
<style type="text/css">
.backImg {
	background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
		url("../img/hospital.jpg");
	height: 15vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>

</head>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctorlogin.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Patient Comment</p>
						
						<% 
						  int id=Integer.parseInt(request.getParameter("id"));
						  AppointmentDao dao=new AppointmentDao(DBConnect.getConn());
						  Appointment  ap=dao.getAppointmentById(id);
						  
						  
						%>
						
						<form class="row" action="../updatestatus" method="post">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Patient Name</label><input
									required name="fullName" type="text" class="form-control" readonly="readonly" value="<%=ap.getFullName() %>">
							</div>
							<div class="col-md-6">
								<label  for="inputEmail4" class="form-label">Age</label><input required name="age"
									type="number" class="form-control" readonly="readonly" value="<%=ap.getAge() %>">
							</div>

							<div class="col-md-6">
								<label class="form-label">Mob No</label><input required
									name="mobNo" maxlength="10" type="number" class="form-control" readonly="readonly" value="<%=ap.getMobNo() %>">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label><input required
									name="diseases" type="text" class="form-control" readonly="readonly" value="<%=ap.getDiseases()%>">
							</div>
							
							<div class="col-md-12">
								<label for="inputEmail4" class="form-label">Comment</label><textarea required
									name="comment" type="text" rows="3" class="form-control"></textarea>
							</div>
							<input type="hidden"  name="id" value="<%=ap.getId() %>">
					        <input type="hidden"  name="did" value="<%=ap.getDoctorId() %>">
							
							<button class=" mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
						</form>
					</div>
				</div>
			</div>
</body>
</html>