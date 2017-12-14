package com.myhotelapp.dao;

import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.myhotelapp.exception.AdException;
import com.myhotelapp.pojo.Hotel;
import com.myhotelapp.pojo.HotelRequest;

public class AddHotelDao extends Dao{
	
	public AddHotelDao() {
		// TODO Auto-generated constructor stub
	}
	
	public Hotel addhotelInformation(Hotel hotel)
	{
		try{
		begin();
		System.out.print("lenght-->"+hotel.getListOfroom().size());
		
		getSession().save(hotel);
        
        commit();
        
    } catch (HibernateException e) {
        rollback();
        //throw new AdException("Could not create user " + username, e);
        System.out.println("Exception while creating Hotel: " + e.getMessage());
    }

		return hotel;
	}
	
	public void updateHotelInformation(int hotelId,String hotelName,String hotelInformation,String primaryContactName,String primaryContactNumber,int intHotellevel,int intHotelRating,String isHotelActive,int intNumberOfRooms)
	{
		
		try{
			begin();
			Query q=getSession().createQuery("from Hotel as h where h.hotelID=:hotelID");
			q.setInteger("hotelID", hotelId);
			Hotel hotel=(Hotel)q.uniqueResult();
			hotel.setHotelName(hotelName);
			hotel.setHotelInformation(hotelInformation);
			hotel.setPrimaryContactName(primaryContactName);
			hotel.setPrimaryContactNumber(primaryContactNumber);
			hotel.setIsHotelActive(isHotelActive);
			hotel.setHotellevel(intHotellevel);
			hotel.setHotelrating(intHotelRating);
			
			getSession().update(hotel);
	        
	        commit();
		}
		catch(HibernateException e)
		{
			System.out.println("Exception while creating Hotel: " + e.getMessage());
		}
	}
	
	public void savedRequest(HotelRequest hotelRequest)
	{
		
		try{
			begin();					
			getSession().save(hotelRequest);
	        
	        commit();
		}
		catch(HibernateException e)
		{
			System.out.println("Exception while creating Hotel: " + e.getMessage());
		}
	}

}
