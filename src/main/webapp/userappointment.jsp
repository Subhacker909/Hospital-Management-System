<%@page import="com.dao.*"%>
<%@page import="com.entity.Doctor"%>
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
.backImg{
   background:linear-gradient(rgba(0,0,0,0.4),rgba(0,0,0,0.4)),url("img/hospital.jpg");
   height:15vh;
   width:100%;
   background-size:cover;
   background-repeat:no-repeat;

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
			<div class="col-md-6 p-5">
				<img src="img/doct.jpg" alt="image" id="doct">
			</div>
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">User Appointment</p>
						<c:if test="${not empty sucmsg }">
							<p class="text-center text-success fs-5">${sucmsg}</p>
							<c:remove var="sucmsg" scope="session" />
						</c:if>
						<c:if test="${not empty errmsg }">
							<p class="text-center text-danger fs-5">${errmsg}</p>
							<c:remove var="errmsg" scope="session" />
						</c:if>
						<form class="row g-3" action="addappointment" method="post">
							<input type="hidden" name="userid" value="${userObj.id }">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label><input
									required name="fullName" type="text" class="form-control">
							</div>
							<div class="col-md-6">
								<label class="form-label">Gender</label><select required
									name="gender" class="form-control">
									<option value="male">Male</option>
									<option value="female">Female</option>

								</select>
							</div>
							<div class="col-md-6">
								<label  for="inputEmail4" class="form-label">Age</label><input required name="age"
									type="number" class="form-control">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment Date</label><input required
									name="appointDate" type="date" class="form-control">
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label><input required
									name="email" type="email" class="form-control">
							</div>
							<div class="col-md-6">
								<label class="form-label">Mob No</label><input required
									name="mobNo" maxlength="10" type="number" class="form-control">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label><input required
									name="diseases" type="text" class="form-control">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Doctor</label><select required
									name="doct" class="form-control">
									<option value="">---select---</option>
                                  <% DoctorDao dao=new DoctorDao(DBConnect.getConn());
									  List<Doctor> list=dao.getAllDoctor();
									  for(Doctor d: list)
									  {%>
								         <option value="<%=d.getId() %>"><%=d.getFullName()%>(<%=d.getSpecialist() %>)
										  </option> 
									  <% }
									
									%>
								</select>
							</div>
							<div class="col-md-12">
								<label for="inputEmail4" class="form-label">Full Address</label><textarea required
									name="address" type="text" rows="3" class="form-control"></textarea>
							</div>
							<c:if test="${ empty userObj }">
							<a href="userlogin.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
						</c:if>
						<c:if test="${not empty userObj }">
							<button  class="col-md-6 offset-md-3 btn btn-success">Submit</button>
						</c:if>
						</form>
					</div>
				</div>
			</div>
</body>
</html>