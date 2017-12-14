<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Request</title>
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
<body>
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
      <li><a href="#"><span class=""></span> ${sessionScope.userName}</a></li>
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

<!--  Image  -->
<div class=".container-fluid">    
    <div class="imgsize"><img src="resources/watzmann.png" class="img-responsive imgsize" alt="Image"></div>
  </div>
  <br>
 <div class="container"> 
 <form action="hotelRequestDecisionByAdmin.htm" method="post" role="form" id="formID" onsubmit="return validateFunction()">
  <table class="table table-bordered">
    <thead>
    <tr class="tableheader">
    <td colspan="5">Hotel Request</td>
    </tr>
       <tr>
       <th>Hotel Image</th>
        <th>Hotel Name</th>
        <th>Request Date </th>
        <th>Request Status</th>
        <th>Action</th>
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
        
        <td class="col-sm-2"> 
    		<div class="">${hotelRequest.requestRaisedDate}</div>
    		
        </td>
        <td class="col-sm-2"> 
    		<div class="">${hotelRequest.requestStatus}</div>
    		
        </td>
        
		<td><input type="checkbox" value="${hotelRequest.hotelRequestId}" name="selectedValue" id="checkboxvalue"></td>
    </tr>
  
    </c:forEach>
    
    </tbody>
    </table>
    	
     <input type="hidden" id="myText" name="myText" value="">
     <button class="btn btn-danger btn-md pull-left" type="submit" onclick="approvedFunction()"> Reject Request</button>
     <button class="btn btn-success btn-md pull-right" type="submit" onclick="rejectmyFunction()"> Approved Request</button>
  </form>
    
  </div>
  <script>
  function approvedFunction()
  {
	  //alert("approved");
	  document.getElementById("myText").value="Approved";
	  
	  //alert("Sa");
  }
  function rejectmyFunction()
  {
	  //alert("Sa");
	  //document.getElementById("action").innerHTML="Reject";
	  document.getElementById("myText").value = "Reject";
	 // alert("Sa");
	  
  }
  
  function validateFunction()
  {
	  
  if ($("#formID input:checkbox:checked").length > 0)
  {
	 document.getElementById("myText").value = "Approved";
     alert($("#formID input:checkbox:checked").length);
     return true;
  }
  else
  {
	  //alert("in else");
	  alert("You have not selected anything,please select any check box");
	  return false;
  }
  }
  
  </script>
</body>
</html>