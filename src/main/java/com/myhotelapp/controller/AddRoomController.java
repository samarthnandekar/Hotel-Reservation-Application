package com.myhotelapp.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myhotelapp.pojo.Hotel;
import com.myhotelapp.pojo.Room;
import com.myhotelapp.validator.RoomformValidation;

@Controller
public class AddRoomController {

	@Qualifier("roomformValidation")
	RoomformValidation roomvalidator;

	@InitBinder
	private void initBinder1(WebDataBinder roombinder) {
		roombinder.setValidator(roomvalidator);
	}	
	
	@RequestMapping(value="/hotelRegisterroom.htm", method = RequestMethod.POST)
	public ModelAndView addRoom(@ModelAttribute("room") Room room, BindingResult result,HttpServletRequest hsr) throws IllegalStateException, IOException
	{
		String showPage;
		ModelAndView mv= new ModelAndView();
		HttpSession session= hsr.getSession();
		File file;
		String formComplete=hsr.getParameter("useraction");
		String strimagepath=hsr.getParameter("imagePath");
		System.out.println(strimagepath);
		System.out.println("formComplete---"+formComplete);
		
		int lastindex=strimagepath.lastIndexOf("\\");
		String hotelName=strimagepath.substring(lastindex+1);
		
		System.out.println("hotelName-->"+hotelName);
		
		String finalstrimagepath=strimagepath+"\\";
		if(room.getRoomimage()!=null)       
        {
			String fileNameWithExt=System.currentTimeMillis()+room.getRoomimage().getOriginalFilename();
			
			file= new File(finalstrimagepath+fileNameWithExt);
            room.getRoomimage().transferTo(file);
            room.setRoomimageName("resources"+"/"+hotelName+"/"+fileNameWithExt);	
        }
		
		
		String roomNumber=hsr.getParameter("roomNumber");
		
		String peopleCapacity=hsr.getParameter("peopleCapacity");
		String price=hsr.getParameter("price");
		
		String []roomfacilites=hsr.getParameterValues("roomfacilities");
		
		
		room.setRoomNumber(Integer.parseInt(roomNumber));
		room.setPeopleCapacity(Integer.parseInt(peopleCapacity));
		room.setPrice(Integer.parseInt(price));
		
		if(roomfacilites!=null)
		{
		for(String s:roomfacilites)
		{
			System.out.println(s);
			if(s.equalsIgnoreCase("airConditioner"))
				room.setAirConditioner("yes");
			else if(s.equalsIgnoreCase("wifiAvailable"))
				room.setWifiAvailable("yes");
			else if(s.equalsIgnoreCase("airPortShuttle"))
				room.setAirPortShuttle("yes");
			else if(s.equalsIgnoreCase("breakFase"))
				room.setBreakFase("yes");
			else if(s.equalsIgnoreCase("lunch"))
				room.setLunch("yes");
			else if(s.equalsIgnoreCase("dinner"))
				room.setLunch("yes");
			else if(s.equalsIgnoreCase("freeParking"))
				room.setFreeParking("yes");
						
		}
		}
		Hotel hotel=(Hotel)session.getAttribute("hotelObject");
		hotel.getListOfroom().add(room);
		room.setHotel(hotel);
		// code to save object in database
		//AddHotelDao addHotelDao= new AddHotelDao();
		//addHotelDao.addhotelInformation(hotel);
		
		showPage="secondpage";
		mv.setViewName("AddHotelRequestHome");
		
		if(formComplete.equals("formCompleted"))
		{
			showPage="LastPage";	
		}
		
		mv.addObject("imagePath",strimagepath);
		mv.addObject("firstpage",showPage);
		session.setAttribute("hotelObject", hotel);
				
		mv.addObject("hotel", hotel);
		return mv;
	}

}
