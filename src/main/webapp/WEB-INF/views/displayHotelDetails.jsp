 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Details </title>
<link rel="icon" type="image/png" href="resources/watzmann.png">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  <!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.0.min.js"></script>

  <style>
  
  .imgsize
  {
  	width: 100%;
    height: 400px;
  }
  
  .smallimageSize
  {
  width:30%;
  height:200px;
  }
  /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1000px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
    
    rating {
    text-align: right;
     position: absolute;
    right: 0px;
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
.whiteBack
{
background-color:white;
height:80px;
}
.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover
{
background-color:#1DBAA1;
}

.panel-primary>.panel-heading
{
background-color:#1DBAA1;
}
.setmiddle
{
margin:0 auto;
color:#ff9900;
}

.panel-primary {
    border-color: #1DBAA1;
}

.displayInline
{
display:inline;
}
.hotelinfo
{
color:#ff9900;
float:right;
}
.textColor {
    color: #0F5F5C;
}
.textwrap
{
width:50px;
background-color:red;
margin:0 px auto;
}
.floatRight
{
float:right;
width:500px;
}
.addresstxt
{
color:#ff9900;
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

<!-- End Nav Bar -->
 <div class=".container-fluid">    
    <div class="imgsize"><img src="resources/watzmann.png" class="img-responsive imgsize" alt="Image"></div>
 </div>
  <br>
  
<div class="container">
  <div class="row content">
    <div class="col-sm-3 sidenav">
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section1">Filters</a></li>
        <li><a href="#section2">Hotel Star</a>
        <form role="form">
    		<div class="checkbox">
      		<label><input type="checkbox" value="5" onchange="filterHotelsonStar()" class="chk">
      		<span class="glyphicon glyphicon-star">
      		<span class="glyphicon glyphicon-star">
      		<span class="glyphicon glyphicon-star">
      		<span class="glyphicon glyphicon-star">
      		<span class="glyphicon glyphicon-star"> 5 Stars </label>
   		 </div>
   		 <div class="checkbox">
   			   <label><input type="checkbox" value="4" onchange="filterHotelsonStar()" class="chk">
   			   <span class="glyphicon glyphicon-star">
      		<span class="glyphicon glyphicon-star">
      		<span class="glyphicon glyphicon-star">
      		<span class="glyphicon glyphicon-star"> 4 Stars </label>
   			   </label>
   		 </div>
   		 <div class="checkbox">
    		  <label><input type="checkbox" value="3" onchange="filterHotelsonStar()" class="chk">
      		<span class="glyphicon glyphicon-star">
      		<span class="glyphicon glyphicon-star">
      		<span class="glyphicon glyphicon-star"> 3 Stars </label>
    		  </label>
    	</div>
    	
    	<div class="checkbox">
    		  <label><input type="checkbox" value="2" onchange="filterHotelsonStar()" class="chk">
      		<span class="glyphicon glyphicon-star">
      		<span class="glyphicon glyphicon-star"> 2 Stars </label>
    		  </label>
    	</div>
    	<div class="checkbox">
    		  <label><input type="checkbox" value="1" onchange="filterHotelsonStar()" class="chk">
      		<span class="glyphicon glyphicon-star"> 1 Star </label>
    		  </label>
    	</div>
        
        </li>
        
      </ul><br>
      
    </div>
			<div id="maindiv1">
			
			<c:forEach var="hotel" items="${requestScope.searchResultList}">
				<div id="maindiv" class="col-sm-9">
					
					<a href="individualHotelDetails.htm?hotelID=${hotel.hotelID}&checkinDate=${requestScope.checkInDate}&checkoutDate=${requestScope.checkoutDate}" target="_blank">
						<div class="col-sm-12">
							<div class="panel panel-primary">
								<div class="panel-heading">${hotel.hotelName}
								<span class="rating">
								<c:forEach begin="1" end="${hotel.hotellevel}">
    								<span class="glyphicon glyphicon-star-empty"></span>
								</c:forEach>
								</span>
								</div>
								<div class="">
								
								   
									<img src="${hotel.imgName}" class="img-responsive smallimageSize displayInline" alt="Image">
									
									
									
						
									
									<div class="displayInline">
									<div class="floatRight">
									<p class="textColor">${hotel.hotelShortDecription}</p>
									<p class="addresstxt">
									${hotel.streetAddress}
									${hotel.city}
									${hotel.state}
									${hotel.pincode}
									${hotel.country}
									</p>
									</div>
									</div>
									
									
									
								</div>
								<div class="panel-footer">$110</div>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
			<c:if test="${empty requestScope.searchResultList}">
			<div class="setmiddle">
			<h1>No result found</h1>
			</div>
			</c:if>
			</div>
			<div id="ajaxData"  class="col-sm-9">
			
			</div>
		</div>
</div>
<br>
<br>
 <div class="firstDiv"> </div>
 
<script>

function filterHotelsonStar() {
	//alert("s");
	document.getElementById("maindiv1").style.display = "none";
	
	var chkArray = [];
	$(document).ready(function(){
	$(".chk:checked").each(function() {
		chkArray.push($(this).val());
	});
	});
	
	var selected;
	selected = chkArray.join(',');
	
	/* check if there is selected checkboxes, by default the length is 1 as it contains one single comma 
	if(selected.length >0){
		//alert("You have selected " + selected);	
	}else{
		alert("Please at least one of the checkbox");	
	}
	*/
    if (xmlHttp == null)
    {
        alert("Your browser does not support AJAX!");
        return;
    }

		var query = "action=/getHotelFilteredValue.htm&selectedValues=" + selected;
		xmlHttp.onreadystatechange = function stateChanged()
		{
   		 if (xmlHttp.readyState == 4)
    		{
       			//alert(xmlHttp.responseText);
       			var json = JSON.parse(xmlHttp.responseText);
       			document.getElementById("ajaxData").innerHTML = "";
                var json = JSON.parse(xmlHttp.responseText);
                if (json.hotelList.length> 0) {
                	
                	for (var count = 0; count < json.hotelList.length; count++)
                		{
                		
                	//alert("hotelID-->"+json.hotelList[0]);
                	var a=""+json.hotelList[count]+"";
                	//alert("json.hotelList[0];-->"+a);
                	var n = a.lastIndexOf(",");
                	var strhotelID=a.charAt(0);
                	//alert("final hotelID-->"+strhotelID);
                	var strHotelName=a.substr(2,n-2);
                	//alert("strHotelName-->"+strHotelName);
                
                	var strhotelImg=a.substr(n+1,a.length);
                	//alert("strhotelImg-->"+strhotelImg);
                	var x = document.createElement("A");
                	//var t = document.createTextNode(strHotelName);
                	//x.appendChild(t);
                	var hrefvalue="individualHotelDetails.htm?hotelID="+strhotelID;
                	//alert(hrefvalue);
                    x.setAttribute("href",hrefvalue);
                    x.setAttribute("target","_blank");
                    
                    document.getElementById("ajaxData").appendChild(x);
                    
                    var firstdiv=document.createElement("div");
                    firstdiv.setAttribute('class', 'panel panel-primary');
                    x.appendChild(firstdiv);
                    
                    var panelheadingdiv=document.createElement("div");
                    panelheadingdiv.setAttribute('class', 'panel-heading');
                    
                    panelheadingdiv.innerHTML=strHotelName;
                    firstdiv.appendChild(panelheadingdiv);     
                    
                    var himg = document.createElement("IMG");
                    himg.setAttribute("src",strhotelImg);
                    himg.setAttribute("class","img-responsive smallimageSize");
                    firstdiv.appendChild(himg);

                	}
                }
      			 
        		
    		}
   		 
		};
			//alert("pst");
			xmlHttp.open("POST", "getHotelFilteredValue.htm", true);
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
</script>
</body>
</html>