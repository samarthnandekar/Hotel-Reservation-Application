<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>All Booking</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<style>
   .tableheader
  {
  background-color:#00cc99;
	font-size:15px;
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
  .firstDiv{
background-color: #ff9900;
height:5px;
}
.whiteBack
{
background-color:white;
height:80px;
}

.btn-primary {
    color: #fff;
    background-color: #ff9900;
    border-color: #ff9900;
}
</style>
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
            <li><a href="showmyBooking.htm">My bookings</a></li>
            <li><a href="changedPassword.htm">Change Password</a></li>
            <li><a href="homepageafterlogout.htm">Sign out</a></li> 
          </ul>
        </li>
      </ul>
      
      
      
    </div>
    
  </div>
</nav>
</div>
</div>
<!-- End Nav Bar -->
<div class="infoDiv">
</div>

  <div class="container-fluid"> 
  <form action="cancelBooking.htm" method="post" role="form" id="formID" onsubmit="return validateFunction()">
  <table class="table table-bordered">
	
                            <thead>
                                <tr class="tableheader">
                                	<th class="">Select</th>
                                    <th class="col-md-1">Hotel Name</th>
                                    <th class="col-md-1">Checkin Date</th>
                                    <th class="col-md-1">CheckOut Date</th> 
                                    
                                    <th class="col-md-1">Booking Status</th>
                                 
                                    <th class="">Number of People</th>
                                    <th class="col-md-1">Number Of Days</th>
                                    <th class="col-md-1">Paid Cost</th>
                                    <th class="">Room No</th>
                                    <th class="col-md-1">Room Image</th>
                                    <th class="col-md-1">facilites</th>
                                    <th class="col-md-1">Booking Date</th>
                                    <th class="col-md-1">Cancellation date</th>
                                    <th class="col-md-1">Download PDF</th>
                                </tr>
                                    
                             </thead>
                             <tbody>

					<c:forEach var="booking"
						items="${sessionScope.customer.bookingList}">
						<tr>
							<td><input type="checkbox" value="${booking.bookingID}" name="selectedValue"></td>
							<td class="col-md-1">${booking.hotel.hotelName}</td>
							

							<c:forEach var="bookingItem" items="${booking.bookingItemList}">
								<td class="col-md-1">${bookingItem.bStartDate}</td>
								<td class="col-md-1">${bookingItem.bEndDate}</td>
								<td class="col-md-1">${bookingItem.bookingStatus}</td>
								
								<td class="col-md-1">${bookingItem.noOfPeople}</td>
								
								<td class="col-md-1">${bookingItem.numberOfDays}</td>
								
								<td class="col-md-1">${bookingItem.cost}</td>
								<td class="col-md-1">${bookingItem.room.roomNumber}</td>
								
								

								<td class="col-sm-3">
									<div class="">
										<img src="${bookingItem.room.roomimageName}"
											class="img-responsive roomimageSize" alt="Image">
									</div>
								</td>
								<td>
								<c:if test="${bookingItem.room.airConditioner=='yes'}">
										<span class="glyphicon glyphicon-ok"></span> AirConditioner</br>
										</br>
									</c:if> <c:if test="${bookingItem.room.wifiAvailable=='yes'}">
										<span class="glyphicon glyphicon-ok"></span> Free WifiAvailable</br>
										</br>
									</c:if> <c:if test="${bookingItem.room.airPortShuttle=='yes'}">
										<span class="glyphicon glyphicon-ok"></span> Air Port Shuttle</br>
										</br>
									</c:if> <c:if test="${bookingItem.room.breakFase=='yes'}">
										<span class="glyphicon glyphicon-ok"></span> BreakFast</br>
										</br>
									</c:if> <c:if test="${bookingItem.room.lunch=='yes'}">
										<span class="glyphicon glyphicon-ok"></span> Lunch</br>
										</br>
									</c:if> <c:if test="${bookingItem.room.dinner=='yes'}">
										<span class="glyphicon glyphicon-ok"></span> Dinner</br>
										</br>
									</c:if> <c:if test="${bookingItem.room.freeParking=='yes'}">
										<span class="glyphicon glyphicon-ok"></span> FreeParking</br>
										</br>
									</c:if></td>


							</c:forEach>
									<td class="col-md-2">${booking.bookingDate}</td>
									<td class="col-md-1">${bookingItem.cancelDate}</td>
									<td class="col-md-1">
									<form>
									 
       					<a href="downloadPDFFile.htm?bookingID=${booking.bookingID}">Download file version of booking</a>
      			 </form>
									
									
						</tr>

					</c:forEach>

				</tbody>
 
  </table>
   <button class="btn btn-primary btn-md center-block" type="submit"> Cancel Booking</button>
  </form>
  </div>
<script>

function forPDFFile(booking)
{
	alert(booking);
	
	if (xmlHttp == null)
    {
        alert("Your browser does not support AJAX!");
        return;
    }


		var query = "action=/downloadPDFFile.htm&bookingID=" + booking;
		xmlHttp.onreadystatechange = function stateChanged()
		{
   		 if (xmlHttp.readyState == 4)
    		{
       			 //alert(xmlHttp.responseText);
       			 /*
       			 
       			 var json = JSON.parse(xmlHttp.responseText);
      			 // alert(json.isvalidEmailId);
      			  var b=json.isvalidEmailId;
      			 if(b)
      			{
      				document.getElementById("emailerror").innerHTML = "";
      				//alert("inside if condition");
      			}
      			 else
      			{
      				document.getElementById("emailerror").innerHTML = "Email is already registered"; 
      			}
        		*/
    		}
		};
			xmlHttp.open("POST", "downloadPDFFile.htm", true);
			xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xmlHttp.send(query);
			return false;
	
}

//AJAX
var xmlHttp;
xmlHttp = GetXmlHttpObject();

function GetXmlHttpObject()
{
    var xmlHttp = null;
    try
    {
        // Firefox, Opera 8.0+, Safari
        xmlHttp = new XMLHttpRequest();
    } catch (e)
    {
        // Internet Explorer
        try
        {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e)
        {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    return xmlHttp;
}






function validateFunction()
{
	  
if ($("#formID input:checkbox:checked").length > 0)
{
	 document.getElementById("myText").value = "Approved";
   alert($("#formID input:checkbox:checked").length);
   return true;
}
else
{
	  //alert("in else");
	  alert("Please any value select first");
	  return false;
}
}

</script>
</body>
</html>