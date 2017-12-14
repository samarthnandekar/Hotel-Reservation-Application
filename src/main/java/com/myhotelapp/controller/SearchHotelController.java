package com.myhotelapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myhotelapp.dao.SearchHotelDao;
import com.myhotelapp.maplocations.AddressConverter;
import com.myhotelapp.pojo.Hotel;
import com.myhotelapp.pojo.Room;

@Controller
public class SearchHotelController {

	@Autowired
	SearchHotelDao searchHotelDao;
	
	@RequestMapping(value="/userSeach.htm",method=RequestMethod.GET)
	public ModelAndView initializeForm(HttpServletRequest hrs,HttpSession session) {
		
		ModelAndView mv= new ModelAndView(); 
		

		HttpSession session1= hrs.getSession();
		String userName=(String)session1.getAttribute("userName");
		
		if(userName==null)
		{
			mv.setViewName("login");
			return mv;
		}
		
		String searchedName = (String) session.getAttribute("searchGoingto");
		//String searchedName=hrs.getParameter("searchGoingto");
		String checkInDate=hrs.getParameter("checkinDate");
		String checkoutDate=hrs.getParameter("checkOutDate");
		
		System.out.println("searchedName----->"+searchedName);
		//SearchHotelDao searchHotelDao=new SearchHotelDao();
		
		ArrayList searchResultList=searchHotelDao.searchHotel(searchedName,checkInDate,checkoutDate);
		mv.addObject("checkInDate",checkInDate);
		mv.addObject("checkoutDate",checkoutDate);
		mv.addObject("searchResultList",searchResultList);
		mv.addObject("userName",userName);
		mv.setViewName("displayHotelDetails");
		return mv;
	}

	
	@RequestMapping(value="/individualHotelDetails.htm",method=RequestMethod.GET)
	public ModelAndView IndividualHotelresult(HttpServletRequest hrs) {
		
		ModelAndView mv= new ModelAndView(); 
		
		//  check user login

		HttpSession session= hrs.getSession();

		String userName=(String)session.getAttribute("userName");
		if(userName==null)
		{
			mv.setViewName("login");
			return mv;	
		}
		
		
		String hotelID=hrs.getParameter("hotelID");
		
		System.out.println("Hotel ID value==>"+hotelID);
		
		String checkinDate=hrs.getParameter("checkinDate");
		String checkoutDate=hrs.getParameter("checkoutDate");
		
		//SearchHotelDao searchHotelDao=new SearchHotelDao();
		Hotel hotel= searchHotelDao.getHotel(hotelID);
		
		//
		System.out.println("hotel.getHotelImages().size()-->"+hotel.getHotelImages().size());
		
		
		// for map location
		
		String address=hotel.getStreetAddress()+","+hotel.getCity()+","+hotel.getState()+","+hotel.getCountry()+","+hotel.getPincode();
		AddressConverter addressConverter=new AddressConverter();
		String latitude=addressConverter.getLatitude(address);
		String longitude=addressConverter.getLongitude(address);
		
		System.out.println("latitude--->"+latitude);
		System.out.println("longitude--->"+longitude);
		
		mv.addObject("latitude", latitude);
		mv.addObject("longitude", longitude);
		
		mv.addObject("checkinDate", checkinDate);
		mv.addObject("checkoutDate", checkoutDate);
		mv.addObject("hotel",hotel);
		mv.setViewName("individualHotelDetails");
		return mv;
		
	}
	
	@RequestMapping(value="/searchRoominsideOneHotel.htm",method=RequestMethod.GET)
	public ModelAndView searchRoominsideOneHotel(HttpServletRequest hrs) throws ParseException
		{
			ModelAndView mv= new ModelAndView();
			
			String checkIndate=hrs.getParameter("checkin");
			String checkoutdate=hrs.getParameter("checkout");
			String hotelID=hrs.getParameter("hotelIDforSearch");
			
			System.out.println("checkin  -->"+checkIndate);
			System.out.println("checkoutdate  -->"+checkoutdate);
			System.out.println("hotelID  -->"+hotelID);
			
			Hotel hotel=searchHotelDao.getAvailableRoom(hotelID,checkIndate,checkoutdate);
			
			String isRoomavailable="yes";
			if(hotel.getListOfroom().size()==0)
				isRoomavailable="No";
					
			
			mv.addObject("isRoomavailable", isRoomavailable);
			mv.addObject("hotel",hotel);
			mv.setViewName("individualHotelDetails");
			
		return mv;
		}
	
	@RequestMapping(value="/getHotelFilteredValue.htm",method=RequestMethod.POST)
	public void getHotelFilteredValue(HttpServletRequest hrs, HttpServletResponse hsr) throws ParseException, JSONException, IOException
		{
			///ModelAndView mv= new ModelAndView();
			List<Hotel> searchResultList= new ArrayList();
			String selectedvals=hrs.getParameter("selectedValues");
			System.out.println("checkIndate--->"+selectedvals);
			
			searchResultList=searchHotelDao.getHotelSAccordingtoSelectedValue(selectedvals);
			
			JSONObject obj = new JSONObject();
			obj.put("hotelList",searchResultList);
			PrintWriter out = hsr.getWriter();
		    out.println(obj); 
			
		}
	
}
