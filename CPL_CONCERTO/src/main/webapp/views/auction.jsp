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
							<select class="form-select" aria-label="Default select example"
								id="category">
								<option selected disabled="disabled">Category</option>

								<c:forEach items="${categoryNames}" var="categoryNames">
									<option>${categoryNames}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-3">
							<select class="form-select" aria-label="Default select example"
								id="Grade">
								<option selected disabled="disabled">Grade</option>

								<c:forEach items="${categoryGrade}" var="categoryGrade">
									<option>${categoryGrade}</option>
								</c:forEach>
							</select>

						</div>
						<div class="col-1">
							<button class="btn btn-success" onclick="searchPlayer()">Search</button>
						</div>
					</div>

				</div>
			</div>
			<hr>
			<div class="card shadow  mb-2 bg-white rounded h-8 my-3 mx-3">
				<div class="card-title mx-3 my-3">
					<h3>Player Details:</h3>
					<hr>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-2 mx-3" style="border: 2px solid">

							<img class="card-img-top img-fluid img-responsive"
								id="profile-photo" src="../images/team1.jpg"
								alt="Suresh Dasari Card" style="height: 250px; width: 200px;">
						</div>

						<div class="col-3" style="border-right: 2px solid green">
							<label for="firstName" style="margin-top: 5%"> Name :</label> <input
								type="text" class="form-control font-weight-bold" id="name"
								name="firstName" readonly="readonly"> <label
								for="firstName" style="margin-top: 5%"> Date of Birth :</label>
							<input type="text" class="form-control font-weight-bold" id="Dob"
								name="firstName" readonly="readonly"> <label
								for="firstName" style="margin-top: 5%"> Debut :</label> <input
								type="text" class="form-control font-weight-bold" id="Debut"
								name="firstName" readonly="readonly">
						</div>

						<div class="col-3 ">
							<label for="firstName" style="margin-top: 5%"> Batstyle :</label>
							<input type="text" class="form-control font-weight-bold"
								id="Batstyle" name="firstName" readonly="readonly"> <label
								for="firstName" style="margin-top: 5%"> Total Runs :</label> <input
								type="text" class="form-control font-weight-bold" id="Runs"
								name="firstName" readonly="readonly"> <label
								for="firstName" style="margin-top: 5%"> Strike Rate :</label> <input
								type="text" class="form-control font-weight-bold"
								id="Strike-Rate" name="firstName" readonly="readonly">
						</div>

						<div class="col-3 ">
							<label for="firstName" style="margin-top: 5%"> BallStyle
								:</label> <input type="text" class="form-control font-weight-bold"
								id="BallStyle" name="firstName" readonly="readonly"> <label
								for="firstName" style="margin-top: 5%"> Total Wickets :</label>
							<input type="text" class="form-control font-weight-bold"
								id="Wickets" name="firstName" readonly="readonly"> <label
								for="firstName" style="margin-top: 5%"> Economy :</label> <input
								type="text" class="form-control font-weight-bold" id="Economy"
								name="firstName" readonly="readonly">
						</div>
					</div>
					<hr>
					<div class="row mx-3">
						<div class="col-2">
							<select class="form-select" aria-label="Default select example"
								style="margin-top: 18%">
								<option selected>Teams</option>

								<c:forEach items="${teams}" var="team">
									<option>${team}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-2 offset-1">
							<label for="firstName" style="margin-top: 5%"> Base Price
								:</label> <input type="text" class="form-control font-weight-bold"
								id="Base-Price" name="firstName" readonly="readonly">
						</div>
						<div class="col-1" style="margin-top: 3%; padding-left: 30px">
							<span style="font-size: 20px">+</span>
						</div>
						<div class="col-2">
							<label for="firstName" style="margin-top: 5%"> Increased
								By :</label> <input type="text" class="form-control font-weight-bold"
								id="Increased" name="firstName" onkeyup="increasePrice()">

						</div>
						<div class="col-1" style="margin-top: 3%; padding-left: 30px">
							<span style="font-size: 20px">=</span>
						</div>
						<div class="col-2">

							<label for="firstName" style="margin-top: 5%"> Total
								Price :</label> <input type="text" class="form-control font-weight-bold"
								id="Total-Price" name="firstName">
						</div>

					</div>
					
					<div class="row my-4 ">
					<div class="col-2 offset-8">
					<button class="btn btn-success "style="font-size: 20px" onclick="sold()">SOLD <span class="fa fa-check"></span></button>
					</div>
					<div class="col-2">
					<button class="btn btn-danger" style="font-size: 20px" onclick="unSold()">UNSOLD <span class="fa fa-times"></span></button>
					</div>
					
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>

	<script>
		function increasePrice() {
			let baseValue = $('#Increased').val()
			let increaseValue = $('#Base-Price').val()
			var regx = /^[0-9]*$/;
			console.log(regx.test(baseValue))
			if(regx.test(baseValue)&&regx.test(increaseValue)){
			$('#Total-Price').val(Number(baseValue) +Number(increaseValue))				
			}
			
		}

		var pageno = 0;
		function searchPlayer() {
			let category = $('#category').find(":selected").text();
			let grade = $('#Grade').find(":selected").text();

			let data = {

				"categoryName" : category,
				"categoryGrade" : grade,
				"PageNo" : pageno
			}
			$.ajax({

				type : "POST",
				contentType : 'application/json; charset=utf-8',
				dataType : 'json',
				url : 'playerdata',
				data : JSON.stringify(data),
				success : function(result) {
					console.log(result)

					$('#profile-photo').attr('src',
							'../images/' + result.data.playerPhoto);

					$('#name').val(result.data.playerName)
					$('#Dob').val(result.data.playerDOB)
					$('#Debut').val(result.data.playerDebut)

					if (result.data.playerBatStyle == null) {
						$('#Batstyle').val('--')
					} else {
						$('#Batstyle').val(result.data.playerBatStyle)
					}

					if (result.data.playerRuns == null) {
						$('#Runs').val('--')
					} else {
						$('#Runs').val(result.data.playerRuns)
					}

					if (result.data.playerStrikeRate == null) {
						$('#Strike-Rate').val('--')
					} else {
						$('#Strike-Rate').val(result.data.playerStrikeRate)
					}

					if (result.data.playerBallStyle == null) {
						$('#BallStyle').val('--')
					} else {
						$('#BallStyle').val(result.data.playerBallStyle)
					}

					if (result.data.playertotalWickets == null) {
						$('#Wickets').val('--')
					} else {
						$('#Wickets').val(result.data.playertotalWickets)
					}

					if (result.data.playerBallEconomy == null) {
						$('#Economy').val('--')
					} else {
						$('#Economy').val(result.data.playerBallEconomy)
					}

					$('#Base-Price').val(result.data.minimumBid)

					pageno++
				},
				error : function(xhr, status, error) {

				}
			})
		}
		
		
		
		
		
		function sold(){
			//After sold check for new player of the same list
		}
		function unSold(){
			//After Unsold check if there is next page
		}
		
		
		
		
		
		
		
	</script>
</body>
</html>