<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Request</title>
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
  width:30%;
  height:200px;
  }
    .tableheader
  {
   background-color:#00cc99;
	font-size:20px;
  }
  </style>
</head>
<body>
<!-- Start Nav Bar -->
	<div class="container">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span>

					</button>
					<a class="navbar-brand" href=""></a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li class="active"><a href=""></a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class=""></span> ${sessionScope.userName}</a></li>
						<li class="dropdown"><a
							class="dropdown-toggle glyphicon glyphicon-user"
							data-toggle="dropdown" href="#">Account <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="viewPlacedRequest.htm">View Requests</a></li>
								<li><a href="newRequestPlace.htm">Place New Request</a></li>
							</ul></li>

						<li><a href="homepageafterlogout.htm"><span class=""></span>Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<!-- End Nav Bar -->

<!--  Image  -->
<div class=".container-fluid">    
    <div class="imgsize"><img src="resources/watzmann.png" class="img-responsive imgsize" alt="Image"></div>
  </div>
  <br>
  
  <div class="container"> 
  <table class="table table-bordered">
    <thead>
    <tr class="tableheader">
    <td colspan="4">Hotel Request</td>
    </tr>
       <tr>
       <th>Hotel Image</th>
        <th>Hotel Name</th>
        <th>Request Date </th>
        <th>Request Status</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="hotelRequest" items="${requestScope.hotelRequestList}">
    
		<tr>
		
        <td class="col-sm-3"> 
    		<div class=""><img src="${hotelRequest.hotel.imgName}" class="img-responsive roomimageSize"  alt="Image"></div>
    		
        </td>
    </a>
    	<td class="col-sm-3"> 
    		<div class="">${hotelRequest.hotel.hotelName}</div>
    		<a href="showRequestDetails.htm?hotelID=${hotelRequest.hotel.hotelID}" target="_blank">
    		View</a>
        </td>
        
        <td class="col-sm-3"> 
    		<div class="">${hotelRequest.requestRaisedDate}</div>
    		
        </td>
        <td class="col-sm-3"> 
    		<div class="">${hotelRequest.requestStatus}</div>
    		
        </td>
    </tr>
  
    </c:forEach>
    </tbody>
  </div>
</body>
</html>