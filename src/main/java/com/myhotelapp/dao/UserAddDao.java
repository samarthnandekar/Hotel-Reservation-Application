package com.myhotelapp.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.stereotype.Component;

import com.myhotelapp.exception.AdException;
import com.myhotelapp.pojo.AdminUser;
import com.myhotelapp.pojo.Customer;
import com.myhotelapp.pojo.HotelOwner;
import com.myhotelapp.pojo.Person;
import com.myhotelapp.pojo.UserAccount;


public class UserAddDao extends Dao {

	public UserAddDao() {
		
	}
	
    public Person create(String firstName,String lastName,String mobileNumber,String emailId,String password)
            throws AdException {
        try {
            begin();
            System.out.println("inside DAO");
            
            //Email email=new Email(emailId);
            Customer customer= new Customer();
            
           
            customer.setFirstName(firstName);
            customer.setLastName(lastName);
            UserAccount userAccount=new UserAccount();
            userAccount.setEmail(emailId);
            userAccount.setUserPassword(password);
            customer.setUserAccount(userAccount);
            customer.setMobileNumber(mobileNumber);
            
            customer.setUserAccount(userAccount);
            userAccount.setPerson(customer);
            System.out.println("Mobile Number==>"+mobileNumber);
            customer.getUserAccount().setRole("Customer");
            
            getSession().save(customer);
            
            commit();
            return customer;
        } catch (HibernateException e) {
            rollback();
            //throw new AdException("Could not create user " + username, e);
            throw new AdException("Exception while creating user: " + e.getMessage());
        }
    }
    
    
    public Person createHotelOwner(String firstName,String lastName,String mobileNumber,String emailId,String password)
            throws AdException {
        try {
            begin();
            System.out.println("inside DAO");
            
            //Email email=new Email(emailId);
            HotelOwner hotelOwner= new HotelOwner();
            
           
            hotelOwner.setFirstName(firstName);
            hotelOwner.setLastName(lastName);
            UserAccount userAccount=new UserAccount();
            userAccount.setEmail(emailId);
            userAccount.setUserPassword(password);
            hotelOwner.setUserAccount(userAccount);
            hotelOwner.setMobileNumber(mobileNumber);
            hotelOwner.setUserAccount(userAccount);
            
            userAccount.setPerson(hotelOwner);
            System.out.println("Mobile Number==>"+mobileNumber);
            hotelOwner.getUserAccount().setRole("HotelOwner");
            
            getSession().save(hotelOwner);
            
            commit();
            return hotelOwner;
        } catch (HibernateException e) {
            rollback();
            //throw new AdException("Could not create user " + username, e);
            throw new AdException("Exception while creating user: " + e.getMessage());
        }
    }
  
    public ArrayList<UserAccount> userList()
    {
    	System.out.println("--inside array List---");
    	begin();
    	System.out.println("--after begin 1.2---");
        Query q = getSession().createQuery("from UserAccount");
        ArrayList<UserAccount> userlist = (ArrayList<UserAccount>)q.list();
        commit();
        return userlist;
    }
 
    
    public UserAccount checkUserNamePassword(String userEmail)
    {
    	begin();
        Query q = getSession().createQuery("from UserAccount where email=:inputEmail");
        
        q.setString("inputEmail",userEmail);
        UserAccount userAccount=(UserAccount)q.uniqueResult();
        //System.out.println("user password-->"+password);
        //System.out.println("sasasa--->"+userAccount.getEmail());
        //System.out.println("User role--->"+userAccount.getRole());
        
        return userAccount;
    }
    
    public ArrayList<Person> personList()
    {
    	System.out.println("--inside array person List---");
    	begin();
    	System.out.println("--after begin 1.2---");
        Query q = getSession().createQuery("from Person");
        ArrayList<Person> personlist = (ArrayList<Person>)q.list();
        //commit();
        return personlist;
    }
     
    public Customer getCustomer(String emailId)
    {
    	begin();
    	System.out.println("User Email ID-->"+emailId);
    	Query q = getSession().createQuery("from Customer where userAccount.email=:userEmail");
    	q.setString("userEmail",emailId);
    	Customer customer= (Customer)q.uniqueResult();
    	System.out.println("list Size-->"+customer.getBookingList().size());
    
    	return customer;
    }
    
    public HotelOwner getHotelowner(String emailId)
    {
    	begin();
    	System.out.println("User Email ID-->"+emailId);
    	Query q = getSession().createQuery("from HotelOwner where userAccount.email=:userEmail");
    	q.setString("userEmail",emailId);
    	HotelOwner hotelOwner= (HotelOwner)q.uniqueResult();
    	System.out.println("list Size-->"+hotelOwner.getRequestList().size());
    
    	return hotelOwner;
    }
    
    public AdminUser getAdminAccount()
    {
    	begin();
    	System.out.println("User Email ID-->");
    	Query q = getSession().createQuery("from AdminUser");
    	//q.setString("userEmail",emailId);
    	AdminUser adminUser=null;
    	ArrayList <AdminUser>adminUserlist= (ArrayList<AdminUser>)q.list();
    	for(AdminUser ad: adminUserlist)
    	{
    		
    		adminUser=ad;
    		break;
    	}
    	
    	return adminUser;
    }
   
    
    public void createAdmin(AdminUser adminUser,String emailId) 
    {
    	try
    	{
    
    	begin();
    	
    	Query q = getSession().createQuery("from AdminUser where userAccount.email=:emailId");
    	q.setString("emailId",emailId);
    	AdminUser checkadminUser= (AdminUser)q.uniqueResult();
    	
    	if(checkadminUser==null)
    	{
    		getSession().save(adminUser);
    	}
    	
    	commit();
		
    	}
    	catch (HibernateException e) {
            rollback();
            //throw new AdException("Could not create user " + username, e);
            System.out.println("Exception while creating user: " + e.getMessage());
        }
    }
    
    public void setUserPassword(String userID,String newPassword)
    {
    	begin();
    	Query q = getSession().createQuery("from UserAccount as ua where ua.email=:emailId");
    	q.setString("emailId",userID);
    	UserAccount userAccount= (UserAccount)q.uniqueResult();
    	
    	userAccount.setUserPassword(newPassword);
    	getSession().update(userAccount);
    	commit();
    }
}
