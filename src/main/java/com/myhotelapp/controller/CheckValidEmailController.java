package com.myhotelapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myhotelapp.dao.UserAddDao;
import com.myhotelapp.pojo.Customer;
import com.myhotelapp.pojo.UserAccount;

@Controller
@RequestMapping("/checkValidEmail.htm")
public class CheckValidEmailController {
	
	@Autowired
	UserAddDao userAddDao;
	
	@RequestMapping(method = RequestMethod.POST)
	protected void checkUserEmailID(HttpServletRequest request,HttpServletResponse hsr) throws IOException, JSONException
	{
	System.out.println("in side echeck email id");	
	
	JSONObject obj = new JSONObject();
	//UserAddDao userAddDao= new UserAddDao();
	
	ArrayList<UserAccount> userAccountList=(ArrayList<UserAccount>)userAddDao.userList();
	
	boolean isvalidEmailId=false;
	for(UserAccount userAccount: userAccountList)
	{
	System.out.println(" emila values:-->"+userAccount.getEmail());	
	
	String enterEmail=request.getParameter("emailId");
	System.out.println("entered email-->"+enterEmail);
	
	System.out.println(enterEmail.equals(userAccount.getEmail()));
	
	if(enterEmail.equals(userAccount.getEmail()))
	{
		isvalidEmailId=false;
	    break;
	}
	else
	{
		isvalidEmailId=true;
		
	}
	
	}
	obj.put("isvalidEmailId",isvalidEmailId);
	PrintWriter out = hsr.getWriter();
    out.println(obj);
    
	System.out.println("after ajax call");
	}
	
	
}
