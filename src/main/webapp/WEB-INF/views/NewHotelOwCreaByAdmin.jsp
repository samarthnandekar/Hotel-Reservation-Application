<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Sign up</title>
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

<!-- Start Nav Bar -->
<div class="container">   
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
                                
      </button>
      <a class="navbar-brand" href=""></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <li><a href=""><span class=""></span> ${sessionScope.userName}</a></li>
      <li class="dropdown">
          <a class="dropdown-toggle glyphicon glyphicon-user" data-toggle="dropdown" href="#">User Accounts
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="creationHotelOwnerByAdmin.htm">Create new user</a></li>
            <li><a href="viewAllUserAccount.htm">View All User</a></li> 
          </ul>
        </li>
        
        <li class="dropdown">
          <a class="dropdown-toggle glyphicon glyphicon-user" data-toggle="dropdown" href="#">Request
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="viewNewRequest.htm">View New Request</a></li>
            <li><a href="viewAllRequestAdmin.htm">View All Request</a></li> 
          </ul>
        </li>
        <li><a href="allRegisteredHotelList.htm"><span class=""></span> Registered Hotel List</a></li>
        
        <li><a href="homepageafterlogout.htm"><span class=""></span>Logout</a></li>
        </ul>
    </div>
  </div>
</nav>
</div>
<!-- End Nav Bar -->


<div class=".container-fluid">    
    <div class="imgsize"><img src="resources/watzmann.png" class="img-responsive imgsize" alt="Image"></div>
  </div><br>

<div class="container">
	  <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form:form action="newHotelOwnerCreaByAdmin.htm" method="post" role="form" commandName="hotelOwner" onsubmit="return validateForm()">
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
</div>

</body>
</html>