<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/png" href="resources/watzmann.png">
<title>Hotel Booking</title>
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
  .tableheader
  {
  background-color:#00cc99;
	font-size:20px;
  }
  .pricetag
  {
  font-weight: bold;
  font-size:30px;
  }
#myCarousel, .item, .smallimageSize
  {
  width:100%;
  height:450px;
  }
  
   .roomimageSize
  {
  width:100%;
  height:25%;
  }
  
  .whiteBack
{
background-color:white;
height:80px;
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
  body
  {
  background-color:#f2f2f2;
  }
  .firstDiv{
background-color: #ff9900;
height:5px;
}
.hcolor
{
color:#ff9900;
}
.glyphicon
{
color:#ff9900;

}
th,td{
border: 2px solid #00cc99 !important;
}

.optionsSize{
font-size:10%;
}
  </style>
  
  
  <script src="http://maps.googleapis.com/maps/api/js"></script>
  
  <script>
 

function validateForm()
{
	//alert("sasa");
	var checkinDate=document.getElementById("checkinDate");
	var checkoutDate=document.getElementById("checkOutDate");
	
	if(checkinDate.value=="" && checkoutDate.value=="")
		{
		alert("please select checkin Date and check out date");
		return false;
		}
	else if(checkinDate.value=="")
		{
		
		alert("please select checkin Date");
		return false;
		}
	else if(checkoutDate.value=="" )
	{
		alert("please select checkOut Date");
		return false;
	}
	
	
	var today= new Date();
	
	var mchecking=Date.parse(checkinDate.value);
	var userselectedCheckinDate= new Date(mchecking);
	
	
	var mcheckout=Date.parse(checkoutDate.value);
	var userselectedCheckOutDate= new Date(mcheckout);
	
	//alert("userselectedCheckinDate--->"+userselectedCheckinDate);
	//alert("userselectedCheckOutDate-->"+userselectedCheckOutDate);
	
	if(userselectedCheckinDate<today)
	{
		alert("please select the future date");
		return false;
	}
	else if (userselectedCheckinDate.getTime()==userselectedCheckOutDate.getTime())
		{
		alert("checkin date and checkin out date can not be same");
		return false;
		}
	else
	{
		return true;
	}
	
}

$(function() {
    $("#checkinDate").datepicker();
});

$(function() {
    $("#checkOutDate").datepicker();
});

</script>

</head>
<body>
<!-- Start Nav Bar -->
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
</div>
<!-- End Nav Bar -->
<div class="infoDiv">
</div>
</div>

<div class="container">   
<div class="page-header">
    <h1 class="hcolor">${requestScope.hotel.hotelName}</h1>      
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
      <li data-target="#myCarousel" data-slide-to="4"></li>
      <li data-target="#myCarousel" data-slide-to="5"></li>
      <li data-target="#myCarousel" data-slide-to="6"></li>
      <li data-target="#myCarousel" data-slide-to="7"></li>
      <li data-target="#myCarousel" data-slide-to="8"></li>
      <li data-target="#myCarousel" data-slide-to="9"></li>
      <li data-target="#myCarousel" data-slide-to="10"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
    
      <div class="item active">
        <img src="${requestScope.hotel.imgName}" class="smallimageSize" alt="Chania">
      </div>
      
		<c:forEach var="himages" items="${requestScope.hotel.hotelImages}">
		
		<div class="item">
        <img src="${himages.hotelImages}" class="smallimageSize" alt="Chania">
      </div>
		</c:forEach>

    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  </div>
  
  <div class="col-sm-3">
  <h1 class="hcolor">Wonderfull !!!</h1>
  Rating :
  </br>
  <div>
  <div id="googleMap" style="width:260px;height:360px;"></div>
  <p id="latitude" hidden>${requestScope.latitude}</p>
  <p id="longitude" hidden>${requestScope.longitude}</p>
  
  </div>
  </div>		
		</div>
  <!-- end of caro  -->
  </br></br>
  
  <!-- Start booking Table -->
  
  <table class="table table-bordered" class="bigTable">
    <thead>
    <tr class="tableheader">
    <td colspan="3">Choose your Room</td>
    </tr>
    
    <form action="searchRoominsideOneHotel.htm" role="form" onsubmit="return validateForm()">
    <tr >
    <td colspan="3">
    
    <div class="form-group col-sm-2">
  		<label for="usr">Check in:</label>
  		<input type="text" class="form-control" id="checkinDate" name="checkin" value=${requestScope.checkinDate}>
	</div>

	<div class="form-group col-sm-2">
  		<label for="usr">Check Out:</label>
  		<input type="text" class="form-control" id="checkOutDate" name="checkout" value=${requestScope.checkoutDate}>
	</div>
	
	<div class="form-group col-sm-1">
      <label for="">Rooms:</label>
     
      <select class="form-control" id="Norooms" name="Norooms">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
      </select> 
      
    </div>
 
 <div class="form-group col-sm-1">
      <label for="sel1">Adults:</label> 
      <select class="form-control" id="noOFAdults" name="noOFAdults">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
      </select> 
      
    </div>
    
    	<div class="form-group col-sm-1">
    	</br>
    	   <input type="hidden" name="hotelIDforSearch" value=${hotel.hotelID}>
      	   <input type="hidden" name="roomNumberseach" value=${room.roomNumber}>
           <input type="hidden" name="roomPricesearch" value=${room.price}>
        
    		<button type="submit" class="btn btn-warning">Search</button>
    		</form>
   		 </div>
    </td>
    </tr>
    
      <tr>
        <th>Room Type</th>
        <th>Options </th>
        <th>Avg rate per Night</th>
      </tr>
    </thead>
    <tbody>
    
  
    <c:forEach var="room" items="${requestScope.hotel.listOfroom}">
      <tr>
      <form action="hotelRoomBooking.htm" method="POST" role="form" onsubmit="return validateFormforRoom()">
  <td class="col-sm-4"> 
    		<div class=""><img src="${room.roomimageName}" class="img-responsive roomimageSize"  alt="Image"></div>
    		
        </td>
        <td>
        
        <c:if test="${room.airConditioner=='yes'}">
  			<span class="glyphicon glyphicon-ok"></span> AirConditioner</br>
  		</c:if>
  			
  		<c:if test="${room.wifiAvailable=='yes'}">
  			<span class="glyphicon glyphicon-ok"></span> Free WifiAvailable</br>
  		</c:if>
  		
  		<c:if test="${room.airPortShuttle=='yes'}">
  			<span class="glyphicon glyphicon-ok"></span> Air Port Shuttle</br>
  		</c:if>
  		
  		<c:if test="${room.breakFase=='yes'}">
  			<span class="glyphicon glyphicon-ok"></span> BreakFast</br>
  		</c:if>
  		
  		<c:if test="${room.lunch=='yes'}">
  			<span class="glyphicon glyphicon-ok"></span> Lunch</br>
  		</c:if>
  		
  		<c:if test="${room.dinner=='yes'}">
  			<span class="glyphicon glyphicon-ok"></span> Dinner</br>
  		</c:if>	
  		
  		<c:if test="${room.freeParking=='yes'}">
  			<span class="glyphicon glyphicon-ok"></span> FreeParking</br>
  		</c:if>	
  		
                
        </td>
        <td>
        	Only<span class="pricetag">${room.price}</span></br>
        	<input type="hidden" name="checkin" value="${requestScope.checkinDate}">
        	<input type="hidden" name="checkout" value="${requestScope.checkoutDate}">
        	<input type="hidden" name="Norooms" value="${requestScope.checkoutDate}">
        	<input type="hidden" name="noOFAdults" value="${requestScope.checkoutDate}">
        	
        <input type="hidden" name="hotelID" value=${hotel.hotelID}>
        <input type="hidden" name="roomNumber" value=${room.roomNumber}>
        <input type="hidden" name="roomPrice" value=${room.price}>
        <button type="submit" class="btn btn-warning">Book</button>
        <p>It takes only 2 minutes</p>
        </td>
        
        </form>
       
      </tr>
     
       </c:forEach>
       <c:if test="${requestScope.isRoomavailable=='No'}">
  			<H1>Sorry, No Room Available</H1>
  		</c:if>
       
    </tbody>
  </table>
  
  
  
  </div>
  <div class="firstDiv"> </div>
  <script>
  //alert("sa");
  
  function validateFormforRoom()
  {
	  if(validateForm())
		  {
		  //alert("inside if condition");
		  var selectedCheckinDate= document.getElementById("checkinDate").value;
		  var selectedCheckOutDate= document.getElementById("checkOutDate").value;
		  var selectedNorooms= document.getElementById("Norooms").value;
		  var selectednoOFAdults= document.getElementById("noOFAdults").value;
		 // alert(selectedCheckinDate);
			
			var checkindate=document.getElementsByName("checkin");
			var i;
			for (i = 0; i < checkindate.length; i++) {
				checkindate[i].value=selectedCheckinDate;
			}
			
			var checkoutdate=document.getElementsByName("checkout");
			var j;
			for (j = 0; j < checkoutdate.length; j++) {
				checkoutdate[j].value=selectedCheckOutDate;
			}
			
			var Norooms=document.getElementsByName("Norooms");
			var j;
			for (j = 0; j <Norooms.length; j++) {
				Norooms[j].value=selectedNorooms;
			}
			
			var noOFAdults=document.getElementsByName("noOFAdults");
			var j;
			for (j = 0; j <noOFAdults.length; j++) {
				noOFAdults[j].value=selectednoOFAdults;
			}
		
			  
			 // alert("sa");
			  return true;
		  }
	  else
		  return false;
	
	  
  }
  var strlatitude=document.getElementById("latitude").innerHTML;
  
  var strlongitude=document.getElementById("longitude").innerHTML;
  //alert(strlatitude+"===="+strlongitude);
  
	var myCenter=new google.maps.LatLng(strlatitude,strlongitude);

  
function myMap() {
	  var myCenter = new google.maps.LatLng(strlatitude,strlongitude);
	  var mapCanvas = document.getElementById("googleMap");
	  var mapOptions = {center: myCenter, zoom: 12};
	  var map = new google.maps.Map(mapCanvas, mapOptions);
	  var marker = new google.maps.Marker({position:myCenter});
	  marker.setMap(map);
	}
  
  </script>
  
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAZ97yJf6GGrxBbkrMVS7dod0n-aN5ytIg&callback=myMap"></script>
  
</body>
</html>