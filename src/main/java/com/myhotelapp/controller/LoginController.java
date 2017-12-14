package com.myhotelapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myhotelapp.dao.SearchHotelDao;
import com.myhotelapp.dao.UserAddDao;
import com.myhotelapp.pojo.UserAccount;



@Controller
@RequestMapping("/login.htm")
public class LoginController {
	
	@Autowired
	UserAddDao userAddDao;
	
    @Autowired
	SearchHotelDao searchHotelDao;
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView checkUserLogin(HttpServletRequest hsr) {

		ModelAndView mv = new ModelAndView();
		String userEmail=hsr.getParameter("emailId");
		String userPassword=hsr.getParameter("userPassword");
		
		UserAccount userAccount=userAddDao.checkUserNamePassword(userEmail);
		HttpSession session= hsr.getSession();
		if(userAccount!=null)
		{
		
		boolean isvalid=userAccount.getUserPassword().equals(userPassword);
		
		String currentUserRole=userAccount.getRole();
		if(isvalid)
		{
			
			if(currentUserRole.equals("Customer"))
			{
				//SearchHotelDao searchHotelDao= new SearchHotelDao();
				List allhotels=searchHotelDao.allActiveHotelList();
				
				System.out.println("found tables number-->"+allhotels.size());
				
				mv.addObject("allhotels", allhotels);
				mv.addObject("userName",userEmail);
				session.setAttribute("userName", userEmail);
				
				mv.setViewName("home");	
			}
			else if(currentUserRole.equals("HotelOwner"))
			{
				mv.addObject("userName",userEmail);
				session.setAttribute("userName", userEmail);
				String showPage="firstformPage";
				mv.addObject("firstpage",showPage);
				mv.setViewName("AddHotelRequestHome");
				
			}
			else if(currentUserRole.equalsIgnoreCase("Admin"))
			{
				mv.addObject("userName",userEmail);
				session.setAttribute("userName", userEmail);
				mv.setViewName("ViewAdminHomePage");
			}
			
			
		}

		else
		{
			mv.addObject("error","Please provide correct input");
			mv.setViewName("login");
			
		}
		
		}
		else
		{
			mv.addObject("error","user name is not registered, please create account");
			mv.setViewName("login");
			
		}
		
		return mv;
	}

	
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String initializeForm() {

		return "login";
	}
	

	
}
