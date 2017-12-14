package com.myhotelapp.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myhotelapp.dao.UserAddDao;
import com.myhotelapp.pojo.AdminUser;
import com.myhotelapp.pojo.Customer;
import com.myhotelapp.pojo.UserAccount;
import com.myhotelapp.validator.UserValidator;



@Controller
@RequestMapping("/signup.htm")
public class SignUpController {
	
	@Autowired
	
	@Qualifier("userValidator")
	UserValidator validator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}
	
	
	@Autowired
	UserAddDao userAddDao;
	 
	@RequestMapping(method = RequestMethod.POST)
	protected String doSubmitAction(@ModelAttribute("customer") Customer customer, BindingResult result) throws Exception {

		
		validator.validate(customer, result);
		if (result.hasErrors()) {
			return "signup";
		}
		
		
		try {
			System.out.print("test");
			System.out.print("after userAddDao test1");
			UserAddDao userAddDao = new UserAddDao();
			userAddDao.create(customer.getFirstName(), customer.getLastName(),customer.getMobileNumber(),customer.getUserAccount().getEmail(), customer.getUserAccount().getUserPassword());
			
			

			// Create Admin Account
			AdminUser adminUser= new AdminUser();
			adminUser.setFirstName("Admin");
			adminUser.setLastName("Last");
				
			adminUser.setMobileNumber("121221");
			
			UserAccount ua= new UserAccount();
			
			ua.setEmail("adminsamarthnandekar@gmail.com");
			ua.setRole("admin");
			ua.setUserPassword("admin");
			
			adminUser.setUserAccount(ua);
			ua.setPerson(adminUser);
			
			
			userAddDao.createAdmin(adminUser,"adminsamarthnandekar@gmail.com");
			// end of Admin creation
			
			
			// DAO.close();
		} catch (Exception e) {
			System.out.println("Exception: " + e.getMessage());
		}

		return "home";
	}

	@RequestMapping(method = RequestMethod.GET)
	public String initializeForm(@ModelAttribute("customer") Customer customer, BindingResult result) {


		return "signup";
	}

	@RequestMapping(value="/checkValidEmail.htm")
	public void checkValiduserID()
	{
		System.out.print("inside the check valid methos");
		
	}
	
	
}


