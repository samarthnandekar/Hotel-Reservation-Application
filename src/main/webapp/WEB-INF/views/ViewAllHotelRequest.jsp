<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    z-index: -1;
    position: absolute;
  }
  
  </style>
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
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class=""></span> ${requestScope.userName}</a></li>
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
            <li><a href="viewAllRequest.htm">View All Request</a></li> 
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

<!--  Image  -->
<div class=".container-fluid">    
    <div class="imgsize"><img src="resources/watzmann.png" class="img-responsive imgsize" alt="Image"></div>
  </div><br>
  
</body>
</html>