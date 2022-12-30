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
	width: 60%;
	height: 15vw;
	object-fit: fill;
}
.table {
    --bs-table-bg: transparent;
    --bs-table-striped-color: #212529;
    --bs-table-striped-bg: rgba(0, 0, 0, 0.05);
    --bs-table-active-color: #212529;
    --bs-table-active-bg: rgba(0, 0, 0, 0.1);
    --bs-table-hover-color: #212529;
    --bs-table-hover-bg: rgba(0, 0, 0, 0.075);
    width: 75%;
    margin-bottom: 1rem;
    color: #212529;
    vertical-align: top;
    border-color: #dee2e6;
    }
.table-bordered td, .table-bordered th {
    border: -5px solid #dee2e6;
}
</style>



</head>
<body>

	<div class="row my-2" style="border:2px solid green">
	<div class="col-1 my-3">
	<a class="btn btn-success text-white" onclick="previousPage()" role="button"><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</a>
	</div>
	<div class="col-5 align-items-center my-2" style="width: 37.6666666667%;">
			<div class="card mx-2 mx-4 bg-dark bg-gradient shadow-lg p-3 mb-5 rounded">
				<div class="card-body text-white">
					<h5 class="card-title text-center">${teamDetails.teamName}</h5>
					<div class="row">
					<div class="col-4">
					<img class="card-img-top img-fluid img-responsive"
							src="../images/${teamDetails.profilePhoto}"
							alt="Default" style="height: 130px; width: 200px;">
					</div>
					<div class="col-8  py-4">
					<h6>OWNER : ${ownerName}</h6>
					<h6>PLAYERS LEFT : ${remainingPlayers}/${totalPlayer}</h6>
					<h6>PURSE LEFT : ${purseLeft}/${PointsPerTeam}</h6>
					</div>
					</div>
						
					</div>
					</div>
			</div>
			
			<div class="col-6 py-2 text-center">
				<div class="table-responsive mx-4">
			<table
				class="table table-hover table-bordered table-info border-warning">
				<thead>
					<tr>
					<th>Player</th>
					<th>Player Name</th>
					<th>Category</th>
					<th>Final price</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${playerList}" var="playerIterate">
					<tr>
					 <td><img src="../images/${playerIterate.profilePhoto}" height="30" width="30" onerror=this.src="../images/defaultprofile.png"	></td>
						<td>${playerIterate.playerName }</td>
						<td>${playerIterate.categoryName }</td>
						<td>${playerIterate.finalBidPrice}</td>
						
						
					</tr>
				</c:forEach>
				
				</tbody>

			</table>
		</div>
			
			</div>
			
		
			
			
			
			</div>
		<%-- 
	<h5 class="card-title">OWNER : ${ownerName}</h5>
					<h5 class="card-title">PLAYERS : ${remainingPlayers}/20</h5>
					<h5 class="card-title">PURSE LEFT : ${purseLeft}/8500</h5> --%>
	
	
	<!-- 	 -->
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
		function previousPage(){
			 window.history.back()
		}
	</script>

</body>
</html>