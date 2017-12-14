<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Sign in</title>
<link rel="icon" type="image/png" href="resources/watzmann.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!--  For Gmail Login -->
  
    <meta name="google-signin-client_id" content="1081245987832-k2mct60llncv445ofan8kfuu4b1it4s4.apps.googleusercontent.com">
    
  
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
  
  .imgsize
  {
  	width: 100%;
    height: 400px;
  }
  
  .smallimageSize
  {
  width:100%;
  height:25%;
  }
  .errorword
  {
  color:red;
  font-size: 18px;
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

.white
{
background-color:white;
}

.brownBack
{
background-color:#f2f2f2;
padding-left:20px;
padding:20px;
}

.contentTitle
  {
  color: #0F5F5C;
    font-weight: 600;
    line-height: 3em;
    font-size:20px;
  }
  
  .headerT
  {
    color: #0F5F5C;
    line-height: 3em;
    font-size:15px;
  }
  
  .infoD
  {
    color: #0F5F5C;
    font-size:12px;
    padding-left:5px;
  }
  .infoD1
  {
    color: #0F5F5C;
    font-size:12px;
    padding-left:15px;
  }
  .fbFormDisNo
  {
  display:none;
  }
  
  #hideBtnSubmit
  {
  display:none;
  }

  </style>
  
  <script>
 
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
</div>
<!-- End Nav Bar -->
<div class="infoDiv">
</div>

<div class="container">
	  <div class="row">
	  <div class="contentTitle">Sign in or select an option</div>
	  
        <div class="col-md-10 col-md-offset-1 white">
            <form:form action="login.htm" method="post" role="form" >
            <br>
            <div class="row">
            <div class="form-group">
            <div class="col-xs-8">
            <div class="headerT">Sign in with your email</div>
            </div>
            
            <div class="col-xs-3">
            <fb:login-button scope="public_profile,email" data-size="large" onlogin="checkLoginState();"> Log in with Facebook
            </fb:login-button>
            
            </br></br>
             <div id="my-signin2">
            </div>
            </div>
            </div>
            </div>
            
            <div class="row">
            <div class="form-group">
            <div class="col-xs-5">
             <label for="ex3">Email Address *</label>
             <input class="form-control" id="ex3" name="emailId" type="text">
            </div>
            <div class="col-xs-3">
            
            </div>
            <div class="col-xs-3">
            </br>
            <div><i style="font-size:15px" class="fa">&#xf084;</i> <span class="infoD">We keep it private</span></div>
            <div><i class="fa fa-shield" aria-hidden="true"></i><span class="infoD1">Share only with permission</span></div>
            
            </div>
            
            </div>
            </div>
            
            <div class="row"></div>
            <br>
            
            <div class="row">
            <div class="form-group">
            <div class="col-xs-4">
             <label for="ex3">Password *</label>
             <input class="form-control" id="ex3" name="userPassword" type="password">
            </div></div>
            </div>
     				</br>
     				<p class="errorword">${requestScope.error}</p>
     				
     		<div class="row">
     		<div class="form-group">
     		<div class="col-xs-4"><a href="">Forgot your password?</a></div>
     		</div>
     		</div>	
     		<br>
     		
     		<div class="row">
     		<div class="col-xs-6">
     		<div class="brownBack">
     		
     		<div class="">Travel Hotel Bookings+ members get even more!</div>
     		<br>
     		<div><span class="glyphicon glyphicon-ok"></span> Save money with Member Pricing</div>
     		<div><span class="glyphicon glyphicon-ok"></span> Book free rewards travel with no blackout dates</div>
     		<div><span class="glyphicon glyphicon-ok"></span> Get exclusive member deals and special offers</div>
     		
     		
     		<div class="checkbox">
  			   <label><input type="checkbox" value="">Join Travel Hotel Bookings+opens in a new window today. By joining Travel Hotel Bookings+, I accept all terms & conditions</label>
			</div>
     		</div>
     		
     		</div>
     		</div>
     		<br>
     		<div class="row">
     		<div class="form-group">
     		<div class="col-xs-4">	
                    <button class="btn btn-warning" type="submit"> Sign In</button>
            </div>
            </div>
            </div>
            <br>
     		</div>
     		
            </form:form>    
          </div>
</div>            


<div class="fbFormDisNo1">
<form:form action="loginBYFB.htm" method="post" role="form"  id="fbloginFrm">
<input type="hidden" type="text" name="fbemailID" id="fbemailID"/>
<button id="hideBtnSubmit" class="btn btn-warning" type="submit"> Sign In</button>
</form:form>
</div>



<!-- for FB login -->
<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '197344914088305',
      cookie     : true,
      xfbml      : true,
      version    : 'v2.8'
    });
    FB.AppEvents.logPageView();   
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
    


function checkLoginState() {
  FB.getLoginStatus(function(response) {
    console.log(response.status)
    console.log(response.userID)
    statusChangeCallback(response);
    
  });
}


	
function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
       console.log('Successful login for first function: ' + response.email);
       
      testAPI();
    } else {
      // The person is not logged into your app or we are unable to tell.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this app.';
    }
  }
  
function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', {fields: 'name,email'},function(response) {
    
    	$("#fbemailID").val(response.email);
      console.log('Successful login for: ' + response.name);
      console.log('Successful login for: ' + response.email);
     
      
     
     document.getElementById("fbloginFrm").submit();
      
      
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }
	
</script>
<!--  for google login    -->

<script>
    function onSuccess(googleUser) {
      console.log('Logged in as: ' + googleUser.getBasicProfile().getEmail());
      $("#fbemailID").val(googleUser.getBasicProfile().getEmail());
      document.getElementById("fbloginFrm").submit();
    }
    
    function onFailure(error) {
      console.log(error);
    }
    
    function renderButton() {
      gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 172,
        'height': 27,
        'longtitle': true,
        'theme': 'dark',
        'onsuccess': onSuccess,
        'onfailure': onFailure
      });
    }
  </script>
  
  <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
</body>
</html>