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
	width: 60%;
	height: 15vw;
	object-fit: fill;
}
.padx{
    padding-right: 1rem!important;
    padding-left: 8rem!important;
    }
/* Style the tab */
.tab {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}

/* Style the close button */
.topright {
	float: right;
	cursor: pointer;
	font-size: 28px;
}

.topright:hover {
	color: red;
}

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
</head>
<body>

	<div class="wrapper ">

		<%@include file="side_navbar.jsp"%>

		<div class="container" id="main-container">
			<div class="card shadow  mb-2 bg-white rounded h-8 my-3 mx-3">
				<div class="card-title my-2">
					<div class="row" >
						<div class="col-3 offset-4">
							<h3>${name.toUpperCase()}${year}</h3>
						</div>
						<div class="col-4 offset-1 padx" >
							<button class="btn btn-success rounded-pill btn-md"
								onclick="auctionPage()">Auction Page</button>
						</div>
					</div>
					<hr>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-3" style="border-right: 2px solid green">
							<img class="card-img-top img-fluid img-responsive"
								src="../images/cpl 2021.jfif" alt="Suresh Dasari Card"
								style="height: 140px; width: 250px;">
						</div>
						<div class="col-4">
							<h5>Auction Id
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
								&nbsp;${auction.auctionId}</h5>
							<h5>Teams
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
								&nbsp; 8</h5>
							<h5>Players
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
								&nbsp;${playerCount}</h5>
							<h5>PointsPerTeam : ${auction.pointsPerTeam}</h5>
						</div>
					</div>

				</div>
			</div>
			<div class="card shadow  mb-2 bg-white rounded h-8 my-3 mx-3"
				id="Player Details">
				<div class="tab">
					<button class="tablinks" onclick="openCity(event, 'Teams')"
						id="defaultOpen">Teams</button>
					<button class="tablinks" onclick="openCity(event, 'Players')">Players</button>
					<button class="tablinks" onclick="openCity(event, 'Owners')">Owners</button>
					<button class="tablinks" onclick="openCity(event, 'Categories')">Categories</button>
				</div>

				<div id="Teams" class="tabcontent">
					

					<div class="container" >
						<div class="card-body mb-2 bg-white rounded h-9" id="for-image">
							<div class="row ">
									<%int count=0; %>
								<c:forEach items="${teamsData}" var="teams" varStatus="outerloop">
									<div class=" col-lg-4 my-3 mb-3 d-flex align-items-stretch">
										<div class="card" id="border-success<%=1+count %>" style="width: 340px">
										
										
											<div class="card body text-center d-flex flex-column">
												<h4>${teams.getTeamName()}</h4>
										<hr>		
									
												<div class="container mb-2" >
													<img id="i-<%=1+count%>" class="card-img-top img-fluid px-2"
														src="../images/${teams.getProfilePhoto()}" alt="img"
														style="height: 200px; width: 250px;">
												</div>
												<%++count;%>
												
											</div>
											<div class="card-footer align-items-center d-flex justify-content-center">
												<a class="btn btn-outline-warning text-dark "
													href="<%request.getContextPath();%>/teamdetails?teamId=${teams.teamId}"
													id="addCart"><h6>View Profile</h6> </a>
											</div>
										</div>
									</div>
									<script>
									
								
								
								    function toDataURL(src, callback, outputFormat) {
							            let image = new Image();
							            image.crossOrigin = 'Anonymous';
							            image.onload = function () {
							                let canvas = document.createElement('canvas');
							                let ctx = canvas.getContext('2d');
							                let dataURL;
							                canvas.height = this.naturalHeight;
							                canvas.width = this.naturalWidth;
							                ctx.drawImage(this, 0, 0);
							                dataURL = canvas.toDataURL(outputFormat);
							                callback(dataURL);
							            };
							            image.src = src;
							            if (image.complete || image.complete === undefined) {
							                image.src = "data:image/png;base64, R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";
							                image.src = src;
							            }
							        }
								    
							        toDataURL(document.getElementById('i-<%=count%>').getAttribute('src'),
							            function (dataUrl) {      
							        	document.getElementById('i-<%=count%>').src = dataUrl;
							                var rgb = getAverageRGB(document.getElementById('i-<%=count%>'));
							                
							               if(rgb.r<220 && rgb.g<220 && rgb.b<220){
							                document.getElementById("border-success<%=count%>").style.borderColor = 'rgb(' + rgb.r + ',' + rgb.g + ',' + rgb.b + ')';							            	   
							                document.getElementById("border-success<%=count%>").style.boxShadow= '0 0 20px 0 rgb(' + rgb.r + ',' + rgb.g + ',' + rgb.b + ')';
							               }
							               else{
							                   document.getElementById("border-success<%=count%>").style.borderColor = 'rgb(' + rgb.r + ',' + rgb.g + ',' + rgb.b + ')';							            	   
								                document.getElementById("border-success<%=count%>").style.boxShadow= '0 0 20px 0 rgb(70 70 70)'; 
							               }
							            }
							        )

							        function getAverageRGB(imgEl) {
	
							            var blockSize = 5, // only visit every 5 pixels
							                defaultRGB = { r: 0, g: 0, b: 0 }, // for non-supporting envs
							                canvas = document.createElement('canvas'),
							                context = canvas.getContext && canvas.getContext('2d'),
							                data, width, height,
							                i = -4,
							                length,
							                rgb = { r: 0, g: 0, b: 0 },
							                count = 0;

							            if (!context) {
							                return defaultRGB;
							            }

							            height = canvas.height = imgEl.naturalHeight || imgEl.offsetHeight || imgEl.height;
							            width = canvas.width = imgEl.naturalWidth || imgEl.offsetWidth || imgEl.width;

							            context.drawImage(imgEl, 0, 0);

							            try {
							                data = context.getImageData(0, 0, width, height);
							            } catch (e) {
							        /* security error, img on diff domain */alert('x');
							                return defaultRGB;
							            }

							            length = data.data.length;

							            while ((i += blockSize * 4) < length) {
							                ++count;
							                rgb.r += data.data[i];
							                rgb.g += data.data[i + 1];
							                rgb.b += data.data[i + 2];
							            }

							            // ~~ used to floor values
							            rgb.r = ~~(rgb.r / count);
							            rgb.g = ~~(rgb.g / count);
							            rgb.b = ~~(rgb.b / count);

							            return rgb;

							        }
									</script>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="Players" class="tabcontent">
				<span onclick="this.parentElement.style.display='none'"
					class="topright">&times</span>
				<div class="container">
					<div class="card-body">
						<div class="row">
							<h1>${Player}</h1>
							<c:forEach items="${playersData}" var="Player">
								<div class="col-3 my-2">
									<div class="card">
										<div class="cart body text-center">
											<h4>${Player.getPlayerName()}</h4>
											<%-- <img class="card-img-top img-fluid img-responsive"
												src="../images/${Player.getPlayerPhoto()}"
												style="height: 140px; width: 250px;" alt=""
												onerror=this.src="../images/defaultprofile.png"> --%>
										</div>
										<div class="card-footer text-center">
											<a class="btn btn-outline-warning text-dark"
												href="<%request.getContextPath();%>/auctioninfo?name=cpl&y=2021"
												id="addCart">View Profile </a>
										</div>



									</div>


								</div>
							</c:forEach>
						</div>

					</div>


				</div>

			</div>

			<div id="Owners" class="tabcontent">
				<span onclick="this.parentElement.style.display='none'"
					class="topright">&times</span>

				<div class="container">
					<div class="card-body">
						<div class="row">



							<table class="offset" class="center"
								style="border: 4px solid black">

								<tr>
									<th>Team name</th>
									<th>Owners name</th>

								</tr>
								<c:forEach items="${owners}" var="owner">
									<tr>

										<%-- <td>${playerIterate.playerPhoto }</td> --%>
										<td>${owner.team.teamName}</td>
										<td>${owner.ownerName}</td>


									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>


			<div id="Categories" class="tabcontent">
				<span onclick="this.parentElement.style.display='none'"
					class="topright">&times</span>
				<div class="container">
					<div class="card-body">

						<div class="row">


							<table class="offset" class="center"
								style="border: 4px solid black">

								<tr>
									<th>Category Name</th>
									<th>Grade</th>
									<th>minimumBid</th>
									<th>maximumBid</th>

								</tr>
								<c:forEach items="${categories}" var="Category">
									<tr>

										<%-- <td>${playerIterate.playerPhoto }</td> --%>
										<td>${Category.getCategoryName()}</td>
										<td>${Category.grade}</td>
										<td>${Category.minimumBid}</td>
										<td>${Category.maximumBid}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
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
		function openCity(evt, cityName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		}

		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
		function auctionPage() {
			window.location.href = <%=request.getContextPath()%>"/auction";
		}
		


		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</script>
</body>
</html>