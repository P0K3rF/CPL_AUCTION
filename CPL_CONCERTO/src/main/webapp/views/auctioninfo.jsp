<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Auction Info</title>
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
					<div class="row">
						<div class="col-8">
							<h1>${name.toUpperCase()}${year}Information</h1>
						</div>
						<div class="col-2 offset-1 ">
							<button class="btn btn-success rounded-pill btn-lg"
								onclick="auctionPage()">Auction Page</button>
						</div>
						<div class="row">
							<div class="col-2 offset-9 my-2">
								<span class="fas fa-hand-point-up fa-bounce fa-xl px-3"></span>
							</div>
						</div>
					</div>
					<hr>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-2">
							<select class="form-select" aria-label="Default select example" onchange="getTeamPlayers()" id="team">
								<option selected disabled="disabled">Teams</option>

								<c:forEach items="${teams}" var="team">
									<option>${team}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-2 offset-1">


							<select class="form-select" aria-label="Default select example">
								<option selected>Players</option>
							</select>
						</div>
						<div class="col-2 offset-1">


							<select class="form-select" aria-label="Default select example">
								<option selected>Owners</option>
							</select>
						</div>
						<div class="col-2 offset-1">


							<select class="form-select" aria-label="Default select example">
								<option selected>Categories</option>
							</select>
						</div>
					</div>

				</div>

			</div>
			
			
			
			<div class="card shadow  mb-2 bg-white rounded h-8 my-3 mx-3" id="Player Details">
			
				
			
			
			</div>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		</div>

	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<script>
		function auctionPage() {
			window.location.href = "http://10.10.11.35:8083/auction";
		}
		
		function getTeamPlayers(){
			let team=$('#team').find(":selected").text();
			
			$.ajax({
				type : "POST",
				contentType : 'application/json; charset=utf-8',
				dataType : 'json',
				url : 'getplayerbyname',
				data : JSON.stringify({"teamName":team}),
				success : function(result) {
					
					$.each
				},error:function(xhr, status, error){
					
				}
				
				
				
			})
			
			
			
		}
		
	</script>
</body>
</html>