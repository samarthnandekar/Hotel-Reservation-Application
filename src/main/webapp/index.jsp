<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Travel Hotel Booking</title>
	<link rel="icon" type="image/png" href="resources/watzmann.png">
	
	 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap Links -->
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  <!-- JQuery Links -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  

  <!-- 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   -->
  <script>
 
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
  <style>



  .textinBox
  {
  color:#0F5F5C;
  margin:5px;
  
  }
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
  .word
  {
  color:white;
  text-align: center;
  
  }
  li{
display:inline;
padding:0px;
margin:0px;
}

.flagSize
{
height:25px;
width:40px;
display:inline;
margin-right:10px;
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
.smallimageSize1
  {
  	width:100%;
  	
  }
  #myCarousel, .item
  {
  	width: 99%;
    height: 400px;
    z-index: -1;
    position: absolute;
  }
  
  .searchdiv
  {
  margin-top:15px;
  background-color:rgba(0,0,0,0.6);
  width:80%;
  height:48%;
  margin-bottom:15px;	
  }
  .whiteFont
  {
  color:white;
  font-weight:bold;
  }
  
  .content
  {
  color: #83A7A5;
    font-size: .9em;
    line-height: 2em
  }
  
  .contentTitle
  {
  color: #0F5F5C;
    font-weight: 600;
    font-size: 1.2em;
    line-height: 3em
  }
  .ul
  {
  padding:0px;
  margin:0px
  }
  
  .infoClass
  {
    width: 300px;
    height: 70px;
    background-color: ;
    box-shadow: 0 0 20px #888888;
    float:left;
    
  }
  .glyphicon-ok-sign
    {
    font-size: 40px;
    color:#ff9900;
    margin-left:10px;
    margin-top:10px
    }
  .forspace1,.forspace2
  {
  margin-right:100px;
  margin-left:10px;
  }
  .textAlign_de
  {
  padding-top:10px;
    }
  .panel-primary>.panel-heading {
    color: #fff;
    background-color: #1DBAA1;
    border-color: #1DBAA1;
}
.panel
{
border:0px solid #1DBAA1;
}
.firstDivforOk
{
width: 65px;
height: 65px;
float:left;
background-color:;
}
.secondDivforOk
{
width: 230px;
height: 65px;
float:right;
background-color:;
padding-bottom:10px;
color:#0F5F5C;
font-size: 14px
}

.infoDiv
  {
  	width: 250px;
    height: 80px;
    z-index: 1;
   position: absolute;
   background-color:white;
   border:2px solid #1DBAA1;
   margin-left:1000px;
   display:none;
  }
  .infoDiv:after, .infoDiv:before {
	bottom: 100%;
	left: 35%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

.infoDiv:after {
	border-bottom-color: #1DBAA1;
	border-width: 15px;
	margin-left: -45px;
}

.deleteMeetingClose {
    font-size: 2em;
    cursor: pointer;
    position: absolute;
    right: 10px;
    top: px;
    
}
.test
{
	width:20px;
    height:20px;
}
.deleteMeetingClose:hover
{
color:red
}
.whiteBack
{
background-color:white;
height:80px;
}
  </style>
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

<!-- Start Block  -->
<div class="container">   
<div class="infoClass forspace1">
	<div class="firstDivforOk"><span class="glyphicon glyphicon-ok-sign"></span></div>
 <div class="secondDivforOk textAlign_de">If you find a lower price, we'll <b>match it and refund the difference.</b></div>
 
 </div>
<div class="infoClass forspace2">
<div class="firstDivforOk"><span class="glyphicon glyphicon-ok-sign"></span></div>
 <div class="secondDivforOk textAlign_de">If you find a lower price, we'll <b>match it and refund the difference.</b></div>
</div>

<div class="infoClass">
<div class="firstDivforOk"><span class="glyphicon glyphicon-ok-sign"></span></div>
 <div class="secondDivforOk textAlign_de">If you find a lower price, we'll <b>match it and refund the difference.</b></div>

</div>
</div>

<br>
<!-- End block -->
<div class="container">    
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading">Nantasket Beach Resort</div>
        <div class=""><img src="resources/watzmann.png" class="img-responsive smallimageSize"  alt="Image"></div>
        <div class="panel-footer">$81.99</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">Boston Harbor Hotel</div>
        <div class=""><img src="resources/Boston_Harbor_Hotel.png" class="img-responsive smallimageSize" alt="Image"></div>
        <div class="panel-footer">$340.42</div>
      </div>
    </div>
    <div class="col-sm-4"> 
      <div class="panel panel-primary">
        <div class="panel-heading">Sheraton Needham Hotel</div>
        <div class=""><img src="resources/Sheraton_Needham_Hotel.png" class="img-responsive smallimageSize"  alt="Image"></div>
        <div class="panel-footer">$109.90</div>
      </div>
    </div>
  </div>
</div><br><br>

<div class="container"> 
<span class="contentTitle">Global Sites</span>
<ul>

  <li title="India"><img src="resources/flag/IndianFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  <li title="Argintina"><img src="resources/flag/argintinaFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  <li title="Australia"><img src="resources/flag/Australia.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  
  <li title="Brazil"><img src="resources/flag/BrazilFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  <li title="British"><img src="resources/flag/BritishFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  <li title="Canada"><img src="resources/flag/CanadaFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  
  <li title="China"><img src="resources/flag/chinaFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  <li title="France"><img src="resources/flag/franceFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  <li title="germany"><img src="resources/flag/germanFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  
  <li title="Hong Kong"><img src="resources/flag/HkFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  <li title="Italy"><img src="resources/flag/italyflag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  <li title="Mexico"><img src="resources/flag/mexicoFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  
  <li title="Portugal"><img src="resources/flag/portugalFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  <li title="South Africa"><img src="resources/flag/southAfricaFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  <li title="Spain"><img src="resources/flag/spainFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  
  
  <li title="Sri Lanka"><img src="resources/flag/srilankaflag.jpg" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  <li title="Swiss"><img src="resources/flag/swissFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  <li title="India"><img src="resources/flag/thailandFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  
  <li title="Turkey"><img src="resources/flag/turkeyFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  <li title="Thailand"><img src="resources/flag/thailandFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  
  
</ul>

<ul>
  <li title="United Arab Emirates"><img src="resources/flag/UAEFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  <li title="United States of America"><img src="resources/flag/usFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
  <li title="Togo"><img src="resources/flag/TogoFlag.png" class="img-responsive smallimageSize flagSize"  alt="Image"></li>
</ul>

</div>

<div class="container content">
 <div class="contentTitle">About Travel Hotel Booking</div>
*This is the largest savings for simultaneous booking of hotel from July 2016 to March 2017,
and not the discount rate or amount for your booking. Savings calculated based on the cost of a Hotel booking on travelhotelbookings.com
as compared to the aggregated price of the full published fare given by the airline and the cost of your hotel for the same
travel products for the same travel dates when made separately. Savings will vary based on the
stay dates and selected travel supplier(s). Savings are not available on all packages. Please confirm the actual discount rate/ price
on the booking page.
    <br>

Contact us: 617 842 7522 
Mail Us: samarthnandekar@gmail.com
    </div>


<div class="firstDiv"> </div>

</body>
</html>