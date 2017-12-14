<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registered Hotel List</title>
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
  .tableheader
  {
  background-color:#00cc99;
	font-size:15px;
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
  </div><br>
  
  <div class="container-fluid"> 
  <table class="table table-bordered">

                            <thead>

                                <tr class="tableheader">
                                	<th class="col-md-1">Action</th>
                                    <th class="col-md-1">hotelID</th>
                                    <th class="col-md-3">Hotel Name</th>
                                    <th class="col-md-3">HotelInformation</th>
                                           
                                    <th class="col-md-3">primaryContactName</th>
                                    <th class="col-md-3">primaryContactNumber</th>
                                    <th class="col-md-3">hotellevel</th>
                                    <th class="col-md-3">hotelrating</th>
                                    <th class="col-md-3">isHotelActive</th>
                                    <th class="col-md-3">numbersOFRooms</th>
                                    
                                    
                                    </tr>
                                    
                             </thead>
                             <tbody>
						
						 <c:forEach var="hotel" items="${requestScope.hotelList}">
							  <tr>
							   <td><button type="button" class="btn btn-success btn-md" onclick="saveRowData(this);">Save</button></td>
							   
							   <td class="col-md-1">${hotel.hotelID}</td>
							   
							   <td><input type="text" class="form-control" name="hotelName" value="${hotel.hotelName}"></td>
							   <td><input type="text" class="form-control" name="hotelInformation" value="${hotel.hotelInformation}"></td>
							   
							   <td><input type="text" class="form-control" name="primaryContactName" value="${hotel.primaryContactName}"></td>
							   <td><input type="text" class="form-control" name="primaryContactNumber" value="${hotel.primaryContactNumber}"></td>
							   <td><input type="text" class="form-control" name="hotellevel" value="${hotel.hotellevel}"></td>
							   
							   <td><input type="text" class="form-control" name="hotelrating" value="${hotel.hotelrating}"></td>
							   <td><input type="text" class="form-control" name="isHotelActive" value="${hotel.isHotelActive}"></td>
							   <td><input type="text" class="form-control" name="numbersOFRooms" value="${hotel.numbersOFRooms}"></td>
							   
                              
                               </tr>
							  
						</c:forEach>
  
  </tbody>
  </table>
  </div>
  <script>
  
  function saveRowData(idrowtoSave)
  {
      idrowtoSave.disabled=true;
      var p = idrowtoSave.parentNode.parentNode;
      p.style.backgroundColor = "green";
      idrowtoSave.parentNode.nextSibling.nextSibling.childNodes[0].disabled=true;
     
     
      var hotelID = p.cells[1].innerHTML;
      //alert("hotelID-->"+hotelID);
      var hotelName = p.cells[2].firstChild.value;
      //alert("hotelName-->"+hotelName);
      
      var hotelInformation = p.cells[3].firstChild.value;
      //alert("hotelInformation-->"+hotelInformation);
      
      var primaryContactName = p.cells[4].firstChild.value;
     // alert("primaryContactNumber-->"+primaryContactName);
      
      
      var primaryContactNumber = p.cells[5].firstChild.value;
      //alert("primaryContactNumber-->"+primaryContactNumber);
      
      var hotellevel = p.cells[6].firstChild.value;
     // alert("hotellevel-->"+hotellevel);
      var hotelrating = p.cells[7].firstChild.value;
     // alert("hotelrating-->"+hotelrating);
      
      
      var isHotelActive = p.cells[8].firstChild.value;
     // alert("isHotelActive-->"+isHotelActive);
      var numbersOFRooms = p.cells[9].firstChild.value;
     // alert("numbersOFRooms-->"+numbersOFRooms);
      
      xmlHttp.onreadystatechange = function stateChanged()
      {
          if (xmlHttp.readyState == 4)
          {

          }
      };
      
      p.disabled = true;
      
      var query = "userAction=addToDb&hotelID="+hotelID+"&hotelName=" + hotelName + "&hotelInformation=" + hotelInformation+
      			  "&primaryContactName="+primaryContactName+"&primaryContactNumber="+primaryContactNumber+
      		      "&hotellevel="+hotellevel+"&hotelrating="+hotelrating+
      		      "&isHotelActive="+isHotelActive+"&numbersOFRooms="+numbersOFRooms;
      
      xmlHttp.open("POST", "lineByLineDataSave.htm", true);
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