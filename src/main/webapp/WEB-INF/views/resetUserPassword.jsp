<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page session="false" %>
<html>
<head>
	
  <title>Password Reset</title>
  <link rel="icon" type="image/png" href="resources/watzmann.png">
  <meta charset="utf-8">
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
  
  <style>
  
  .imgsize
  {
  	width: 100%;
    height: 400px;
    
  }
  .firstDiv{
background-color: #ff9900;
height:5px;
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
  height:38%;
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
   
  }
  .smallimageSize1
  {
  	width:100%;
  }
 
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
.whiteBack
{
background-color:white;
height:80px;
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


$(function() {
    $("#checkinDate").datepicker();
});

$(function() {
    $("#checkOutDate").datepicker();
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
        <img src="resources/hotel7.jpg" class="smallimageSize1" alt="Chania">
      </div>

      <div class="item">
        <img src="resources/Boston_Harbor_Hotel.png" class="smallimageSize1" alt="Chania">
      </div>
    
      <div class="item">
        <img src="resources/Sheraton_Needham_Hotel.png" class="smallimageSize1" alt="Flower" >
      </div>

      <div class="item">
        <img src="resources/watzmann.png" alt="Flower"  class="smallimageSize1">
      </div>
    </div>
  </div>
  </div>
    
    
    
    <!--  End of Carol -->
 
    	</div>
     
  </br></br>
  <div class="container">  
<form action="resetUserPassword.htm" method="post" role="form">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-4 form-group"><br><br>
										<label>New Password</label> <input type="password" name="newPassword"
											class="form-control input-lg" placeholder="Enter new password" maxlength="15" required/>
									</div>
									
								</div>
								<div class="row">
								<div class="col-sm-4"><br>
 									<button class="btn btn-lg btn-primary btn-block signup-btn" type="submit"> Changed Password</button>
 									</div>
								</div>
							</div>
</form>
</div>
</br>
</br>
</br>



</body>
</html>
