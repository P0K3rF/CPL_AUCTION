<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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


	<div class="container my-3">
		<div class="table-responsive">
			<table
				class="table table-hover table-bordered table-info border-warning">
				<thead>
				<tr>
				<th> <img class="card-img-top img-fluid img-responsive"
							src="../images/${teamDetails.profilePhoto}"
							alt="Default" style="height: 100px; width: 150px;"></th>
				</thead>
				<thead>
					<tr>
					<th>Player</th>
					<th>Player Name</th>
					<th>Category</th>
					<th>Final price</th>
				</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Sit</td>
						<td>Amet</td>
						<td>Consectetur</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Adipisicing</td>
						<td>Elit</td>
						<td>Sint</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>Hic</td>
						<td>Fugiat</td>
						<td>Temporibus</td>
					</tr>
				</tbody>

			</table>
		</div>
	</div>



	<%-- 	<div class="container">
	<div class="col-2 offset-10 " style="margin-bottom:1%">
		<button class="btn btn-success rounded-pill btn-lg"
			onclick="auction()">Auction Page</button>
	</div>
	<div class="row">
		<div class="col-sm-6">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">${teamDetails.teamName}</h5>
						<img class="card-img-top img-fluid img-responsive"
							src="../images/${teamDetails.profilePhoto}"
							alt="Default" style="height: 100px; width: 150px;">
					</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">OWNER : ${ownerName}</h5>
					<h5 class="card-title">PLAYERS : ${remainingPlayers}/20</h5>
					<h5 class="card-title">PURSE LEFT : ${purseLeft}/8500</h5>
					
				</div>
			</div>
		</div>

		<div class="clearfix" style="margin-bottom:2%"></div>
		<div>
		


			<table class="offset-1" class="center"
				style="border: 4px solid black">

				<tr>
					<th>Player</th>
					<th>Player Name</th>
					<th>Category</th>
					<th>Final price</th>
				</tr>
				<c:forEach items="${playerList}" var="playerIterate">
					<tr>
					 <td><img src="../images/${playerIterate.profilePhoto}" height="100" width="100" onerror=this.src="../images/defaultprofile.png"	></td>
						<td>${playerIterate.playerPhoto }</td>
						<td>${playerIterate.playerName }</td>
						<td>${playerIterate.categoryName }</td>
						<td>${playerIterate.finalBidPrice}</td>
						
						
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	</div> --%>


	<script>
		function auction() {
			window.location.href = "http://localhost:8083/auction";
		}
	</script>

</body>
</html>