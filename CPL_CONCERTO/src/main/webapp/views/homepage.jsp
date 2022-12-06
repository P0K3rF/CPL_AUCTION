<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Homepage of CPL AUCTION</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous" />
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/style.css">
<style>
.card-img-top {
	object-fit: contain;
}
</style>
</head>
<body>
	<div class="wrapper">

		<%@include file="side_navbar.jsp"%>
		<div class="container" id="main-container">
			<div class="card shadow  mb-2 bg-white rounded h-8 my-3 mx-3">
				<div class="card-title text-center my-2">
					<h3>CPL AUCTION HOMEPAGE</h3>
				</div>
				<hr>
				<div class="card-body">
					<div class="row">
					
					<c:forEach items="${auction}" var="auction">
							<div class="col-3 offset-1">
							<div class="card">
								<div class="card-body text-center">
									<h4>${auction.auctionName}</h4>
									<img class="card-img-top img-fluid img-responsive"
										src="../images/cpl 2021.jfif" alt="Suresh Dasari Card"
										style="height: 140px; width: 250px;">
								</div>
								<div class="card-footer text-center">
									<a class="btn btn-outline-warning text-dark"
										href="http://10.10.11.35:8083/auctioninfo?name=${auction.auctionName}"
										id="addCart">Go to ${auction.auctionName} </a>
								</div>
							</div>
						</div>
								</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>