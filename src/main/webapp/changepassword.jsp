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

</head>
<body>
<c:if test="${empty userObj }">
		<c:redirect url="../userlogin.jsp"></c:redirect>

	</c:if>
	<%@include file="user/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Change Password</p>
						 <c:if test="${not empty sucmsg }">
						<p class="text-center text-success fs-5">${sucmsg}</p>
						<c:remove var="sucmsg" scope="session"/>
						 </c:if>
						<c:if test="${not empty errmsg }">
						<p class="text-center text-success fs-5">${errmsg}</p>
						<c:remove var="errmsg" scope="session"/>
						 </c:if>
						<form action="changepassword" method="post">
							<div class="mb-3">
								<label class="form-label">Enter Old Password</label><input required
									name="oldpass" type="password" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Enter New Password</label><input required
									name="newpass" type="password" class="form-control">
							</div>
							<button type="submit" class="btn bg-success text-white col-md-12">Change Password</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>