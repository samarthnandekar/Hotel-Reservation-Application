package com.myhotelapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/hotelDetails.htm")
public class HotelDetailsController {
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String getDatestr()
	{
		System.out.println("sassa");
		return("displayHotelDetails");
	}

}
