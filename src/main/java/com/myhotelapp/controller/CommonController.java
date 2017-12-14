package com.myhotelapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.style.StylerUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;


import com.myhotelapp.dao.AddHotelDao;
import com.myhotelapp.dao.RoomBookingDao;
import com.myhotelapp.dao.SearchHotelDao;
import com.myhotelapp.dao.UserAddDao;
import com.myhotelapp.helper.PdfGenerator;
import com.myhotelapp.helper.SendConfirmationEmail;
import com.myhotelapp.helper.SendHotelOwnerAccountCreation;
import com.myhotelapp.maplocations.AddressConverter;
import com.myhotelapp.pojo.Booking;
import com.myhotelapp.pojo.BookingItem;
import com.myhotelapp.pojo.Customer;
import com.myhotelapp.pojo.Hotel;
import com.myhotelapp.pojo.HotelOwner;
import com.myhotelapp.pojo.HotelRequest;
import com.myhotelapp.pojo.Person;
import com.myhotelapp.pojo.Room;
import com.myhotelapp.pojo.UserAccount;
import com.myhotelapp.validator.HotelOwnerFormValidator;
import com.myhotelapp.validator.UserValidator;

@Controller
public class CommonController {
	
	@Autowired
	UserAddDao userAddDao;
	
	@Autowired
	AddHotelDao addHotelDao;
	
	@Autowired
	SearchHotelDao searchHotelDao;
	
	@Autowired
	RoomBookingDao roomBookingDao;
	
	
	@RequestMapping(value="/homepageandcontactus.htm",method = RequestMethod.GET)
	public String initializeForm() {
		
		return "AddHotelRequestHome";

	}
	
	
	@RequestMapping(value="/loginBYFB.htm", method = RequestMethod.POST)
	public ModelAndView loginBYFB(HttpServletRequest hsr) {

		ModelAndView mv = new ModelAndView();
		String userEmail=hsr.getParameter("fbemailID");
		HttpSession session= hsr.getSession();
		
		System.out.println("userEmail---"+userEmail);
		ArrayList allhotelsList= new ArrayList<Hotel>();
		allhotelsList=searchHotelDao.allActiveHotelList();
		
		Iterator itr=(Iterator) allhotelsList.iterator();
		
		System.out.println("found tables number-->"+allhotelsList.size());
		
		ArrayList fhotelList= new ArrayList();
		ArrayList shotelList= new ArrayList();
		
		int i=1;
		 while(itr.hasNext())
	        {
			 Hotel h=(Hotel) itr.next();
			 if(i<4)
			 {
				 fhotelList.add(h); 
			 }
			 else
			 {
				 shotelList.add(h);  
			 }
			 
	        }
		
		 
		mv.addObject("fhotelList", fhotelList);  //allhotels
		mv.addObject("shotelList", shotelList); 
		
		mv.addObject("userName",userEmail);
		session.setAttribute("userName", userEmail);
		mv.setViewName("home");
		
		return mv;
	}
	
	@RequestMapping(value="/feedback.htm",method = RequestMethod.GET)
	public String feedback() {
		
		return "feedback";

	}
	
	@RequestMapping(value="/customerSupport.htm",method = RequestMethod.GET)
	public String customerSupport() {
		
		return "customerSupport";

	}
	
	
	@RequestMapping(value="/hotelRoomBooking.htm",method = RequestMethod.POST)
	public ModelAndView hotelRoomBooking(HttpServletRequest hsr) {
		
		String roomNumber=hsr.getParameter("roomNumber");
		String hotelId=hsr.getParameter("hotelID");
		
		// to get Hotel Name
		//SearchHotelDao searchHotelDao= new SearchHotelDao();
		Hotel hotel=searchHotelDao.getHotel(hotelId);
			
		String checkinDate=hsr.getParameter("checkin");
		
		String checkOutDate=hsr.getParameter("checkout");
		String Numberofrooms=hsr.getParameter("Norooms");
		String numberOFPeople=hsr.getParameter("noOFAdults");
		String strPrice=hsr.getParameter("roomPrice");
		int price=Integer.parseInt(strPrice);
		
		System.out.println("checkinDate-->"+checkinDate);
		System.out.println("checkout-->"+checkOutDate);
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		
		Date finalCheckingDate=null;
		Date finalCheckOutDate=null;
		try {
		
			finalCheckingDate = formatter.parse(checkinDate);
			
            Calendar c = Calendar.getInstance(); 
            c.setTime(finalCheckingDate); 
            c.add(Calendar.HOUR, 9);
            finalCheckingDate = c.getTime();


			finalCheckOutDate=formatter.parse(checkOutDate);
			
			c.setTime(finalCheckOutDate); 
            c.add(Calendar.HOUR, 9);
            finalCheckOutDate = c.getTime();
            
			System.out.print("finalCheckingDate--"+finalCheckingDate);
			
			System.out.print("finalCheckingDate--"+finalCheckOutDate);
			System.out.println("--------------");
			} 
		catch (ParseException e) 
			{
			e.printStackTrace();
			}
		
		long diff = finalCheckOutDate.getTime()-finalCheckingDate.getTime();
		
		long diffHours = diff / (60 * 60 * 1000) % 24;
		int numOfDays = (int) (diff/(1000*60*60*24));
		
		if(diffHours>1)
		   {
			numOfDays=numOfDays+1;
		   }
		int totalPrice=numOfDays*price;
		
		ModelAndView mv= new ModelAndView();
		mv.addObject("hotelName", hotel.getHotelName());
		mv.addObject("hotelId",hotelId);
		mv.addObject("roomNumber",roomNumber);
		
		mv.addObject("ContactNumber", hotel.getPrimaryContactNumber());
		//mv.addObject("roomNumber", roomNumber);
		
		mv.addObject("showcheckinDate", finalCheckingDate);
		mv.addObject("showcheckOutDate", finalCheckOutDate);
		
		mv.addObject("datecheckinDate", checkinDate);
		mv.addObject("datecheckOutDate", checkOutDate);
		
		mv.addObject("Numberofrooms", Numberofrooms);
		mv.addObject("numberOFPeople", numberOFPeople);
		mv.addObject("numberOfDays", numOfDays);	
		
		mv.addObject("totalPrice", totalPrice);
		String bookingConfirmed="No";
		mv.addObject("bookingConfirmed",bookingConfirmed);
			
		mv.setViewName("RoomBookingPage");
		
		return mv;

	}
	
	
	@RequestMapping(value="/homepageafterlogout.htm",method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest hsr) {
		
		ModelAndView mv= new ModelAndView();
		HttpSession session= hsr.getSession();
		session.removeAttribute("userName");
		session.invalidate();
		List allhotels=searchHotelDao.allActiveHotelList();
		mv.addObject("allhotels", allhotels);
		System.out.println("temp check session");
		mv.setViewName("home");
		return mv;

	}
	
	
	
	@RequestMapping(value="/creationHotelOwnerByAdmin.htm",method = RequestMethod.GET)
	public String newUserCreationByAdmin(HttpServletRequest hsr) {
		
		HttpSession session= hsr.getSession();

		String userName=(String)session.getAttribute("userName");
		
		if(userName==null)
		{
			return "login";
		}
		
		return "NewHotelOwCreaByAdmin";

	}
	
		
	@RequestMapping(value="/viewAllUserAccount.htm",method = RequestMethod.GET)
	public ModelAndView viewAllUserAccount(HttpServletRequest hsr) {
		
		ModelAndView mv= new ModelAndView();
		
		HttpSession session= hsr.getSession();
		String userName=(String)session.getAttribute("userName");

		if(userName==null)
		{
			mv.setViewName("login");
			return mv;
		}
		//UserAddDao userAddDao= new UserAddDao();
		ArrayList<Person>personList= userAddDao.personList();
		
		mv.addObject("personList", personList);
		mv.setViewName("AllUserAccount");
		
		return mv;

	}
	
	
	
	@RequestMapping(value="/viewNewRequestadmin.htm",method = RequestMethod.GET)
	public String viewNewRequestadmin(HttpServletRequest hsr) {
		
		return "AllUserAccount";

	}
	
	@RequestMapping(value="/newHotelOwnerCreaByAdmin.htm",method = RequestMethod.POST)
	public String createHotelOwnerCreationbyAdmin(@ModelAttribute("hotelOwner") HotelOwner hotelOwner, BindingResult result) throws Exception 
	{
		try {
			System.out.print("test");
			System.out.print("after userAddDao test1");
			//UserAddDao userAddDao = new UserAddDao();
			userAddDao.createHotelOwner(hotelOwner.getFirstName(), hotelOwner.getLastName(),hotelOwner.getMobileNumber(),hotelOwner.getUserAccount().getEmail(), hotelOwner.getUserAccount().getUserPassword());
			String hotelOwEmailID=hotelOwner.getUserAccount().getEmail();
			String password=hotelOwner.getUserAccount().getUserPassword();
			//mail send
			String message = "Hello "
					+ hotelOwEmailID
					+ ", \n \n "
					+ "Your user account has been created :). \n\n\n "
					+ "Now you can place the request to add new Hotels in application. \n\n"
					+ "User Name :"+" "+hotelOwEmailID+"\n\n"
					+ "Password Date :"+" "+password+"\n\n"
					+ "\n\n\n"
					+"Enjoy your Time"
					+"Thanks";
					
			SendHotelOwnerAccountCreation.sendMail(hotelOwEmailID, message);
			
			// DAO.close();
		} catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
		}

		return "AllUserAccount";

	}
	
	
	@RequestMapping(value="/allRegisteredHotelList.htm",method = RequestMethod.GET)
	public ModelAndView allRegisteredHotelList(HttpServletRequest hsr) {
		
		
		ModelAndView mv=new ModelAndView();

		HttpSession session= hsr.getSession();
		String userName=(String)session.getAttribute("userName");
		
		if(userName==null)
		{
			mv.setViewName("login");
			return mv;
		}
		
	  //	SearchHotelDao searchHotelDao= new SearchHotelDao();
		ArrayList<Hotel> hotelList=searchHotelDao.getRegisteredHotelList();
		
		mv.addObject("hotelList", hotelList);
		mv.setViewName("AllRegisteredHotelList");
		return mv;
	}
	
	@RequestMapping(value="/lineByLineDataSave.htm",method = RequestMethod.POST)
	public void lineByLineDataSave(HttpServletRequest hsr) {
		
		//AddHotelDao addHotelDao= new AddHotelDao();
			String hotelID=hsr.getParameter("hotelID");
			String 	hotelName=hsr.getParameter("hotelName");
			String 	hotelInformation=hsr.getParameter("hotelInformation");
			String 	primaryContactName=hsr.getParameter("primaryContactName");
			String 	primaryContactNumber=hsr.getParameter("primaryContactNumber");
			String 	hotellevel=hsr.getParameter("hotellevel");
			String 	hotelrating=hsr.getParameter("hotelrating");
			String 	isHotelActive=hsr.getParameter("isHotelActive");
			String 	numbersOFRooms=hsr.getParameter("numbersOFRooms");
		
			int intHotellevel=Integer.parseInt(hotellevel);
			int intHotelRating=Integer.parseInt(hotelrating);
			int intNumberOfRooms= Integer.parseInt(numbersOFRooms);
			
			int hotelId=Integer.parseInt(hotelID);
			
        addHotelDao.updateHotelInformation(hotelId,hotelName,hotelInformation,primaryContactName,primaryContactNumber,intHotellevel,intHotelRating,isHotelActive,intNumberOfRooms);
	}
	
	
	@RequestMapping(value="/confirmBooking.htm",method = RequestMethod.POST)
	public ModelAndView confirmBooking(HttpServletRequest hsr) {
		
		
		ModelAndView mv=new ModelAndView();

		String hotelID=hsr.getParameter("hotelId");
		String roomno=hsr.getParameter("roomNumber");
		String checkinDate=hsr.getParameter("checkinDate");
		String checkOutDate=hsr.getParameter("checkOutDate");
		String Numberofrooms=hsr.getParameter("numberOFPeople");
		String numberOFPeople=hsr.getParameter("Numberofrooms");
		String strPrice=hsr.getParameter("totalPrice");
		String strtotalPrice=hsr.getParameter("totalPrice");
		
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		
		Date finalCheckingDate=null;
		Date finalCheckOutDate=null;
		try {
		
			finalCheckingDate = formatter.parse(checkinDate);
			
			Calendar c = Calendar.getInstance(); 
            c.setTime(finalCheckingDate); 
            c.add(Calendar.HOUR, 9);
            finalCheckingDate = c.getTime();
            
			finalCheckOutDate=formatter.parse(checkOutDate);
			 
            c.setTime(finalCheckOutDate); 
            c.add(Calendar.HOUR, 9);
            finalCheckOutDate = c.getTime();
            
			System.out.print("finalCheckingDate--"+finalCheckingDate);
			
			System.out.print("finalCheckingDate--"+finalCheckOutDate);
			System.out.println("--------------");
			} 
		catch (ParseException e) 
			{
			
			e.printStackTrace();
			}
		
		Booking booking= new Booking();
		
		BookingItem bookingItem= new BookingItem();	
		bookingItem.setbStartDate(finalCheckingDate);
		bookingItem.setbEndDate(finalCheckOutDate);
		bookingItem.setBookingStatus("Confirmed");

		Integer numberOfDays=Integer.parseInt(numberOFPeople);
		bookingItem.setNumberOfDays(numberOfDays);

		Integer invPrice=Integer.parseInt(strPrice);
		bookingItem.setCost(invPrice);
		
		SearchHotelDao searchHotelDao= new SearchHotelDao();
		Hotel hotel= searchHotelDao.getHotel(hotelID);
		
		
		Room room = searchHotelDao.getRoom(hotelID,roomno);
		
		Integer numberofPeople=Integer.parseInt(numberOFPeople);
		
		bookingItem.setNoOfPeople(numberofPeople);
		bookingItem.setRoom(room);
 		
 		HttpSession session=hsr.getSession();
 		String custEmailID=(String)session.getAttribute("userName");
 		
 		//UserAddDao userAddDao= new UserAddDao();
 		Customer customer=userAddDao.getCustomer(custEmailID);
		booking.setCustomer(customer);
		
		Date bookingDAte=new Date();
		booking.setBookingDate(bookingDAte);
		
		booking.getBookingItemList().add(bookingItem);
		bookingItem.setBooking(booking);
		
		booking.setHotel(hotel);    // if commented then work file fine
		
		hotel.getBookingList().add(booking);
		
		
		RoomBookingDao rbd= new RoomBookingDao();
		boolean isBooked=rbd.saveBooking(booking);
		if(isBooked)
		{
			System.out.println("custEmailID---->"+custEmailID);
			custEmailID="samarthnandekar@gmail.com";
			int totalCost=0;
			for(BookingItem tempbookingItem: booking.getBookingItemList())
			{
				totalCost=tempbookingItem.getCost();
			}
			
			String message = "Hello "
					+ custEmailID
					+ ", \n \n "
					+ "Thank you for Booking :). \n\n\n "
					+ "Please find the booking details below \n\n"
					+ "Hotel Name :"+" "+hotel.getHotelName() +"\n\n"
					+ "Checkin Date :"+" "+finalCheckingDate+"\n\n"
					+ "Checkout Date :"+" "+finalCheckOutDate+"\n\n"
					+ "Booking Status :"+" "+"Confirmed"+"\n\n"
					+ "Total Cost :"+" "+totalCost+"\n\n"
					+ "\n\n\n"
					+"Enjoy your Time"
					+"Thanks";
					
			SendConfirmationEmail.sendMail(custEmailID, message);

		}
		mv.addObject("booking", booking);
		mv.addObject("bookingConfirmed", "yes");
		
		List allhotels=searchHotelDao.allActiveHotelList();
		mv.addObject("allhotels", allhotels);
		mv.setViewName("home");	
		
		return mv;
	
	}
	
	
	@RequestMapping(value="/showmyBooking.htm",method = RequestMethod.GET)
	public ModelAndView getMyBookingList(HttpServletRequest hsr) {
		
		ModelAndView mv=new ModelAndView();
		HttpSession session= hsr.getSession();
		String userName=(String)session.getAttribute("userName");
			
		//UserAddDao userAddDao= new UserAddDao();
		
		Customer customer=userAddDao.getCustomer(userName);
		System.out.println("List Size----->"+customer.getBookingList().size());
		mv.addObject("bookingList", customer.getBookingList());
		//Session session=hsr.getSession();
		session.setAttribute("customer", customer);
		mv.setViewName("AllBooking");
		
		return mv;
	}
		
	@RequestMapping(value="/getHotelNamesAsperSearch.htm",method = RequestMethod.POST)
	public ModelAndView getHotelListAsSearch(HttpServletRequest hsr,HttpServletResponse hsresponse) throws IOException, JSONException {
		
		ModelAndView mv=new ModelAndView();
		
		String searchName= hsr.getParameter("inputHotelName");
		
		//SearchHotelDao searchHotelDao= new SearchHotelDao();
		
		ArrayList<Hotel> HotelList=searchHotelDao.searchHotelAjax(searchName);
		
		PrintWriter out = hsresponse.getWriter();
		JSONObject obj = new JSONObject();
		
		String result = "<UL>";
		for (Hotel hotel : HotelList)   //new for loop
		{
			result += "<LI>" + hotel.getHotelName() + "</LI>";
			
		}
		result += "</UL>";
		obj.put("result",result); 
	    out.println(obj);
	
		return mv;
	}
	
	
	@RequestMapping(value="/cancelBooking.htm",method = RequestMethod.POST)
	public ModelAndView cancelBooking(HttpServletRequest hsr) throws IOException, JSONException {
		
		ModelAndView mv=new ModelAndView();
		
		String []searchName= hsr.getParameterValues("selectedValue");
		
		//RoomBookingDao roomBooking = new RoomBookingDao();
		
		roomBookingDao.cancelBooking(searchName);
		
		HttpSession session= hsr.getSession();
		String userName=(String)session.getAttribute("userName");
			
		//UserAddDao userAddDao= new UserAddDao();
		
		Customer customer=userAddDao.getCustomer(userName);
		System.out.println("List Size----->"+customer.getBookingList().size());
		mv.addObject("bookingList", customer.getBookingList());
		//Session session=hsr.getSession();
		session.setAttribute("customer", customer);
		mv.setViewName("AllBooking");
		
		return mv;
	}
		
	@RequestMapping(value="/showRequestDetails.htm",method = RequestMethod.GET)
	public ModelAndView showRequestDetails(HttpServletRequest hsr) throws IOException, JSONException {
		
		ModelAndView mv= new ModelAndView(); 
		String hotelID=hsr.getParameter("hotelID");
		System.out.println("Hotel ID value==>"+hotelID);
	
		
		//SearchHotelDao searchHotelDao=new SearchHotelDao();
		Hotel hotel= searchHotelDao.getHotel(hotelID);
		
		ModelAndView modelAndView = new ModelAndView();
		// for map location
		//"231 Park Drive,Boston ,Massachusetts, US,02215"
		String address=hotel.getStreetAddress()+","+hotel.getCity()+","+hotel.getState()+","+hotel.getCountry()+","+hotel.getPincode();
		AddressConverter addressConverter=new AddressConverter();
		String latitude=addressConverter.getLatitude(address);
		String longitude=addressConverter.getLongitude(address);
				
		System.out.println("latitude--sam test->"+latitude);
				
		System.out.println("longitude--->"+longitude);
		modelAndView.addObject("latitude",latitude);
		modelAndView.addObject("longitude",longitude);
		
		modelAndView.addObject("hotel",hotel);
		modelAndView.setViewName("IndividualHotelRequest");
		return modelAndView;
	}
	
	@RequestMapping(value="/viewselectedNewRequest.htm",method = RequestMethod.GET)
	public ModelAndView showselectedRequestDetailsToAdmin(HttpServletRequest hsr) throws IOException, JSONException {
		
		ModelAndView mv= new ModelAndView(); 
		String hotelID=hsr.getParameter("hotelID");
		System.out.println("Hotel ID value==>"+hotelID);
	
		
		//SearchHotelDao searchHotelDao=new SearchHotelDao();
		Hotel hotel= searchHotelDao.getHotel(hotelID);
		
		ModelAndView modelAndView = new ModelAndView();
		// for map location
		//"231 Park Drive,Boston ,Massachusetts, US,02215"
		String address=hotel.getStreetAddress()+","+hotel.getCity()+","+hotel.getState()+","+hotel.getCountry()+","+hotel.getPincode();
		AddressConverter addressConverter=new AddressConverter();
		String latitude=addressConverter.getLatitude(address);
		String longitude=addressConverter.getLongitude(address);
				
		System.out.println("latitude--sam test->"+latitude);
				
		System.out.println("longitude--->"+longitude);
		modelAndView.addObject("latitude",latitude);
		modelAndView.addObject("longitude",longitude);
		
		modelAndView.addObject("hotel",hotel);
		modelAndView.setViewName("IndividualHotelRequest");
		return modelAndView;
	
	}
	
	
	
	@RequestMapping(value="/hotelRequestDecisionByAdmin.htm",method = RequestMethod.POST)
	public ModelAndView hotelRequestDecisionByAdmin(HttpServletRequest hsr) throws IOException, JSONException {
		
		String adminAction=hsr.getParameter("myText");
		System.out.println("adminAction-->"+adminAction);
		String []strrequests=hsr.getParameterValues("selectedValue");
		
		//SearchHotelDao searchHotelDao = new SearchHotelDao();
		
		System.out.println("size--->"+strrequests.length);
		searchHotelDao.updateApprovedRequest(strrequests);
		
		List<HotelRequest> hotelRequestList=searchHotelDao.getNewRequestList();
		
		if(hotelRequestList!=null)
		{
			System.out.println("hotelRequestList admin size -->"+hotelRequestList.size());
		}
		else
		{
			System.out.println("hotelRequestList has null");
		}
		
		ModelAndView mv= new ModelAndView(); 
		String hotelID=hsr.getParameter("hotelID");
		System.out.println("Hotel ID value==>"+hotelID);
		mv.addObject("hotelRequestList",hotelRequestList);
		mv.setViewName("viewRequestToAdmin");
		return mv;
	}
	
	@RequestMapping(value="/viewAllRequestAdmin.htm",method = RequestMethod.GET)
	public ModelAndView viewAllRequestAdmin(HttpServletRequest hsr) throws IOException, JSONException {
		
		//SearchHotelDao searchHotelDao= new SearchHotelDao();
		
		    ModelAndView mv= new ModelAndView();
			HttpSession session= hsr.getSession();
			String userName=(String)session.getAttribute("userName");
			if(userName==null)
			{
				mv.setViewName("login");
				return mv;
			}
		
		ArrayList<HotelRequest>hotelRequestList=searchHotelDao.viewAllRequestAdmin();
		
		mv.addObject("hotelRequestList",hotelRequestList);
		mv.setViewName("ViewHotelRequest");
	   return mv;
	}
	
	@RequestMapping(value="/downloadPDFFile.htm")
	protected void downloadPDFFile(HttpServletRequest request,HttpServletResponse hsr) throws IOException, JSONException
	{
		String bookingID=request.getParameter("bookingID");
		System.out.println("bookingID---->"+bookingID);
		
		//RoomBookingDao roomBookingDao= new RoomBookingDao();
		Booking booking=roomBookingDao.getBooking(bookingID);
		
		PdfGenerator.generateBookingPDF(booking,hsr);
		
	}
	
	
	@RequestMapping(value="/changedPassword.htm")
	protected String changedPassword(HttpServletRequest request,HttpServletResponse hsr)
	{

		HttpSession session= request.getSession();
		String userName=(String)session.getAttribute("userName");
		if(userName==null)
		{
			return "login";
		}
		
		return "resetUserPassword";	
	}
	

	@RequestMapping(value="/resetUserPassword.htm",method = RequestMethod.POST)
	protected ModelAndView resetPassword(HttpServletRequest request,HttpServletResponse hsr)
	{
		String newPassword=request.getParameter("newPassword");

		HttpSession session= request.getSession();
		String userID=(String) session.getAttribute("userName");
		
		System.out.println("newPassword--->"+newPassword);
		System.out.println("userID--->"+userID);
		userAddDao.setUserPassword(userID,newPassword);
		
		ModelAndView mv=new ModelAndView();
		List allhotels=searchHotelDao.allActiveHotelList();
		mv.addObject("allhotels", allhotels);
		session.setAttribute("userName",userID);
		System.out.println("set user password, Done");
		mv.setViewName("home");	
		
		return mv;
		
	}
	
	@RequestMapping(value="/changedPasswordHotelOwner.htm")
	protected String changedPasswordHotelOw(HttpServletRequest request,HttpServletResponse hsr)
	{

		HttpSession session= request.getSession();
		String userName=(String)session.getAttribute("userName");
		
		if(userName==null)
		{
			return "login";
		}

		return "resetHotelOwnerPassword";	
	}
	
	@RequestMapping(value="/resethotelOwnerPassword.htm",method = RequestMethod.POST)
	protected ModelAndView resetPasswordHotelOwner(HttpServletRequest request,HttpServletResponse hsr)
	{
		String newPassword=request.getParameter("newPassword");

		HttpSession session= request.getSession();
		String userID=(String) session.getAttribute("userName");
		String comment=(String) session.getAttribute("comment");
		
		System.out.println("newPassword--->"+newPassword);
		System.out.println("userID--->"+userID);
		userAddDao.setUserPassword(userID,newPassword);
		ModelAndView mv= new ModelAndView();
		String showPage="firstformPage";
		mv.addObject("firstpage",showPage);
		mv.setViewName("AddHotelRequestHome");
		
		return mv;
		
	}
	
	@RequestMapping(value="/userFeedBack.htm",method = RequestMethod.POST)
	protected ModelAndView userFeedBack(HttpServletRequest request,HttpServletResponse hsr)
	{
		String rating=request.getParameter("rating");
		String satisfaction=request.getParameter("satisfaction");
	
		String emailID=request.getParameter("emailID");
		String comment=request.getParameter("comment");
		
		System.out.println("rating- "+ rating);
		System.out.println("rating -"+ satisfaction);
		System.out.println("rating -"+ emailID);
		System.out.println("rating -"+ comment);
		
		ModelAndView mv= new ModelAndView();
		
		mv.setViewName("ThankuForFeedback");
		
		return mv;
		
	}
	

}
