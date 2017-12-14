<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page session="false" %>
<html>
<head>
	
  <title>Home Page</title>
  <meta charset="utf-8">
  <link rel="icon" type="image/png" href="resources/watzmann.png">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap Links -->
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  <!-- JQuery Links -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  
  <meta name="google-signin-scope" content="profile email">
  <meta name="google-signin-client_id" content="1081245987832-k2mct60llncv445ofan8kfuu4b1it4s4.apps.googleusercontent.com">
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  
  <style>
  
  .imgsize
  {
  	width: 100%;
    height: 400px;
    z-index: -1;
    position: absolute;
  }
  
  .smallimageSize
  {
  width:100%;
  height:25%;
  }
  .searchdiv
  {
  margin-top:15px;
  background-color:rgba(0,0,0,0.6);
  width:100%;
  height:48%;
  margin-bottom:15px;	
  }
  
  .whiteFont
  {
  color:white;
  font-weight:bold;
  }
  
  .bcwhite
  {
  background-color:#f2f2f2;
  }
  
  body
  {
   background-color:#f2f2f2;
  }
 #myCarousel, .item
  {
  	width: 100%;
    height: 380px;
    z-index: -1;
    position: absolute;
  }
  .smallimageSize1
  {
  	width:100%;
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
.firstDiv{
background-color: #ff9900;
height:5px;
}

.panel-primary>.panel-heading {
    /* color: #fff; */
  background-color: #00cc99; 
  border-color: #00cc99; 
    }
    .panel-primary {
  border-color: #00cc99;
}
</style>
<script>

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


function getHotelNames() {
    
    if (xmlHttp == null)
    {
        alert("Your browser does not support AJAX!");
        return;
    }
//ssalert("sas");
		var userInputHotel = document.getElementById("searchGoingto").value;
		
		var query = "action=/getHotelNamesAsperSearch.htm&inputHotelName=" + userInputHotel;
		xmlHttp.onreadystatechange = function stateChanged()
		{
   		 if (xmlHttp.readyState == 4)
    		{
   			 //alert("sas");
       			 //alert(xmlHttp.responseText);
       			 var hotelName = document.getElementById("searchResult");
       				//alert(xmlHttp.responseText);
       			 var json = JSON.parse(xmlHttp.responseText);
      			 //alert("last one--->"+json);
      			  hotelName.innerHTML=hotelName;
      		
        		
    		}
		};
			xmlHttp.open("POST","getHotelNamesAsperSearch.htm", true);
			xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xmlHttp.send(query);
			return false;
}



$(document).ready(function(){
	
	
   $(".clasAlignBadge").click(function(){
   	
   	badgevalue= $(".badge").text();
   	if (badgevalue>0)
   		{
   		
   		$(".infoDiv").append("<div class='test'><div class='deleteMeetingClose'>&times;</div></div>")
   		$(".infoDiv").append("<div class='textinBox'>Sign up and get the discount on </div>");
   		$(".infoDiv").append("<div class='textinBox'>first two bookings</div>");
   		
   		$(".badge").text("");
   		$(".badge").css("display", "none");
   		}
   	else
   		{
   		$(".infoDiv").text("")
   		$(".infoDiv").append("<div id='crossSign' class='deleteMeetingClose'>&times;</div>")
   		$(".infoDiv").append("<div class='textinBox'>All caught up!</div>")
   	    $(".infoDiv").append("<div class='textinBox'>No new notifications right now.</div>");
   		}
   	$(".infoDiv").toggle();
   	
   });
   
   $("#crossSign").click(function(){
   	alert("Sa")
   	$(".clasAlignBadge").css("display", "none");
   });
   
	$(".test").click(function(){
		alert("Sa1");
	});
	
	$(function() {
	    $("#checkinDate").datepicker();
	});

	$(function() {
	    $("#checkOutDate").datepicker();
	});
	
	var accentMap = {
		      "á": "a",
		      "ö": "o"
		    };
		    var normalize = function( term ) {
		      var ret = "";
		      for ( var i = 0; i < term.length; i++ ) {
		    	 var temp =accentMap[ term.charAt(i) ] || term.charAt(i);
		    	 debugger;
		        ret += temp;
		      }
		      var check=$("h1").append(ret);
		      return '<div>'+ret+'</div></br>';
		    };
		    
	$( function() {
	    var names = [
"Alabama",
"Alaska",
"Arizona",
"Arkansas",
"California", 
"Colorado",
"Connecticut", 
"Delaware",
"Florida",
"Georgia",
"Hawaii",
"Idaho",
"Illinois Indiana", 
"Iowa",
"Kansas", 
"Kentucky",
"Louisiana",
"Maine",
"Maryland", 
"Massachusetts", 
"Michigan",
"Minnesota",
"Mississippi", 
"Missouri",
"Montana Nebraska", 
"Nevada",
"New Hampshire", 
"New Jersey",
"New Mexico",
"New York",
"North Carolina", 
"North Dakota",
"Ohio",
"Oklahoma", 
"Oregon",
"Pennsylvania Rhode Island", 
"South Carolina",
"South Dakota",
"Tennessee",
"Texas",
"Utah",
"Vermont", 
"Virginia",
"Washington",
"West Virginia", 
"Wisconsin",
"Wyoming"
	    ];
	    $( "#searchGoingto" ).autocomplete({
	    	
	    	source: function( request, response ) {
	            
	    		var results = $.ui.autocomplete.filter(names, request.term);

	            response(results.slice(0, 10));
	          }  	
	    	
	      });
	    } );
});

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
      <c:if test="${empty requestScope.userName}">
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
      </c:if>
      <c:if test="${not empty requestScope.userName}">
      <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
          <a class="dropdown-toggle glyphicon glyphicon-user" data-toggle="dropdown" href="#">Account
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="showmyBooking.htm">My bookings</a></li>
            <li><a href="changedPassword.htm">Change Password</a></li>
            <li><a href="homepageafterlogout.htm" onclick="signOut()">Sign out</a></li> 
          </ul>
        </li>
      </ul>
      </c:if>
      
      
    </div>
    
  </div>
</nav>
</div>
<!-- End Nav Bar -->
<div class="infoDiv">
</div>
</div>

<div class=".container-fluid">    
  
    <!-- Start of carol -->
    
    <div class="col-lg-12 smallimageSize2">
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
        <img src="resources/glacier.jpg" class="smallimageSize1" alt="Chania">
      </div>

      <div class="item">
        <img src="resources/panoramicView1.jpg" class="smallimageSize1" alt="Chania">
      </div>
    
      <div class="item">
        <img src="resources/beach.jpg" class="smallimageSize1" alt="Flower" >
      </div>

      <div class="item">
        <img src="resources/sydney.jpg" alt="Flower"  class="smallimageSize1">
      </div>
    </div>
  </div>
  </div>
    
    
    
    <!--  End of Carol -->

    	<div class="container">
    		<div class="searchdiv">
    			
    			<form action="userSeach.htm" method="get" role="form">
    			</br></br>
    			<div class="col-sm-3">
    			<label class="whiteFont">Going to</label>
    			</div>
    			
    			<div class="col-sm-6">
    			<div class = "ui-widget">
    			<input type="text" name="searchGoingto" id="searchGoingto" class="form-control" placeholder="Going to,Destination, hotel name" onkeyup=""/>
    			</div>
    			</div></br>
    			<br></br>
    			<div id="searchResult"></div>
    			
    			<div class="">
    			<div class="col-sm-4 whiteFont">Days</div>
    			<div class="col-sm-3 whiteFont">Check in</div>
    			<div class="col-sm-3 whiteFont">Check Out</div>
    			</div>
    			</br></br>
    			<div class="">
    			<div class="col-sm-3"></div>
    			<div class="col-sm-3"><input type="text" id="checkinDate" name="checkinDate" class="form-control" placeholder="Check in date" /></div>
    			<div class="col-sm-3"><input type="text" id="checkOutDate" name="checkOutDate" class="form-control" placeholder="Check out date" /></div>
    			</div>
    			</br></br></br>
    			</br></br></br>
    			<div>
    			<div class="col-sm-4"></div>
    			<button type="submit" class="btn btn-warning">Search</button>
    			</div>
    			
    			
    				</form>
    				</div>
    		</div>
    	</div>
<br><br>



 <div class="container">    
  <div class="row">
  <c:forEach var="hotel" items="${requestScope.fhotelList}">
  
  <a href="individualHotelDetails.htm?hotelID=${hotel.hotelID}&checkinDate=${requestScope.checkInDate}&checkoutDate=${requestScope.checkoutDate}" target="_blank">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">${hotel.hotelName}
        <span class="rating">
			<c:forEach begin="1" end="${hotel.hotellevel}">
			<span class="glyphicon glyphicon-star-empty"></span>
			</c:forEach>
		</span>
		</div>
        <div class=""><img src="${hotel.imgName}" class="img-responsive smallimageSize"  alt="Image"></div>
        <div class="panel-footer">$81.99</div>
      </div>
    </div>
    </a>
    </c:forEach>
  </div>
  
  
  <div class="row">
  <c:forEach var="hotel" items="${requestScope.shotelList}">
  <a href="individualHotelDetails.htm?hotelID=${hotel.hotelID}&checkinDate=${requestScope.checkInDate}&checkoutDate=${requestScope.checkoutDate}" target="_blank">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">${hotel.hotelName}
        <span class="rating">
			<c:forEach begin="1" end="${hotel.hotellevel}">
			<span class="glyphicon glyphicon-star-empty"></span>
			</c:forEach>
		</span>
		</div>
        <div class=""><img src="${hotel.imgName}" class="img-responsive smallimageSize"  alt="Image"></div>
        <div class="panel-footer">$81.99</div>
      </div>
    </div>
    </a>
    </c:forEach>
  </div>
</div>
</br>
</br>


<div class="firstDiv"></div>

<script>
  function signOut() {
	  debugger;
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
</script>

</body>
</html>
