<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Sign up</title>
	<link rel="icon" type="image/png" href="resources/watzmann.png">
  <meta charset="utf-8">
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
  
  .smallimageSize
  {
  width:100%;
  height:25%;
  }
  .redone
  {
  color:red;
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
  </style>
</head>
<body>

<script>

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
      		/*	 if(!b)
      			{
      				document.getElementById("emailerror").innerHTML = "Email is already registered"; 
      			}
        		*/
    		}
		};
			xmlHttp.open("POST", "checkValidEmail.htm", true);
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

function validateForm()
{
	//alert("Sasa");
	var isValid=document.getElementById("emailerror").innerHTML;
	if(isValid=="")
		{
		return true;
		}
	else
		{
		return false;
		}
	
	}
	
</script>


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
	  <div class="contentTitle">Create Your Free Account</div>
	  
        <div class="col-md-10 col-md-offset-1 white">
            <form:form action="login.htm" method="post" role="form" >
            <br>
            <div class="row">
            <div class="form-group">
            <div class="col-xs-8">
            <div class="contentTitle">275 TravelHotelBookings+ members joined today!</div>
            </div>         
            </div>
            </div>
            
            <div class="row">
            <div class="form-group">
            <div class="col-xs-8">
            <div class="headerT">Create an account with your Email</div>
            </div>         
            </div>
            </div>
            
            
            
            
            
            <div class="row">
            <div class="form-group">
            <div class="col-xs-3">
             <label for="ex3">First Name *</label>
             <input class="form-control" id="ex3" name="firstName" type="text">
            </div>
            <div class="col-xs-3">
             <label for="ex3">Last Name *</label>
             <input class="form-control" id="ex3" name="lastName" type="text">
            </div>
            </div>
            </div>
            
            
            <br>
            
            <div class="row">
            <div class="form-group">
            <div class="col-xs-4">
             <label for="ex3">Email Address *</label>
             <input class="form-control" id="ex3" type="email" name="userAccount.email" id="emailID" onkeyup="checkValidEmailID()" placeholder="Your Email" required/><span id="emailerror" class="redone"></span> </br>
            </div></div>
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
            
            <div class="row"></div>
            <br>
            
            <div class="row">
            <div class="form-group">
            <div class="col-xs-4">
             <label for="ex3">Confirm Password *</label>
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
     		<div class="checkbox">
     		<div class="col-xs-7">
  			   <label><input type="checkbox" value="">Please send me Expedia.com emails with travel deals, special offers, and other information.</label>
			</div>
			</div>
			</div>
			
     		<div class="checkbox">
  			   <label><input type="checkbox" value="">I have read and agree to the Terms of Use and the Privacy Policy.</label>
			</div>
     		
     		<div class="row">
     		<div class="form-group">
     		<div class="col-xs-4">	
                    <button class="btn btn-warning" type="submit"> Create Free Account</button>
            </div>
            </div>
            </div>
            <br>
     		</div>
     		
     		
            </form:form>    
            
                  
            
          </div>
</div>  


<!-- 
<div class="container">
	  <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form:form action="signup.htm" method="post" role="form" commandName="customer" onsubmit="return validateForm()">
              <legend>Sign Up</legend>
                    <h4>It's free and always will be.</h4>
                    
                    <div class="row">
                        <div class="col-xs-6 col-md-6">
                            <input type="text" name="firstName" class="form-control input-lg" placeholder="First Name"  required/>  
                                                  </div>
                        <div class="col-xs-6 col-md-6">
                            <input type="text" name="lastName" class="form-control input-lg" placeholder="Last Name"  required/> 
                                                   </div>
                    </div>
                    </br>
                    
                    <input type="text" name="mobileNumber" value="" class="form-control input-lg" placeholder="mobileNumber" lenght="9" required/></br>
                    
                    <input type="email" name="userAccount.email" class="form-control input-lg" id="emailID" onkeyup="checkValidEmailID()" placeholder="Your Email" required/><span id="emailerror" class="redone"></span> </br>
                        
                    <input type="password" name="userAccount.userPassword" value="" class="form-control input-lg" placeholder="Password"  required/>
     
              <span class="help-block">By clicking Create my account, you agree to our Terms and that you have read our Data Use Policy, including our Cookie Use.</span>
                    <button class="btn btn-lg btn-primary btn-block signup-btn" type="submit">
                        Create my account</button>
            </form:form>          
          </div>
</div>            
</div>
 -->
</div>

</body>
</html>