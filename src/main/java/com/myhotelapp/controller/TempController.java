package com.myhotelapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/AddHotelRequestHome.htm")
public class TempController {

	@RequestMapping(method = RequestMethod.GET)
	public String checkTemp()
	{
		return "AddHotelRequestHome";
	}
	
	
}
