
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

#soldimg {
	position: absolute;
	left: 57px;
	top: 175px;
	z-index: 1;
	opacity: 0.7;
	transform: rotate(-20deg);
}

.card-title {
	margin-bottom: 0 !important;
}

.display-6 {
	font-size: calc(0.1rem + 1vw);
	line-height: 2;
}
.modal-lg, .modal-xl {
    --bs-modal-width: 1000px;
}

#tooltip {
	display: none;
	position: absolute;
	cursor: pointer;
	color: red;
	/*   left: 100px; */
	top: 80px;
	border: solid 1px #eee;
	background-color: #ffffdd;
	padding: 10px;
	z-index: 1;
	top: 80px
}
.hr {
    margin: 0;
    color: inherit;
    border: 0;
    border-top: 1px solid;
    opacity: .25;
}

</style>
</head>
<body>
	<div class="wrapper">

		<%@include file="side_navbar.jsp"%>

		<div class="container" id="main-container">
			<div class="card shadow bg-white rounded mx-3">
				<div class="card-body" style="padding: 0.2rem;">
					<div class="row text-center">
						<h5>Welcome to CPL 2023 Auction</h5>
					</div>
					<hr style="padding: 0px; margin: 0.4rem 0">

					<div class="row">


						<div class="col-2" style="margin-left: 20px;width: 17.66666667%;">
							<select class="form-select" aria-label="Default select example"
								id="category" required>
								<option value="" selected="selected" disabled="disabled">Category</option>

								<c:forEach items="${categoryNames}" var="categoryNames">
									<option value="${categoryNames}">${categoryNames}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-2" style="width: 15.66666667%;">
							<select class="form-select" aria-label="Default select example"
								id="Grade">
								<option selected disabled="disabled" value="">Grade</option>

								<c:forEach items="${categoryGrade}" var="categoryGrade">
									<option value="${categoryGrade}">${categoryGrade}</option>
								</c:forEach>
							</select>

						</div>

						<div class="col-2" style="width: 14.66666667%;">
							<select class="form-select" aria-label="Default select example"
								id="Filter">
								<option selected value="All">All</option>
								<option value="Sold">Sold</option>
								<option value="UnSold">Unsold</option>

							</select>

						</div>

						<div class="col-1" style="width: 10.33333333%;">
							<button class="btn btn-success" type="submit"
								onclick="searchPlayer(1)">Search</button>
						</div>
						<div class="col-3 mx-4">
							<a class="btn btn-primary text-white" onclick="getTeamDetails()"
								role="button" data-bs-toggle="modal" data-bs-target="#Team-Detail-Modal"><i class="fa-solid fa-book-open-reader"></i>Team Details</a>
						</div>
					</div>

				</div>
			</div>
			
			
			<div class="modal fade " id="Team-Detail-Modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: none">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5>Team Details</h5>
				</div>
				<div class="modal-body" id="modalbody">
				
				<div class="row" id="modal-row">

				</div>
				
				
				</div>				
				</div>
		
				<div class="modal-footer text-center" id="modalfooter">
				
				</div>
				
			</div>
		</div>
			

			<hr>
			<div class="card shadow  mb-2 bg-white rounded h-8 my-3 mx-3"
				id="playerDetailCard" style="display: none">
				<div class="card-title mx-3 my-3">
					<div class="row">
						<div class="col-4">
							<h6>
								Player Details: <span id="playerCount"></span>
							</h6>
						</div>
						<div class="col-4 offset-3"></div>
					</div>
					<hr style="margin:0px">
				</div>
				<div class="card-body" id="playerData">
					<div class="row">
						<div class="col-2 mx-3" style="border: 2px solid">
							<div>
								<img id="soldimg" src="../images/Sold images.jpg" height="80px"
									width="100px">
							</div>
							<img class="card-img-top img-fluid img-responsive"
								id="profile-photo" alt="Suresh Dasari Card"
								style="height: 210px; width: 200px;" onerror=this.src="../images/defaultprofile.png">

						</div>




						<div class="col-3"
							style="border-right: 2px solid green; width: 22%;">
							<label for="firstName" class="fw-light" style="margin-top: 5%">Full
								Name </label> <br> <label class="fw-bold display-6" id="name"></label>
							<br> <label for="firstName" class="fw-light"
								style="margin-top: 5%"> Date of Birth :</label> <br> <label
								class="fw-bold display-6" id="Dob"></label> <br> <label
								for="firstName" class="fw-light" style="margin-top: 5%">
								Debut :</label> <br> <label class="fw-bold display-6" id="Debut"></label>
							<br>
						</div>

						<div class="col-6">
							<div class="row">
								<div class="col-6">
									<label for="firstName" class="fw-light" style="margin-top: 5%">
										Batstyle :</label> <br> <label class="fw-bold display-6"
										id="Batstyle"></label> <br>
								</div>
								<div class="col-6">
									<label for="firstName" class="fw-light" style="margin-top: 5%">
										Ballstyle :</label> <br> <label class="fw-bold display-6"
										id="BallStyle"></label> <br>
								</div>
							</div>
							<div class="row">
								<div class="col-4">
									<label for="firstName" class="fw-light" style="margin-top: 5%">
										Twenties :</label> <br> <label class="fw-bold" id="Twenties"></label>
									<br>
								</div>
								<div class="col-4">
									<label for="firstName" class="fw-light" style="margin-top: 5%">
										Thirties :</label> <br> <label class="fw-bold display-6"
										id="Thirties"></label> <br>
								</div>
								<div class="col-4">
									<label for="firstName" class="fw-light" style="margin-top: 5%">
										Fifties :</label> <br> <label class="fw-bold display-6"
										id="Fifties"></label> <br>
								</div>
							</div>
							<div class="row">
								<div class="col-4">
									<label for="firstName" class="fw-light" style="margin-top: 5%">
										Total Runs :</label> <br> <label class="fw-bold display-6"
										id="Runs"></label> <br>
								</div>
								<div class="col-4">
									<label for="firstName" class="fw-light" style="margin-top: 5%">
										Total Wickets :</label> <br> <label class="fw-bold display-6"
										id="Wickets"></label>
								</div>
							</div>
						</div>
						<!-- 	<div class="col-2 ">
							<label for="firstName" class="fw-light" style="margin-top: 5%"> Batstyle :</label>
							<br>
							<label class="fw-bold" id="Batstyle"></label>
							<br>
								 <label
								for="firstName" class="fw-light" style="margin-top: 5%"> Total Runs :</label>
								 <br>
								 <label class="fw-bold display-6" id="Runs"></label>
								 <br>
								<label
								for="firstName" class="fw-light" style="margin-top: 5%"> Twenties :</label> 
							<br>
							<label class="fw-bold" id="Twenties"></label>
							<br>
						</div> -->



						<!-- 	
						<div class="col-2 ">
							<label for="firstName" class="fw-light" style="margin-top: 5%"> Thirties :</label>
							<br>
							 <label class="fw-bold display-6" id="Thirties"></label>
						<br>
								 <label
								for="firstName" class="fw-light" style="margin-top: 5%"> Fifties :</label>
								 <br>
								 <label class="fw-bold display-6" id="Fifties"></label>
				                <br>
								<label
								for="firstName" class="fw-light" style="margin-top: 5%"> Highest Run :</label>
								 <br>
								 <label class="fw-bold display-6" id="Highest"></label>
								<br>
						</div> -->



						<!-- <div class="col-2 ">
							<label for="firstName" class="fw-light" style="margin-top: 5%"> BallStyle
								:</label> 
								<br>
								 <label class="fw-bold" id="BallStyle"></label>
								<br>
								 <label
								for="firstName" class="fw-light" style="margin-top: 5%"> Total Wickets :</label>
						    <br>
							<label class="fw-bold display-6" id="Wickets"></label>
						<br>
								
						</div> -->


					</div>
					<hr style="margin:0.6rem">
					<div class="row mx-3" id="Bidding-Details" style="height: 60px;">
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
						<div class="col-2 my-3">

							<div class="input-group py-3">
								<div class="input-group-prepend">
									<button class="btn btn-outline-secondary" id="decrease-btn"
										type="button" onclick="decreaseBidAmount()">-</button>
								</div>
								<input type="text" class="form-control" id="Increased"
									onkeyup="increasePrice()" placeholder="Increased By"
									readonly="readonly" value="0">
								<div class="input-group-append">
									<button class="btn btn-outline-secondary" id="increase-btn"
										type="button" onclick="increaseBidAmount()">+</button>
								</div>
								<p id="max-bid" style="font-size: 0.9rem;">
								<p id="tooltip" style="font-size: 0.9rem;">Cannot Exceed
									Maximum Bid</p>
							</div>

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
						<div class="col-1" style="width: 12.33333333%">
							<button class="btn btn-success " style="font-size: 13px"
								onclick="sold()" id="sold-btn">
								SOLD <span class="fa fa-check"></span>
							</button>
						</div>
						<div class="col-1" style="width: 12.33333333%">
							<button class="btn btn-danger" style="font-size: 13px"
								onclick="unSold()" id="unsold-btn">
								UNSOLD <span class="fa fa-times"></span>
							</button>
						</div>
						<div class="col-5" id="soldTeamName"></div>
						<div class="col-2" id="previous-button" ></div>
						<div class="col-2 " id="next-button"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
							
			}
			
			
		}
	//Regex for checking numbers
		function checkfornumber(number){
			var regx = /^[0-9]*$/;
		}
	
	//Function increaseBidAmount
	function increaseBidAmount(){
		$('#decrease-btn').show()
		let increaseAmount=$('#Increased').val()
		let basePrice=Number($('#Base-Price').val());
		let increaseValue=Number(increaseBy)+Number(increaseAmount)
		if(increaseValue+basePrice<=maxBidAmount){
			$('#Increased').val(increaseValue)
			$('#Total-Price').val(Number($('#Increased').val()) +basePrice)
		}else{
			
			$('#increase-btn').hide()
			 $("#tooltip").show();
			
		}
		
		
	}
	function	decreaseBidAmount(){
		$('#increase-btn').show()
		 $("#tooltip").hide();
		let increaseAmount=$('#Increased').val()
		let decreaseValue=Number(increaseAmount)-Number(increaseBy);
		if(decreaseValue>=0){	
			
		$('#Increased').val(decreaseValue)
		$('#Total-Price').val(Number($('#Increased').val()) +Number($('#Base-Price').val()))
		}else{
			$('#decrease-btn').hide()
		}
		
	}
	
        var increaseBy=0;
        var maxBidAmount=0;
		var resultSize=0;
		var pageNext=0;
		function searchPlayer(pageno) {
			$('#increase-btn').show()
			$('#decrease-btn').hide()
			$("#tooltip").hide();
			$("#team").prop("selectedIndex", 0);
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
				console.log(data)
		 
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
						swal('No Player Found')
					}
					else{
						console.log(result)
						if(result.filter=="sold"){
						
							$('#soldTeamName').html('<Strong>PlayerSold to Team : <Strong style="color:blue">' + result.data.teamName + '</Strong>')
							
							$('#soldimg').show()
							$('#sold-btn').hide()
							$('#unsold-btn').hide()
							$('#Bidding-Details').hide()
						}
						else{
						
							$('#soldTeamName').html('')
							$('#soldimg').hide()
							$('#sold').hide()
							$('#sold-btn').show()
							$('#unsold-btn').show()
							$('#Bidding-Details').show()
							$('#Increased').val('0')
						}
						resultSize=result.size
						increaseBy=result.increase;
						maxBidAmount=result.max_bid;
						$('#max-bid').html('Max Bid= '+maxBidAmount)
						if(Number(pageNext)==1){
							$('#previous-button').html('');
						}else{
							$('#previous-button').html('<button class="btn btn-warning" onclick="previous()" style="font-size: 13px"><span class="fa fa-angle-double-left"></span> Previous</button>');
						}
						if( Number(pageNext)==Number(resultSize)){
							$('#next-button').html('');
						}else{			
							$('#next-button').html('<button class="btn btn-primary" onclick="next()" style="font-size: 13px"> Next<span class="fa fa-angle-double-right"></span></button>')
						}
					$('#playerDetailCard').show()
					
					$('#profile-photo').attr('src',
							'../images/' + result.data.playerPhoto);
					$('#profile-photo').attr('alt','../images/defaultprofile.png')

					$('#name').text(result.data.playerName)
					$('#Dob').text(result.data.playerDOB)
					$('#Debut').text(result.data.playerDebut)
					$('#Fifties').text(result.data.fifties)
					$('#Hundreds').text(result.data.hundreds)
					$('#Highest').text(result.data.highestRuns)
					$('#Over').text(result.data.bestOver)
					$('#Total-Price').val(result.data.minimumBid)

					$('#playerCount').html('('+pageNext+'/'+resultSize+')')
					if (result.data.playerBatStyle == null) {
						$('#Batstyle').text('--')
					} else {
						$('#Batstyle').text(result.data.playerBatStyle)
					}
				if(result.data.highestRuns==null){
					$('#Highest').text('--')
				}else{
					$('#Highest').text(result.data.highestRuns)
				}
				if(result.data.fifties==null){
					$('#Fifties').text('--')
				}else{
					$('#Fifties').text(result.data.fifties)
				}
					
					if (result.data.playerRuns == null) {
						$('#Runs').text('--')
					} else {
						$('#Runs').text(result.data.playerRuns)
					}

					if (result.data.playerStrikeRate == null) {
						$('#Strike-Rate').text('--')
					} else {
						$('#Strike-Rate').text(result.data.playerStrikeRate)
					}

					if (result.data.playerBallStyle == null) {
						$('#BallStyle').text('--')
					} else {
						$('#BallStyle').text(result.data.playerBallStyle)
					}

					if (result.data.playertotalWickets == null) {
						$('#Wickets').text('--')
					} else {
						$('#Wickets').text(result.data.playertotalWickets)
					}

					if (result.data.playerBallEconomy == null) {
						$('#Economy').text('--')
					} else {
						$('#Economy').text(result.data.playerBallEconomy)
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
			
		let name=$('#name').text()
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
			swal($('#name').val() + ' Unsold')
			.then((value)=>searchPlayer(pageNext+1))
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
			console.log(result.statusCode)
			if(result.statusCode==403){
				swal('Team ' + $('#team').find(":selected").text() + ' has exceeded Maximum Purse Amount')
			}else if(result.statusCode==405){
				swal('Team '+$('#team').find(":selected").text() + ' already have 20 players Cannot exceed more')
			}else if(result.statusCode==200){
				if(temp){
					$('#Increased').val(0)
					swal($('#name').val() + ' Sold to ' + $('#team').find(":selected").text())
					.then((value)=>searchPlayer(pageNext+1))
				}else{
					swal($('#name').val() + ' Unsold')
					.then((value)=>searchPlayer(pageNext+1))
				}
			}
					
				},error:function(xhr, status, error)
				{
					
				}
				
				
			})
		}
		
	/* 	<div class="col-4">
		<div class="card mx-2 mx-4 bg-dark bg-gradient shadow-lg mb-2 p-3 rounded">
		<div class="card-body text-white">
			<h6 class="card-title text-center">Team Name</h6>
			<div class="row">
			<div class="col-3">
			</div>
			<h6>PLAYERS LEFT : 20/10</h6>
			<h6>PURSE LEFT :20/10000 </h6>
			</div>
			</div>
				
			</div>
			</div> */
		
		
		function getTeamDetails(){
		 	$.ajax({
		 		type:"POST",
		 		contentType : 'application/json; charset=utf-8',
				url:'teamdetails',
				dataType : 'json',
				data:{"data":"data"},
		 		
				success:function(result){
					
					$('#modal-row').html('')
					/* console.log(result.data[0]) */
				
					result.data.forEach(function(item) {
						
						let htmlvar= '<div class="col-4">'+
						'<div class="card mx-2 mx-4 bg-gradient shadow-lg mb-2 p-3 rounded"style="--bs-card-bg: #d97462" > '+
						'<div class="card-body">'+
							'<div class="card-title text-center"><h6 style="font-weight: 1000;font-size:0.9rem">'+item.teamName+'</h6></div>'+
							'<div class="row">'+
							
							'<div class="col-3">'+
							'</div>'+
							'<h6 style="font-size:0.8rem">PLAYERS LEFT :'+item.playersCount+'/20</h6>'+
							'<h6 style="font-size:0.8rem">PURSE LEFT :'+item.purseLeft+'/10000 </h6>'+
							'</div>'+
							'</div>	'+
							'</div>'+
							'</div>'
							
							
							
							
						
						$('#modal-row').append(htmlvar)
						
					    console.log(item.teamName)
					});
					
					
					
				},
				 error: function(xhr, status, error) {
					 console.log(error)
				 	
				 }
			}) 
			
			
			
			
		}
		
	</script>
</body>
</html>