package com.myhotelapp.dao;

import java.util.ArrayList;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.myhotelapp.pojo.Booking;
import com.myhotelapp.pojo.BookingItem;
import com.myhotelapp.pojo.Hotel;
import com.myhotelapp.pojo.HotelOwner;

public class RoomBookingDao extends Dao{

	public RoomBookingDao()
	{
		
	}
	
	public boolean saveBooking(Booking booking)
	{
		boolean isbooked=false;
		try{
			begin();
			getSession().saveOrUpdate(booking);
            System.out.println("Booking Saved ");
            commit();
            close();
            isbooked=true;
		}
		catch (HibernateException e) {
	        rollback();
	        isbooked=false;
	        //throw new AdException("Could not create user " + username, e);
	        System.out.println("Exception while creating Hotel: " + e.getMessage());
	    }
		finally {
			close();
		}
		return isbooked;
	}
	
	public boolean cancelBooking(String [] selectedValues)
	{
		try{
		
		for(String id:selectedValues)
		{
			
			begin();
			Query q=getSession().createQuery("from Booking as b where b.bookingID=:title");
			
			int intID=Integer.parseInt(id);
			q.setInteger("title",intID);
			
			Booking booking=(Booking)q.uniqueResult();
			
			for(BookingItem bi:booking.getBookingItemList())
			{
				bi.setBookingStatus("Cancelled");
			}
			getSession().update(booking);
				
		
		commit();
		}
		}
		catch (HibernateException e) {
	        rollback();
	        //throw new AdException("Could not create user " + username, e);
	        System.out.println("Exception while creating Hotel: " + e.getMessage());
	    }
		finally {
			close();
		}
		
		return true;
		
	}
	
	public Booking getBooking(String bookingId)
	{
		Booking booking= new Booking();
		try{
			
			begin();
			Query q=getSession().createQuery("from Booking as b where b.bookingID=:bookingId");
			
			int intID=Integer.parseInt(bookingId);
			q.setInteger("bookingId",intID);
			
			booking=(Booking)q.uniqueResult();
			
		
		}
		catch (HibernateException e) {
	        rollback();
	        //throw new AdException("Could not create user " + username, e);
	        System.out.println("Exception while creating Hotel: " + e.getMessage());
	    }
		finally {
			close();
		}
		
		return booking;
		
	}
	
	
	
	
}
