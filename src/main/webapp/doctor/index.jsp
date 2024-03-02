<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>  
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
<h2 class="text-center">Doctor Dashboard</h2>
 <div class="container">
 
    <%     Doctor d= (Doctor)session.getAttribute("doctObj");
         
         DoctorDao dao=new DoctorDao(DBConnect.getConn()); %>
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">

					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor<br><%=dao.countDoctor() %>
						</p>

					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card paint-card">

					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment<br><%=dao.countAppointmentByDoctorId(d.getId()) %>
						</p>

					</div>
				</div>
			</div>
			</div>
			</div>
</body>
</html>