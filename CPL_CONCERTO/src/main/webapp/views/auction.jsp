<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Auction Page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
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
			<h3>Welcome to Auction Page</h3>
			<hr>
			</div>
			<div class="card-body">
			<div class="row">
			<div class="col-3">
			<select class="form-select" aria-label="Default select example">
								<option selected>Category</option>

								<c:forEach items="${categoryNames}" var="categoryNames">
									<option>${categoryNames}</option>
								</c:forEach>
							</select>
			</div>
			<div class="col-3">
			<select class="form-select" aria-label="Default select example">
								<option selected>Grade</option>

								<c:forEach items="${categoryGrade}" var="categoryGrade">
									<option>${categoryGrade}</option>
								</c:forEach>
							</select>
			</div>
			</div>
			
			</div>
		</div>
		
		
		</div>
	</div>


</body>
</html>