<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital Management System</title>
<%@include file="component/allcss.jsp"%>

</head>
<body>
<%@include file="component/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Admin Login</p>
						<c:if test="${not empty sucmsg }">
						<p class="text-center text-success fs-5">${sucmsg}</p>
						<c:remove var="sucmsg" scope="session"/>
						 </c:if>
						<c:if test="${not empty errmsg }">
						<p class="text-center text-danger fs-5">${errmsg}</p>
						<c:remove var="errmsg" scope="session"/>
						 </c:if>
						 
						<form action="adminlogin" method="post">
							<div class="mb-3">
								<label class="form-label">Email Address</label><input required
									name="email" type="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label><input required
									name="password" type="password" class="form-control">
							</div>
							<button type="submit" class="btn bg-success text-white col-md-12">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>