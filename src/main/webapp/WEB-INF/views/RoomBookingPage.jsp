<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Room Booking</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<style>
 .imgsize
  {
  	width: 100%;
    height: 400px;
    
  }
  .whiteBack
{
background-color:white;
height:80px;
}
.firstDiv{
background-color: #ff9900;
height:5px;
}
.container-fluid
{
margin-top:0px;
padding-top:0px
}
.icom
{
height:64px;
width:150px;
}

.navbar-default
{
margin-bottom:0px;
color:#ff9900
}

  .navbar-default {
    background-color: #ff9900;
    background-image: none;
}

.badge
{
background-color:red;
margin-bottom:0px;
}
.clasAlignBadge
{
margin-top:20px;
margin-rigth:20px;
padding-right:20px
}

</style>
<script>
function showmessage()
{
	alert("Booking confirmed,please check your mail, Thanks");
	return true;
	}
</script>
</head>
<body>

<div class="firstDiv"> </div>

<!-- Start Nav Bar -->
<div class="whiteBack">
<div class="container">   
<nav class="">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand">
      <img src="resources/icon.jpg" class="icom" alt="Image">
      </a>
    </div>
    
    <div class="collapse navbar-collapse" id="myNavbar">
      
       <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
          <a class="dropdown-toggle glyphicon" data-toggle="dropdown" href="#">Support
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="customerSupport.htm">Customer Support</a></li>
            <li><a href="feedback.htm">Feedback</a></li> 
          </ul>
        </li>
      </ul>  
      
      <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
          <a class="dropdown-toggle glyphicon glyphicon-user" data-toggle="dropdown" href="#">Account
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="login.htm">Sign In</a></li>
            <li><a href="signup.htm">Create an Account</a></li> 
          </ul>
        </li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
      <a style="text-decoration:none">
      	<div class="clasAlignBadge">
      		<div class="badge">1</div>
      		<span class="glyphicon glyphicon-bell"></span> 
      		
      		
      	</div>
      </a>
      </div>
      </ul>
      
    </div>
    
  </div>
</nav>
</div>
<!-- End Nav Bar -->
<div class="infoDiv">
</div>
</div>

	
<!-- End Nav Bar -->
		<div class=".container-fluid">
		<div class="imgsize">
			<img src="resources/watzmann.png" class="img-responsive imgsize"
				alt="Image">
		</div>
	</div>
	<c:choose>
	<c:when test="${requestScope.bookingConfirmed=='No'}">
	
	<div class="container">
		<h1 class="well">Booking Details</h1>
				<div class="col-lg-12 well">
					<div class="row">
						<form action="confirmBooking.htm" method="POST" role="form" onsubmit="return showmessage()">
							<div class="col-sm-12">
							
						<div class="row">
						<div class="col-md-3"><label>Hotel Name : </label></div>
						<div class="col-md-9"><label>${requestScope.hotelName}</label></div>
						<input type="hidden" name="hotelName" value=${requestScope.hotelName}>
						</div>
						
						<div class="row">
						<div class="col-md-3"><label>Check in Date: </label></div>
						<div class="col-md-9"><label>${requestScope.showcheckinDate}</label></div>
						<input type="hidden" name="checkinDate" value=${requestScope.datecheckinDate}>
						</div>
						
						<div class="row">
						<div class="col-md-3"><label>Check out Date : </label></div>
						<div class="col-md-9"><label>${requestScope.showcheckOutDate}</label></div>
						<input type="hidden" name="checkOutDate" value=${requestScope.datecheckOutDate}>
						</div>

						<div class="row">
						<div class="col-md-3"><label>Number of Guest : </label></div>
						<div class="col-md-9"><label>${requestScope.numberOFPeople}</label></div>
						<input type="hidden" name="numberOFPeople" value=${requestScope.numberOFPeople}>
						</div>
						
						
						<div class="row">
						<div class="col-md-3"><label>Number of Rooms: </label></div>
						<div class="col-md-9"><label>${requestScope.Numberofrooms}</label></div>
						<input type="hidden" name="Numberofrooms" value=${requestScope.Numberofrooms}>
						</div>
						
						<div class="row">
						<div class="col-md-3"><label>Number Of Days : </label></div>
						<div class="col-md-9"><label>${requestScope.numberOfDays}</label></div>
						<input type="hidden" name="numberOfDays" value=${requestScope.numberOfDays}>
						</div>
						
						<div class="row">
						<div class="col-md-3"><label>Total Price : </label></div>
						<div class="col-md-9"><label>${requestScope.totalPrice}</label></div>
						<input type="hidden" name="totalPrice" value=${requestScope.totalPrice}>
						<input type="hidden" name="hotelId" value=${requestScope.hotelId}>
						<input type="hidden" name="roomNumber" value=${requestScope.roomNumber}>
												
						
						</div>
								<button class="btn btn-lg btn-info" type="submit">Confirm Booking</button>
							</div>
						</form>
					</div>
				</div>

			</div>
	</c:when>
	
	<c:when test="${requestScope.bookingConfirmed=='yes'}">
	
	<div class="container">
		<h1 class="well">Congratulations your Booking Confirmed</h1>
				<div class="col-lg-12 well">
					<div class="row">
						
							<div class="col-sm-12">
							
						<div class="row">
						<div class="col-md-3"><label>Hotel Name : </label></div>
						<div class="col-md-9"><label>${requestScope.booking.hotel.hotelName}</label></div>
						
						</div>
						
						<div class="row">
						<div class="col-md-3"><label>Check in Date: </label></div>
						<div class="col-md-9"><label>${requestScope.booking.bookingDate}</label></div>
						
						</div>
						
						<div class="row">
						<div class="col-md-3"><label>Check out Date : </label></div>
						<div class="col-md-9"><label>${requestScope.booking.bookingDate}</label></div>
						
						</div>

						<div class="row">
						<div class="col-md-3"><label>Number of Guest : </label></div>
						<div class="col-md-9"><label>${requestScope.booking.bookingDate}</label></div>
						
						</div>
						
						
						<div class="row">
						<div class="col-md-3"><label>Number of Rooms: </label></div>
						<div class="col-md-9"><label>${requestScope.Numberofrooms}</label></div>
						
						</div>
						
						<div class="row">
						<div class="col-md-3"><label>Number Of Days : </label></div>
						<div class="col-md-9"><label>${requestScope.booking.bookingDate}</label></div>
						
						</div>
						
						<div class="row">
						<div class="col-md-3"><label>Total Price : </label></div>
						<div class="col-md-9"><label>${requestScope.booking.bookingDate}</label></div>
						
						</div>

								
							</div>
						
					</div>
				</div>

			</div>
	</c:when>
	
	<c:otherwise>
			
			
	</c:otherwise>
	</c:choose>
</body>
</html>