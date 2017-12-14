<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Individual Hotel Request</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  
    <!-- JQuery Links -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
 
<style>
.tableheader {
	background-color: #00cc99;
	font-size: 20px;
}

.pricetag {
	font-weight: bold;
	font-size: 30px;
}

#myCarousel, .item, .smallimageSize {
	width: 100%;
	height: 450px;
}

.roomimageSize {
	width: 100%;
	height: 25%;
}
.bgclass
{
background-color:#00cc99;
}
.aligncenter
{
text-align: center;
}
</style>
 <script src="http://maps.googleapis.com/maps/api/js"></script>
  
</head>
<body>
<div class="container bgclass">
	<div class="page-header">
    <h1>Hotel Details</h1>      
  </div>
</div>
	<div class="container">
		<div class="page-header">
			<h1 class="aligncenter">${requestScope.hotel.hotelName}</h1>
		</div>

		<!--Start of caro -->
		<div class="row">
			<div class="col-sm-9">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="${requestScope.hotel.imgName}" class="smallimageSize"
								alt="Chania">
						</div>

						<c:forEach var="room" items="${requestScope.hotel.listOfroom}">

							<div class="item">
								<img src="${room.roomimageName}" class="smallimageSize"
									alt="Chania">
							</div>
						</c:forEach>



					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			
			<div class="col-sm-3">
				<div>
					<div id="googleMap" style="width: 260px; height: 450px;"></div>
					<p id="latitude" hidden>${requestScope.latitude}</p>
					<p id="longitude" hidden>${requestScope.longitude}</p>

				</div>
			</div>
		</div>
		<!-- end of caro -->

		<table class="table table-bordered">
			<thead>
				<tr class="tableheader">
					<th>Room Type</th>
					<th>Options</th>
					<th>Avg rate per Night</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="room" items="${requestScope.hotel.listOfroom}">
					<tr>

						<td class="col-sm-4">
							<div class="">
								<img src="${room.roomimageName}"
									class="img-responsive roomimageSize" alt="Image">
							</div>
							
						</td>
						<td><c:if test="${room.airConditioner=='yes'}">
								<span class="glyphicon glyphicon-ok"></span> AirConditioner</br>
								</br>
							</c:if> <c:if test="${room.wifiAvailable=='yes'}">
								<span class="glyphicon glyphicon-ok"></span> Free WifiAvailable</br>
								</br>
							</c:if> <c:if test="${room.airPortShuttle=='yes'}">
								<span class="glyphicon glyphicon-ok"></span> Air Port Shuttle</br>
								</br>
							</c:if> <c:if test="${room.breakFase=='yes'}">
								<span class="glyphicon glyphicon-ok"></span> BreakFast</br>
								</br>
							</c:if> <c:if test="${room.lunch=='yes'}">
								<span class="glyphicon glyphicon-ok"></span> Lunch</br>
								</br>
							</c:if> <c:if test="${room.dinner=='yes'}">
								<span class="glyphicon glyphicon-ok"></span> Dinner</br>
								</br>
							</c:if> <c:if test="${room.freeParking=='yes'}">
								<span class="glyphicon glyphicon-ok"></span> FreeParking</br>
								</br>
							</c:if></td>
							<td>
        	Price<span class="pricetag">${room.price}</span></br>
        <input type="hidden" name="hotelID" value=${hotel.hotelID}>

        </td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<script>
  //alert("sa");
  var strlatitude=document.getElementById("latitude").innerHTML;
  
  var strlongitude=document.getElementById("longitude").innerHTML;
  //alert(strlatitude+"===="+strlongitude);
  
	var myCenter=new google.maps.LatLng(strlatitude,strlongitude);

function initialize()
{
var mapProp = {
  center:myCenter,
  zoom:12,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };

var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker=new google.maps.Marker({
  position:myCenter,
  });

marker.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);
  
  </script>
</body>
</html>