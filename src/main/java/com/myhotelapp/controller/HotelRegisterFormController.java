package com.myhotelapp.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myhotelapp.dao.AddHotelDao;
import com.myhotelapp.dao.SearchHotelDao;
import com.myhotelapp.dao.UserAddDao;
import com.myhotelapp.pojo.AdminUser;
import com.myhotelapp.pojo.Customer;
import com.myhotelapp.pojo.Hotel;
import com.myhotelapp.pojo.HotelOwner;
import com.myhotelapp.pojo.HotelRequest;
import com.myhotelapp.pojo.Room;

import com.myhotelapp.validator.HotelFormValidator;
import com.myhotelapp.validator.RoomformValidation;
import com.myhotelapp.validator.UserValidator;

@Controller
//@RequestMapping("/hotelRegisterForm.htm")
public class HotelRegisterFormController {
	
	@Autowired
	UserAddDao userAddDao;
	
	@Autowired
	AddHotelDao addHotelDao;
	
	@Autowired
	SearchHotelDao searchHotelDao;
	
	@Autowired
	
	@Qualifier("hotelFormValidator")
	HotelFormValidator validator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}
	
	@RequestMapping(value="/hotelRegisterFormMain.htm", method = RequestMethod.POST)
	public ModelAndView doSubmitAction(@ModelAttribute("hotel") Hotel hotel, BindingResult result,HttpServletRequest hsr)throws Exception
	{
		
		System.out.println("photos count-->"+hotel);
		File file;
		validator.validate(hotel, result);
		ModelAndView mv= new ModelAndView();
		if(result.hasErrors())
		{
			mv.setViewName("AddHotelRequestHome");
		}
		
		System.out.println("Check data in Hotel from hotel object-->"+hotel.getHotelName());
		
		String hotelName=hsr.getParameter("hotelName");
		//String path="C:\\Users\\samar\\Documents\\workspace-sts-3.7.3.RELEASE\\WebToolsProjectFinal\\src\\main\\webapp\\resources\\";
		
		// for aws server
		String path="C:\\Users\\Administrator\\Documents\\apache-tomcat-8.5.11-windows-x64\\apache-tomcat-8.5.11\\webapps\\WebToolsProjectFinal\\resources\\";
		
		String individualPath=path+hotelName;
		
		File folder = new File(individualPath);
		
		 if (!folder.exists()) {
             if (folder.mkdir()) {
                 System.out.println("Directory is created!");
             } else {
                 System.out.println("Failed to create directory!");
             }
         }
		
		// code for image
		if(hotel.getPhoto()!=null)       
        {
			String fileNameWithExt=System.currentTimeMillis()+hotel.getPhoto().getOriginalFilename();
			String individualPath_1=individualPath+"\\";
			file= new File(individualPath_1 + fileNameWithExt);
            hotel.getPhoto().transferTo(file);
            hotel.setImgName("resources"+"/"+hotelName+"/"+fileNameWithExt);
			
        }

		String showPage="secondpage";
		HttpSession session= hsr.getSession();
		session.setAttribute("hotelObject", hotel);
		
		
		mv.addObject("imagePath", individualPath);
		mv.addObject("firstpage",showPage);
		mv.addObject("hotel", hotel);
		mv.setViewName("AddHotelRequestHome");
		return mv;
	}
	
	
	
		
	@RequestMapping(value="/savehotelindb.htm", method = RequestMethod.POST)
	public ModelAndView saveRoomsDetails(HttpServletRequest hsr)
	{
		ModelAndView mv= new ModelAndView();
		HttpSession session= hsr.getSession();
		Hotel hotel=(Hotel)session.getAttribute("hotelObject");
		
		String userName= (String)session.getAttribute("userName");
		
		// get hotelOwer profile
		//UserAddDao userAddDao= new UserAddDao();
		HotelOwner hotelOwner=userAddDao.getHotelowner(userName);
		
		
		// code to get Admin profile
		AdminUser adminUser=userAddDao.getAdminAccount();
		
		
		// code to save hotel obj in db
		//AddHotelDao addHotelDao= new AddHotelDao();
		//addHotelDao.addhotelInformation(hotel);
		
		// create new hotel request and save in Db
		HotelRequest hotelRequest= new HotelRequest();
		hotelRequest.setHotel(hotel);
		hotelRequest.setAdminUser(adminUser);
		Date date= new Date();
		hotelRequest.setRequestRaisedDate(date);
		hotelRequest.setHotelOwner(hotelOwner);
		
		addHotelDao.savedRequest(hotelRequest);
		String showPage="firstformPage";
		
		mv.addObject("firstpage",showPage);
		mv.setViewName("AddHotelRequestHome");
		return mv;
		
	}
	
	@RequestMapping(value="/newRequestPlace.htm", method = RequestMethod.GET)
	public ModelAndView viewHotelRequest()
	{
		ModelAndView mv= new ModelAndView();
		//mv.addObject("userName",userEmail);
		String showPage="firstformPage";
		mv.addObject("firstpage",showPage);
		mv.setViewName("AddHotelRequestHome");
		
		return mv;
	}
	
	@RequestMapping(value="/viewPlacedRequest.htm", method = RequestMethod.GET)
	public ModelAndView viewHotelplacedRequest(HttpServletRequest hsr)
	{
		ModelAndView mv= new ModelAndView();
		
		//HttpSession session= hsr.getSession();
		
		//String currentUserName=hsr.getParameter("userEmail");
		
		HttpSession session=hsr.getSession();
 		String currentUserName=(String)session.getAttribute("userName");
 		
 		if(currentUserName==null)
 		{
 			mv.setViewName("login");
 			return mv;
 		}
		
		//UserAddDao userAddDao=new UserAddDao();
		HotelOwner hotelOwner= userAddDao.getHotelowner(currentUserName);
		
		SearchHotelDao searchHotelDao= new SearchHotelDao();
		List<HotelRequest> hotelRequestList=searchHotelDao.getRequestList(hotelOwner);
		
		
		System.out.println("hotelRequestList size-->"+hotelRequestList.size());
		//String showPage="firstformPage";
		mv.addObject("hotelRequestList",hotelRequestList);
		mv.setViewName("ViewHotelRequestHotelOwner");
		
		return mv;
	}
	
	@RequestMapping(value="/viewNewRequest.htm", method = RequestMethod.GET)
	public ModelAndView viewnewHotelRequestToAdmin(HttpServletRequest hsr)
	{
		ModelAndView mv= new ModelAndView();
		
		HttpSession session= hsr.getSession();
		String userName=(String)session.getAttribute("userName");
		if(userName==null)
		{
			mv.setViewName("login");
			
			return mv;	
		}

		//SearchHotelDao searchHotelDao= new SearchHotelDao();
		List<HotelRequest> hotelRequestList=searchHotelDao.getNewRequestList();
		
		System.out.println("hotelRequestList admin size -->"+hotelRequestList.size());
		mv.addObject("hotelRequestList",hotelRequestList);
		mv.setViewName("viewRequestToAdmin");
		
		return mv;
	}

}
