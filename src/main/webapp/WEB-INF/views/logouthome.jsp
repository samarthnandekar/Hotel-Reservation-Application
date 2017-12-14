<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page session="false" %>
<html>
<head>
	
  <title>Home Page</title>
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
  height:45%;
  margin-bottom:0px;	
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
    height: 350px;
    z-index: -1;
    position: absolute;
  }
  .smallimageSize1
  {
  	width:100%;
  	
  }
 
 .smallimageSize2
 {
 
 }
 
 
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
/*
 * 
 
function checkValidEmailID() {
    
	//alert("hello1");
    
    if (xmlHttp == null)
    {
        alert("Your browser does not support AJAX!");
        return;
    }

		var stremail = document.getElementById("emailID").value;

		var query = "action=/checkValidEmail.htm&emailId=" + stremail;
		xmlHttp.onreadystatechange = function stateChanged()
		{
   		 if (xmlHttp.readyState == 4)
    		{
       			 //alert(xmlHttp.responseText);
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
        		
    		}
		};
			xmlHttp.open("POST", "checkValidEmail.htm", true);
			xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xmlHttp.send(query);
			return false;
			
}
*/

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
<div class="container">   
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
                                
      </button>
      <a class="navbar-brand" href="#">Home</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class=""></span> ${sessionScope.userName}</a></li>
     
      <li class="dropdown">
          <a class="dropdown-toggle glyphicon glyphicon-user" data-toggle="dropdown" href="#">Account
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="login.htm">Sign In</a></li>
            <li><a href="signup.htm">Create an Account</a></li> 
          </ul>
        </li>
     
    	<!-- <li><a href="#"><span class=""></span> My Scratchpad</a></li> -->
      
        
        </ul>
    </div>
  </div>
</nav>
</div>
<!-- End Nav Bar -->

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
        <img src="resources/goa_beach.jpg" class="smallimageSize1" alt="Chania">
      </div>

      <div class="item">
        <img src="resources/Ladakh.jpg" class="smallimageSize1" alt="Chania">
      </div>
    
      <div class="item">
        <img src="resources/leh.jpg" class="smallimageSize1" alt="Flower" >
      </div>

      <div class="item">
        <img src="resources/hotel7.jpg" alt="Flower"  class="smallimageSize1">
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
    			<label class="whiteFont">Going TO</label>
    			</div>
    			
    			<div class="col-sm-6">
    			<input type="text" name="searchGoingto" id="searchGoingto" class="form-control" placeholder="Going to" onkeyup=""/>
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
    			<div class="col-sm-3">
    			<label class="whiteFont">Rooms</label>
    			</div>
    			
    			
    			
    			</br></br></br>
    			<div>
    			<div class="col-sm-4"></div>
    			<button type="submit" class="btn btn-warning">Search</button>
    			</div>
    			
    			
    				</form>
    				</div>
    		</div>
    	</div>
     
  <br>
  </br>
<div class="container">    
  <div class="row">
  <c:forEach var="hotel" items="${requestScope.allhotels}">
  
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

<br>
</br>



<!-- Start Nav Bar -->
<div class="container">   
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand"><span class="glyphicon glyphicon-phone-alt"> </span>Contact us: 617 842 7522</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a>  <span class="glyphicon glyphicon-envelope"></span> Mail Us: samarthnandekar@gmail.com </a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
       <li><a href=""><span class=""></span> Enjoy Booking</a></li>
         <li><a href=""><span class=""></span> Enjoy Life</a></li>
      </ul>
    </div>
  </div>
</nav>
</div>




</body>
</html>
