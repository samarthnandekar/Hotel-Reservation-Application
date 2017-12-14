
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Add Hotel Information</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<style>
.imgsize {
	width: 100%;
	height: 400px;
}

.smallimageSize {
	width: 100%;
	height: 25%;
}

@import "font-awesome.min.css";

@import "font-awesome-ie7.min.css";
/* Space out content a bit */


/* Everything but the jumbotron gets side spacing for mobile first views */
.header, .marketing, .footer {
	padding-right: 15px;
	padding-left: 15px;
}

/* Custom page header */
.header {
	border-bottom: 1px solid #e5e5e5;
}
/* Make the masthead heading the same height as the navigation */
.header h3 {
	padding-bottom: 19px;
	margin-top: 0;
	margin-bottom: 0;
	line-height: 40px;
}

/* Custom page footer */
.footer {
	padding-top: 19px;
	color: #777;
	border-top: 1px solid #e5e5e5;
}




/* Main marketing message and sign up button */
.jumbotron {
	text-align: center;
	border-bottom: 1px solid #e5e5e5;
}

.jumbotron .btn {
	padding: 14px 24px;
	font-size: 21px;
}

/* Supporting marketing content */
.marketing {
	margin: 40px 0;
}

.marketing p+h4 {
	margin-top: 28px;
}

/* Responsive: Portrait tablets and up */
@media screen and (min-width: 768px) {
	/* Remove the padding we set earlier */
	.header, .marketing, .footer {
		padding-right: 0;
		padding-left: 0;
	}
	/* Space out the masthead */
	.header {
		margin-bottom: 30px;
	}
	/* Remove the bottom border on the jumbotron for visual effect */
	.jumbotron {
		border-bottom: 0;
	}
}
</style>

<script>

function myFunction()
{
	//alert("sas");
	document.getElementById("useraction").value = "formCompleted";
	
	}
	
	function validateForm()
	{
		
		//alert("from validate form");
	}
</script>
</head>
<body>

	<!-- Start Nav Bar -->
	<div class="container">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span>

					</button>
					<a class="navbar-brand" href=""></a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						
					</ul>
					<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class=""></span> ${sessionScope.userName}</a></li>
						<li class="dropdown"><a
							class="dropdown-toggle glyphicon glyphicon-user"
							data-toggle="dropdown" href="#">Account <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="viewPlacedRequest.htm">View Requests</a></li>
								<li><a href="newRequestPlace.htm">Place New Request</a></li>
							</ul></li>
						<li><a href="changedPasswordHotelOwner.htm"><span class=""></span> Changed Password</a></li>
						<li><a href="homepageafterlogout.htm"><span class=""></span>Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<!-- End Nav Bar -->
	<div class=".container-fluid">
		<div class="imgsize">
			<img src="resources/watzmann.png" class="img-responsive imgsize"
				alt="Image">
		</div>
	</div>

	<div class="container">
		<h1 class="well">Registration Form</h1>
		<c:choose>
			<c:when test="${requestScope.firstpage=='firstformPage'}">

				<div class="col-lg-12 well">
					<div class="row">
						<form:form action="hotelRegisterFormMain.htm" method="post" role="form" commandName="hotel" enctype="multipart/form-data">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-12 form-group">
										<label>Hotel Name</label> <input type="text" name="hotelName"
											class="form-control input-lg" placeholder="Enter Hotel Name" />
									</div>

								</div>

								<div class="row">
									<div class="col-sm-12 form-group">
										<label>Primary Contact Name</label> <input type="text"
											name="primaryContactName" class="form-control input-lg"
											placeholder="Enter Primary Contact Name" />
									</div>
								</div>

								<div class="row">
									<div class="col-sm-12 form-group">
										<label>Primary Contact Number</label> <input type="text"
											name="primaryContactNumber" class="form-control input-lg"
											placeholder="Enter Primary Contact Number" />
									</div>
								</div>

								<div class="row">
									<div class="col-sm-12 form-group">
										<label>Hotel Details</label>
										<textarea type="text" name="hotelInformation"
											class="form-control input-lg"
											placeholder="Enter Hotel Details"></textarea>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-4 form-group">
										<label>Number of Rooms</label> <input type="number"
											name="numbersOFRooms" class="form-control input-lg"
											placeholder="Number of Rooms" maxlength="2" min="1" max="99"/>
									</div>
																
									<div class="col-sm-4 form-group">
									  	<label for="sel1">Hotel level:</label>
									  <select class="form-control" id="sel1" name="hotellevel">
									    <option value=1>One Star</option>
									    <option value=2>Two Star</option>
									    <option value=3>Three Star</option>
									    <option value=4>Four Star</option>
									    <option value=5>Five Star</option>
									    <option value=0>No Star</option>
									  </select>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-12 form-group">
										<label>Upload image</label> <input type="file" name="photo" path="photo"></input>
									</div>
								</div>


								<div class="row">
									<div class="col-sm-8 form-group">
										<label>Street Address</label> <input type="text"
											name="streetAddress" class="form-control input-lg"
											placeholder="Street Address" />
									</div>
									<div class="col-sm-4 form-group">
										<label>zip Code</label> <input type="number"
											name="pincode" class="form-control input-lg"
											placeholder="Zip Code" maxlength="10" min="1" max="999999999"/>
									</div>
									</div>

								<div class="row">
								
								
									<div class="col-sm-4 form-group">
										<label>City</label> <input type="text"
											name="city" class="form-control input-lg"
											placeholder="City" />
									</div>
									<div class="col-sm-4 form-group">
										<label>State</label> <input type="text"
											name="state" class="form-control input-lg"
											placeholder="State" />
									</div>
									<div class="col-sm-4 form-group">
										<label>Country</label> <input type="text"
											name="country" class="form-control input-lg"
											placeholder="Country" />
									</div>
								</div>


								<button type="submit" class="btn btn-lg btn-info">Submit</button>
							</div>
						</form:form>
					</div>
				</div>

			</c:when>


			<c:when test="${requestScope.firstpage=='secondpage'}">
				<div class="container">
					<div class="row">
						<form:form action="hotelRegisterroom.htm" method="post" role="form" commandName="room" onsubmit="return validateForm()" enctype="multipart/form-data">

							<div class="row">
								<div class="col-sm-6 form-group">
									<label>Room Number</label> <input type="text" name="roomNumber"
										class="form-control" placeholder="Room Number" />
								</div>

								<div class="col-sm-6 form-group">
									<label>People Capacity</label> <input type="text"
										name="peopleCapacity" class="form-control"
										placeholder="people Capacity" />
								</div>
							</div>

							<div class="row">
								<div class="col-sm-6 form-group">
									<label>Room Price</label> <input type="text" name="price"
										class="form-control" placeholder="Room Price" />
								</div>
							</div>

							<label>Select Facilities available for Room</label></br>
							<div class="row">
								<div class="col-sm-12 form-group">
								
									<label class="col-sm-4 checkbox-inline">
									 <input type="checkbox" name="roomfacilities" value="airConditioner">airConditioner</label>
									 
									<label class="col-sm-4 checkbox-inline">
									<input type="checkbox" name="roomfacilities" value="wifiAvailable">wifiAvailable</label>
									
									<label class="col-sm-3 checkbox-inline"> 
									<input type="checkbox" name="roomfacilities" value="airPortShuttle">airPortShuttle</label>
									
									
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-12 form-group">
								
									<label class="col-sm-4 checkbox-inline">
									 <input type="checkbox" name="roomfacilities" value="breakFase">breakFase</label>
									 
									<label class="col-sm-4 checkbox-inline">
									<input type="checkbox" name="roomfacilities" value="lunch">lunch</label>
									
									<label class="col-sm-3 checkbox-inline"> 
									<input type="checkbox" name="roomfacilities" value="dinner">dinner</label>
																	
								</div>
							</div>
				
							<div class="row">
								<div class="col-sm-12 form-group">
								
									<label class="col-sm-4 checkbox-inline">
									 <input type="checkbox" name="roomfacilities" value="freeParking">freeParking</label>
								<!-- 	 
									<label class="col-sm-4 checkbox-inline">
									<input type="checkbox" name="lunch" value="yes">lunch</label>
									
									<label class="col-sm-3 checkbox-inline"> 
									<input type="checkbox" name="dinner" value="yes">dinner</label>
								 -->							
								</div>
							</div>
							
							<div class="row">
									<div class="col-sm-12 form-group">
										<label>Upload image</label> <input type="file" name="roomimage" path="roomimage"></input>
									</div>
							</div>
								
							<input type="hidden" id="useraction" name="useraction" value="">
							
							<input type="hidden" id="imagePath" name="imagePath" value="${requestScope.imagePath}">
							
							
							<div class="row">
    							<div class="col-md-6"><button type="submit" class="btn btn-lg btn-info">Click Here to Add more Rooms</button></div>
    							<div class="col-md-6"><button type="submit" onclick="myFunction()" class="btn btn-lg btn-info">Click here to Submit the changes</button></div>
  							</div>
							
				</form:form>
					</div>
				</div>

			</c:when>

			<c:when test="${requestScope.firstpage=='LastPage'}">
			<h4>Entered Information</h4>
			
			<div class="container">
					<div class="row">
						<form:form action="savehotelindb.htm" method="POST" role="form" >
						
						<div class="row">
						<div class="col-md-3"><label>Hotel Name : </label></div>
						<div class="col-md-9"><label>${requestScope.hotel.hotelName}</label></div>
						</div>
						
						<div class="row">
						<div class="col-md-3"><label>Primary Contact Name : </label></div>
						<div class="col-md-9"><label>${requestScope.hotel.primaryContactName}</label></div>
						</div>
						
						<div class="row">
						<div class="col-md-3"><label>Primary Contact Number : </label></div>
						<div class="col-md-9"><label>${requestScope.hotel.primaryContactNumber}</label></div>
						</div>
						
						<div class="row">
						<div class="col-md-3"><label>Hotel Information : </label></div>
						<div class="col-md-9"><label>${requestScope.hotel.hotelInformation}</label></div>
						</div>
						         
                        <table class="table table-bordered">

                            <thead>

                                <tr>
                                    <th class="col-md-3">RoomNumber</th>
                                    <th class="col-md-3">peopleCapacity</th>
                                    <th class="col-md-3">price</th>
                                    
                                    <th class="col-md-3">airConditioner</th>
                                    <th class="col-md-3">wifiAvailable</th>
                                    <th class="col-md-3">airPortShuttle</th>
                                    
                                    <th class="col-md-3">breakFast</th>
                                    <th class="col-md-3">lunch</th>
                                    <th class="col-md-3">dinner</th>
                                    
                                    <th class="col-md-3">freeParking</th>
                                    </tr>
                                    
                             </thead>
                             <tbody>
                             <c:forEach var="first" items="${requestScope.hotel.listOfroom}">
                            		 <tr>
                                        <td>${first.roomNumber}</td>
                                        <td>${first.peopleCapacity}</td>
                                        <td>${first.price}</td>
                                          
                                        <td>${first.airConditioner}</td>
                                        <td>${first.wifiAvailable}</td>
                                        <td>${first.airPortShuttle}</td>
                                             
                                        <td>${first.breakFase}</td>
                                        <td>${first.lunch}</td>
                                        <td>${first.dinner}</td>
                                        <td>${first.freeParking}</td>
                                           
                                        
                                      </tr>
                               </c:forEach>
                             </tbody>
                        </table>
                        <div class="col-md-6"><button type="submit" class="btn btn-lg btn-info">Submit Request</button></div>
						</form:form>
					</div>
				</div>
			</c:when>


			<c:otherwise>
			
			
			</c:otherwise>
		</c:choose>
	</div>



</body>
</html>