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
<style type="text/css">
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 80%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
}

th {
	background-color: #555;
	color: #fff;
}

/*  tr:nth-child(odd) {
  background-color: #eee;
}  */
tr:nth-child(even) {
	background-color: #dddddd;
}
}
</style>
<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	width: 100%;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.container {
	padding: 2px 16px;
}
</style>
</head>
<body>


	
	
	<div class="container">
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
						<%-- <td>${playerIterate.playerPhoto }</td> --%>
						<td>${playerIterate.playerName }</td>
						<td>${playerIterate.categoryName }</td>
						<td>${playerIterate.finalBidPrice}</td>
						
						
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	</div>


	<script>
		function auction() {
			window.location.href = "http://localhost:8083/auction";
		}
	</script>

</body>
</html>