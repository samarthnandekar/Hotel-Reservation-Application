<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Support</title>
<link rel="icon" type="image/png" href="resources/watzmann.png">
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
 

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
 
 
 
 
  <script>
  $( function() {
    $( "#accordion" ).accordion();
  } );
  </script>
  
  <style>
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
  body{
background-color:#f2f2f2
}
.whiteBack
{
background-color:white;
height:80px;
}
  .ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover {
    border: 1px solid #0F5F5C;
    background: #0F5F5C;
    font-weight: normal;
    color: #ffffff;
}
  </style>
  
</head>
<body>

<div class="firstDiv"> </div>

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



<div class="container">
<div class="contentTitle">We're here to help.</div>

<div id="accordion">
  <h3>View your hotel booking confirmation</h3>
  <div>
    <p>
    Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer
    ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit
    amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut
    odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
    </p>
    
     <p>
    Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer
    ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit
    amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut
    odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
    </p>
    
     <p>
    Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer
    ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit
    amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut
    odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
    </p>
    </br>
  </div>
  <h3>Hotel booking mistakes</h3>
  <div>
    <p>
    Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet
    purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor
    velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In
    suscipit faucibus urna.
    </p>
  </div>
  <h3>Cancel your hotel booking</h3>
  <div>
    <p>
    Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
    Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero
    ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis
    lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
    </p>
    <ul>
      <li>List item one</li>
      <li>List item two</li>
      <li>List item three</li>
    </ul>
  </div>
  <h3>Get a receipt for your hotel booking</h3>
  <div>
    <p>
    Cras dictum. Pellentesque habitant morbi tristique senectus et netus
    et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
    faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
    mauris vel est.
    </p>
    <p>
    Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.
    Class aptent taciti sociosqu ad litora torquent per conubia nostra, per
    inceptos himenaeos.
    </p>
  </div>
  
   <h3>Write a hotel review</h3>
  <div>
    <p>
    Cras dictum. Pellentesque habitant morbi tristique senectus et netus
    et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in
    faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia
    mauris vel est.
    </p>
    <p>
    Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.
    Class aptent taciti sociosqu ad litora torquent per conubia nostra, per
    inceptos himenaeos.
    </p>
  </div>
  
  
  
  
  
</div>
 </div>
 
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