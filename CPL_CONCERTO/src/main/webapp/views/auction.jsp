
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
									id="category" required>
									<option value="" selected="selected" disabled="disabled">Category</option>

									<c:forEach items="${categoryNames}" var="categoryNames">
										<option value="${categoryNames}">${categoryNames}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-3">
								<select class="form-select" aria-label="Default select example"
									id="Grade">
									<option selected disabled="disabled" value="">Grade</option>

									<c:forEach items="${categoryGrade}" var="categoryGrade">
										<option value="${categoryGrade}">${categoryGrade}</option>
									</c:forEach>
								</select>

							</div>
							
							<div class="col-2">
								<select class="form-select" aria-label="Default select example"
									id="Filter">
									<option selected value="All">All</option>

									
										<option value="Sold">Sold</option>
									<option value="UnSold">Unsold</option>
				
								</select>

							</div>
							
							<div class="col-1">
								<button class="btn btn-success" type="submit"	onclick="searchPlayer(1)">Search</button>
							</div>
						
					</div>

				</div>
			</div>
			<hr>
			<div class="card shadow  mb-2 bg-white rounded h-8 my-3 mx-3"
				style="display: none" id="playerDetailCard">

				<div class="card-title mx-3 my-3">
					<h3>
						Player Details: <span id="playerCount"></span>
					</h3>
					<hr>
				</div>
				<div class="card-body" id="playerData">
					<div class="row">
						<div class="col-2 mx-3" style="border: 2px solid">

							<img class="card-img-top img-fluid img-responsive"
								id="profile-photo" 
								alt="Suresh Dasari Card" style="height: 250px; width: 200px;" onerror=this.src="../images/defaultprofile.png">
							<div id="sold" style="display:none" >SOLD</div>
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

						<div class="col-2 ">
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
						<div class="col-2 ">
							<label for="firstName" style="margin-top: 5%"> Fifties :</label>
							<input type="text" class="form-control font-weight-bold"
								id="Fifties" name="firstName" readonly="readonly"> <label
								for="firstName" style="margin-top: 5%"> Hundreds :</label> <input
								type="text" class="form-control font-weight-bold" id="Hundreds"
								name="firstName" readonly="readonly"> <label
								for="firstName" style="margin-top: 5%"> Highest Run :</label> <input
								type="text" class="form-control font-weight-bold" id="Highest"
								name="firstName" readonly="readonly">
						</div>
						<div class="col-2 ">
							<label for="firstName" style="margin-top: 5%"> BallStyle
								:</label> <input type="text" class="form-control font-weight-bold"
								id="BallStyle" name="firstName" readonly="readonly"> <label
								for="firstName" style="margin-top: 5%"> Total Wickets :</label>
							<input type="text" class="form-control font-weight-bold"
								id="Wickets" name="firstName" readonly="readonly"> <label
								for="firstName" style="margin-top: 5%"> Economy :</label> <input
								type="text" class="form-control font-weight-bold" id="Economy"
								name="firstName" readonly="readonly"> <label
								for="firstName" style="margin-top: 5%"> Best Over :</label> <input
								type="text" class="form-control font-weight-bold" id="Over"
								name="firstName" readonly="readonly">
						</div>


					</div>
					<hr>
					<div class="row mx-3">
						<div class="col-2">
							<select class="form-select" aria-label="Default select example"
								style="margin-top: 18%" id="team" required="required">
								<option selected disabled="disabled" value="">Teams</option>

								<c:forEach items="${teams}" var="team">
									<option value="${team}">${team}</option>
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
						<div class="col-2 ">
							<button class="btn btn-success " style="font-size: 20px"
								onclick="sold()" id="sold-btn">
								SOLD <span class="fa fa-check"></span>
							</button>
						</div>
						<div class="col-2">
							<button class="btn btn-danger" style="font-size: 20px"
								onclick="unSold()" id="unsold-btn">
								UNSOLD <span class="fa fa-times"></span>
							</button>
						</div>
						<div class="col-2 offset-4" id="previous-button"></div>
						<div class="col-2 " id="next-button"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
	
	//Preventing for typing letters
	  $("#Increased").keydown(function(event) {
	         if(event.which>=48 && event.which<=57 || event.which==8){
	         }else{
	        	 event.preventDefault()
	        	 
	         }
	    });
	
	//Incrementing the total biding price
		function increasePrice() {
			 
			let baseValue = $('#Increased').val()
			let increaseValue = $('#Base-Price').val()
			var regx = /^[0-9]*$/;
			if(regx.test(baseValue)&&regx.test(increaseValue)){
			$('#Total-Price').val(Number(baseValue) +Number(increaseValue))				
			}
			
		}
	//Regex for checking numbers
		function checkfornumber(number){
			var regx = /^[0-9]*$/;
		}

	
		var resultSize=0;
		var pageNext=0;
		function searchPlayer(pageno) {
			console.log(pageno)
			let category = $('#category').find(":selected").val();
			let grade = $('#Grade').find(":selected").val();
			let filter=$('#Filter').find(":selected").val();
			if(category=="" && grade!=""){
				$('#category').css('border-color','red')
				$('#Grade').css('border-color','green')
			}else if(category!="" && grade=="")
			{
				$('#category').css('border-color','green')
				$('#Grade').css('border-color','red')
			}else if(category=="" && grade==""){
				$('#category').css('border-color','red')
				$('#Grade').css('border-color','red')
			}else{
				$('#category').css('border-color','green')
				$('#Grade').css('border-color','green')
			let data = {

				"categoryName" : category,
				"categoryGrade" : grade,
				"pageNo" : pageno,
				"filter" :filter
			}
		 
			$.ajax({

				type : "POST",
				contentType : 'application/json; charset=utf-8',
				dataType : 'json',
				url : 'playerdata',
				data : JSON.stringify(data),
				success : function(result) {
			pageNext=Number(pageno);
					if(result.statusCode==401){
						
						$('#playerDetailCard').hide()
						swal('No Data Found')
					}else{
						console.log(result)
						if(result.filter=="sold"){
							$('#sold').show()
							$('#sold-btn').hide()
							$('#unsold-btn').hide()
						}
						else{
							$('#sold').hide()
							$('#sold-btn').show()
							$('#unsold-btn').show()
						}
						resultSize=result.size
						if(Number(pageNext)==1){
							$('#previous-button').html('');
						}
						if( Number(pageNext)==Number(resultSize)){
							$('#next-button').html('');
						}else{			
							$('#next-button').html('<button class="btn btn-primary" onclick="next()"> Next<span class="fa fa-angle-double-right"></span></button>')
						}
					$('#playerDetailCard').show()
					
					$('#profile-photo').attr('src',
							'../images/' + result.data.playerPhoto);
					$('#profile-photo').attr('alt','../images/defaultprofile.png')

					$('#name').val(result.data.playerName)
					$('#Dob').val(result.data.playerDOB)
					$('#Debut').val(result.data.playerDebut)
					$('#Fifties').val(result.data.fifties)
					$('#Hundreds').val(result.data.hundreds)
					$('#Highest').val(result.data.highestRuns)
					$('#Over').val(result.data.bestOver)
					$('#Total-Price').val(result.data.minimumBid)

					$('#playerCount').html('('+pageNext+'/'+resultSize+')')
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
					}
				},
				error : function(xhr, status, error) {

				}
			}) 
				
			}
		}
		
		
		
		function next(){
			$('#previous-button').html('<button class="btn btn-warning" onclick="previous()"><span class="fa fa-angle-double-left"></span> Previous</button>');
			$('#Increased').val('')
			searchPlayer(Number(++pageNext))
		}
		
		function previous(){
			searchPlayer(Number(--pageNext))
		}
		
		function sold(){
			let teamName = $('#team').find(":selected").val();
			if(teamName==""){
				$('#team').css('border-color','red')
			}else{
				$('#team').css('border-color','green')
			
		let name=$('#name').val()
		let totalPrice=$('#Total-Price').val()
		let sold=true
		let data={
				
				"teamName":teamName,
				"playerName":name,
				"bidPrice":totalPrice,
				"sold":sold
		}
		soldUnsold(sold,data)
			}
		}
		function unSold(){
			if(teamName==""){
				$('#team').css('border-color','red')
			}else{
				$('#team').css('border-color','green')
			}
			let teamName = $('#team').find(":selected").text();
			let name=$('#name').val()
			let totalPrice=$('#Total-Price').val()
			let sold=false
			
			let data={
					
					"teamName":teamName,
					"playerName":name,
					"bidPrice":totalPrice,
					"sold":sold
			}
			soldUnsold(sold,data)
		}
		
		
		function soldUnsold(temp,data){
			console.log(data)
			$.ajax({

				type : "POST",
				contentType : 'application/json; charset=utf-8',
				dataType : 'json',
				url : 'insertauctiondata',
				data : JSON.stringify(data),
				success : function(result) {
			
					if(temp){
						swal($('#name').val() + ' Sold to ' + $('#team').find(":selected").text())
						.then((value)=>searchPlayer(pageNext+1))
					}else{
						swal($('#name').val() + ' Unsold')
						.then((value)=>searchPlayer(pageNext+1))
					}
				},error:function(xhr, status, error)
				{
					
				}
				
				
			})
	
		}
		
		
		
		
	</script>
</body>
</html>