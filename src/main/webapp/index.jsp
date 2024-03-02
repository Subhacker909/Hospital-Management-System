<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital Management System</title>
<link rel="stylesheet" href="style.css">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
</style>
<%@include file="component/allcss.jsp"%>

</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/doc3.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/doc.webp" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/doc1.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<div class="card-group">
		<div class="card">
			<img src="img/doc4.webp" class="card-img-top" alt="..."
				height="200px">
			<div class="card-body">
				<h5 class="card-title">100%Safety</h5>
				<p class="card-text">The skill to heal.Facilitating good
					health.Where healing and compassion come together.It is time to
					live healthily.</p>
			</div>
		</div>
		<div class="card">
			<img src="img/doc5.jpg" class="card-img-top" alt="..." height="200px">
			<div class="card-body">
				<h5 class="card-title">Friendly Doctors</h5>
				<p class="card-text">Health is Wealth, Don't Compromise! Eat
					Right, Live Strong. Your Body Deserves the Best, Treat it Well.
					Fitness for Life, Not Just for Summer.</p>
			</div>
		</div>
		<div class="card">
			<img src="img/doc6.jpg" class="card-img-top" alt="..." height="200px">
			<div class="card-body">
				<h5 class="card-title">Clean Environment</h5>
				<p class="card-text">Medical excellence every day. Founded on
					faith. Focused on family. Hospital Slogans - Compassionate care.
					Extraordinary nursing. Compassionate care.</p>
			</div>
		</div>
	</div>
	<h3>
		<center>Our Team</center>
	</h3>
	<div class="row row-cols-1 row-cols-md-3 g-4">
		<div class="col">
			<div class="card h-100">
				<img src="img/1.jpg" class="card-img-top" alt="..." width="100px"
					height="200px">
				<div class="card-body">
					<h5 class="card-title">
						<center>Dr.Manoj Kumar</center>
					</h5>
					<p class="card-text">
					<center>(Chief Doctor)</center>
					</p>
				</div>

			</div>
		</div>
		<div class="col">
			<div class="card h-100">
				<img src="img/2.jpg" class="card-img-top" alt="..." width="100px"
					height="200px">
				<div class="card-body">
					<h5 class="card-title">
						<center>Dr.Batla Singh</center>
					</h5>
					<p class="card-text">
					<center>(Chief Doctor)</center>
					</p>
				</div>

			</div>
		</div>
		<div class="col">
			<div class="card h-100">
				<img src="img/3.jpg" class="card-img-top" alt="..." width="100px"
					height="200px">
				<div class="card-body">
					<h5 class="card-title">
						<center>Dr.Ashish Chauhan</center>
					</h5>
					<p class="card-text">
					<center>(Chief Doctor)</center>
					</p>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>