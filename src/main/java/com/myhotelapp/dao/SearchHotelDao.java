package com.myhotelapp.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.myhotelapp.pojo.BookingItem;
import com.myhotelapp.pojo.Customer;
import com.myhotelapp.pojo.Hotel;
import com.myhotelapp.pojo.HotelOwner;
import com.myhotelapp.pojo.HotelRequest;
import com.myhotelapp.pojo.Room;

public class SearchHotelDao extends Dao{

	
	public ArrayList<Hotel> searchHotel(String sreachedName,String checkinDate, String checkoutDate)
	{
		ArrayList searchList= new ArrayList<Hotel>();
		try{
			begin();
			/*
			 * 
			 
			Query q=getSession().createQuery("from Hotel as h where h.isHotelActive=:active and h.hotelName like :title or h.city=:input");
			String searchHotelname="%"+ sreachedName+"%";
			q.setString("title",searchHotelname);
			q.setString("input", sreachedName);
			q.setString("active","yes");
			*/
			Query q=getSession().createQuery("from Hotel");
			searchList=(ArrayList<Hotel>)q.list();
			commit();
			char c='a';
			int i=c;
			
		}
		
		catch (HibernateException e) {
	        rollback();
	        //throw new AdException("Could not create user " + username, e);
	        System.out.println("Exception while creating Hotel: " + e.getMessage());
	    }
	
		
		return searchList;
	}
	
	public Hotel getHotel(String hotelID)
	{
		Hotel hotel=null;
		try{
			begin();
			Query q=getSession().createQuery("from Hotel as h where h.hotelID="+hotelID);
			
			//Integer hotelid=Integer.parseInt(hotelID);
			//q.setInteger(":title",hotelid);
			
			hotel=(Hotel)q.uniqueResult();
			//commit();
		}
		catch (HibernateException e) {
	        rollback();
	        //throw new AdException("Could not create user " + username, e);
	        System.out.println("Exception while creating Hotel: " + e.getMessage());
	    }
		
		return hotel;
	}
	
	public ArrayList<Hotel> getRegisteredHotelList()
	{
		ArrayList<Hotel> hotelList=null;
		try
		{
			begin();
			Query q=getSession().createQuery("from Hotel");
			hotelList=(ArrayList<Hotel>)q.list();
		}
		catch(HibernateException e)
		{
			rollback();	
			System.out.println("Exception while creating Hotel: " + e.getMessage());
		}
		
		return hotelList;
	}
	
	public Room getRoom(String hotelID,String roomNumber)
	{
		Room room=null;
		try{
			begin();
			Query q=getSession().createQuery("from Room as r where r.hotel.hotelID=:hotelID and r.roomNumber=:roomno");
			
			//Integer hotelid=Integer.parseInt(hotelID);
			Integer intHotelID=Integer.parseInt(hotelID);
			Integer introomID=Integer.parseInt(roomNumber);
			q.setInteger("hotelID",intHotelID);
			q.setInteger("roomno", introomID);
						
			room=(Room)q.uniqueResult();
			commit();
		}
		catch (HibernateException e) {
	        rollback();
	        //throw new AdException("Could not create user " + username, e);
	        System.out.println("Exception while getting room: " + e.getMessage());
	    }
		
		return room;
	}
	
	public ArrayList<Hotel> searchHotelAjax(String sreachedName)
	{
		ArrayList<Hotel> searchList= new ArrayList<Hotel>();
		try{
			begin();
			Query q=getSession().createQuery("from Hotel as h where h.hotelName like :title");
			String searchHotelname="%"+ sreachedName+"%";
			q.setString("title",searchHotelname);
			searchList=(ArrayList<Hotel>)q.list();
			commit();
		}
		
		catch (HibernateException e) {
	        rollback();
	        //throw new AdException("Could not create user " + username, e);
	        System.out.println("Exception while creating Hotel: " + e.getMessage());
	    }
	
		
		return searchList;
	}
	
	public ArrayList<Hotel> allActiveHotelList()
	{
		ArrayList<Hotel> hotelList=null;
		try
		{
			begin();
			Query q=getSession().createQuery("from Hotel as h where h.isHotelActive=:active");
			q.setString("active","yes");
			hotelList=(ArrayList<Hotel>)q.list();
		}
		catch(HibernateException e)
		{
			rollback();	
			System.out.println("Exception while creating Hotel: " + e.getMessage());
		}
		
		return hotelList;
	}
	
	public ArrayList<HotelRequest> getRequestList(HotelOwner hotelOwner)
	{
		
		ArrayList<HotelRequest> hotelRequestList= new ArrayList<HotelRequest>();
		try{
			begin();
			Query q=getSession().createQuery("from HotelRequest as hr where hr.hotelOwner=:hotelOwner");
			//String searchHotelname="%"+ sreachedName+"%";
			q.setEntity("hotelOwner",hotelOwner);
			hotelRequestList=(ArrayList<HotelRequest>)q.list();
			//commit();
		}
		
		catch (HibernateException e) {
	        rollback();
	        //throw new AdException("Could not create user " + username, e);
	        System.out.println("Exception while creating Hotel: " + e.getMessage());
	    }
		
		return hotelRequestList;
	}
	
	public ArrayList<HotelRequest> getNewRequestList()
	{
		
		ArrayList<HotelRequest> hotelRequestList= new ArrayList<HotelRequest>();
		try{
			begin();
			String requestStatus="Under Review";
			Query q=getSession().createQuery("from HotelRequest as hr where hr.requestStatus=:requestStatus");
			q.setString("requestStatus",requestStatus);
			hotelRequestList=(ArrayList<HotelRequest>)q.list();
			//commit();
		}
		
		catch (HibernateException e) {
	        rollback();
	        //throw new AdException("Could not create user " + username, e);
	        System.out.println("Exception while creating Hotel: " + e.getMessage());
	    }
		
		return hotelRequestList;
	}
	
	public void updateApprovedRequest(String []strrequests)
	{
		try{
			begin();
			System.out.println("inside the updateApproveRequest");
			System.out.println("strrequests size--->"+strrequests.length);
			for(String str:strrequests)
			{
				Query q=getSession().createQuery("from HotelRequest as hr where hr.hotelRequestId=:hotelRequestId");
				q.setString("hotelRequestId",str);
				System.out.println("updateApprovedRequest 1.2");
				HotelRequest hotelRequest=(HotelRequest)q.uniqueResult();
				System.out.println("updateApprovedRequest 1.3");
				//commit();	
				hotelRequest.setRequestStatus("Approved");
				System.out.println("updateApprovedRequest 1.4");
				getSession().update(hotelRequest);
				System.out.println("updateApprovedRequest 1.5");
			}
			commit();
			System.out.println("inside the updateApproveRequest commit");
		}
		
		catch (HibernateException e) {
	        rollback();
	        //throw new AdException("Could not create user " + username, e);
	        System.out.println("Exception while creating Hotel: " + e.getMessage());
	    }
	
	}
	
	public ArrayList<HotelRequest> viewAllRequestAdmin()
	{
		ArrayList<HotelRequest> hotelRequestList= new ArrayList<HotelRequest>();
		try{
			begin();
			
				Query q=getSession().createQuery("from HotelRequest as hr where hr.requestStatus !=:requestStatus");
				String requestStatus="Under Review";
				q.setString("requestStatus",requestStatus);
				
				hotelRequestList=(ArrayList<HotelRequest>)q.list();	
		}
		
		catch (HibernateException e) {
	        rollback();
	        //throw new AdException("Could not create user " + username, e);
	        System.out.println("Exception while creating Hotel: " + e.getMessage());
	    }
		return hotelRequestList;
	}
	
	public Hotel getAvailableRoom(String hotelID, String checkinDate, String checkoutDate) throws ParseException
	{
		
		ArrayList<Room> hotelRoomList= new ArrayList<Room>();
		Hotel hotel=null;
		try{
			begin();
			Query q=getSession().createQuery("from Hotel as h where h.hotelID="+hotelID);
			
			hotel=(Hotel)q.uniqueResult();
			
			q=getSession().createQuery("from Room as r where r.hotel=:hotelID");
			q.setString("hotelID",hotelID);
			hotelRoomList=(ArrayList<Room>)q.list();
			
			
			// for date formate
			SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
			Date finalCheckingDate=null;
			
			finalCheckingDate = formatter.parse(checkinDate);
			
            Calendar c = Calendar.getInstance(); 
            c.setTime(finalCheckingDate); 
            c.add(Calendar.HOUR, 9);
            finalCheckingDate = c.getTime();
            System.out.println("bStartDate--->"+finalCheckingDate);
            
            /*
			q=getSession().createQuery("from BookingItem as bi where bi.bStartDate=:checkinDate");
			q.setDate("checkinDate",finalCheckingDate);
			ArrayList<BookingItem>bookingItemlist=(ArrayList<BookingItem>) q.list();
			
            
            */
             
             
            //get the checkin Date and remove the room from list
			Criteria crit=getSession().createCriteria(BookingItem.class);
	        Criteria roomCrit=crit.createCriteria("room");
	        crit.add(Restrictions.eq("bStartDate",finalCheckingDate));
	        crit.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
	        List<BookingItem> bookingItemlist=crit.list();
	        
	        for(BookingItem bookingItem: bookingItemlist){
	        	
	        	System.out.println("Room number->"+bookingItem.getRoom().getRoomID());
	        	long strRoomID=bookingItem.getRoom().getRoomID();
	        	q=getSession().createQuery("From Room as r where r.roomID=:strRoomID");
	        	q.setLong("strRoomID", strRoomID);
	        	Room room=(Room)q.uniqueResult();
	        	hotelRoomList.remove(room);
	        }
	     
			
	        Set<Room> availRoomSet=new HashSet<Room>();
			for(Room room:hotelRoomList)
			{
				availRoomSet.add(room);
			}
			System.out.println("------end function-------");
			hotel.setListOfroom(availRoomSet);
			
		}
		catch (HibernateException e) {
	        rollback();
	        //throw new AdException("Could not create user " + username, e);
	        System.out.println("Exception message " + e.getMessage());
	    }
		
		return hotel;
		
	}
	
	public List<Hotel> getHotelSAccordingtoSelectedValue(String values)
	{
	List<Hotel> hotelList=new ArrayList<Hotel>();
	
	try{
		begin();
		System.out.println("values---->"+values);
		if(values.length()==1)
		{
			System.out.println("inside lenght one");
			Query q=getSession().createQuery("select hotelID,hotelName,imgName From Hotel as h where h.isHotelActive=:active and h.hotellevel=:selectedhotellevel");
			q.setString("selectedhotellevel",values);
			q.setString("active","yes");
			hotelList=q.list();
		}
		else if(values.length()==3)
		{
			System.out.println("inside lenght second");
			String values1=""+values.charAt(0);
			int indexof=values.indexOf(",");
			String values2=values.substring(indexof+1, values.length());
			System.out.println("values1---"+values1);
			System.out.println("values2---"+values2);
			
			Query q=getSession().createQuery("select hotelID,hotelName,imgName From Hotel as h where h.isHotelActive=:active and h.hotellevel=:selectedhotellevel1 or h.hotellevel=:selectedhotellevel2");
			q.setString("selectedhotellevel1",values1);
			q.setString("selectedhotellevel2",values2);
			q.setString("active","yes");
			hotelList=q.list();
		}
		else if(values.length()==5)
		{
			System.out.println("inside lenght third");
			String values1=""+values.charAt(0);
			int indexof=values.indexOf(",");
			int lastindex=values.lastIndexOf(",");
			System.out.println("values1---"+values1);
			
			String values2=values.substring(indexof+1,lastindex);
			
			System.out.println("values2---"+values2  +"\n"+"--Last index value--"+lastindex);
			
			String values3=values.substring(lastindex+1, values.length());
	
			System.out.println("values3---"+values3);
			
			Query q=getSession().createQuery("select hotelID,hotelName,imgName From Hotel as h where h.isHotelActive=:active and h.hotellevel=:selectedhotellevel1 or h.hotellevel=:selectedhotellevel2 or h.hotellevel=:selectedhotellevel3");
			q.setString("selectedhotellevel1",values1);
			q.setString("selectedhotellevel2",values2);
			q.setString("selectedhotellevel3",values3);
			q.setString("active","yes");
			hotelList=q.list();
		}
		else if(values.length()==7)
		{
			System.out.println("------------inside lenght four---------------");
			Query q=getSession().createQuery("select hotelID,hotelName,imgName From Hotel as h where h.isHotelActive=:active and h.hotellevel=:selectedhotellevel1 or h.hotellevel=:selectedhotellevel2 or h.hotellevel=:selectedhotellevel3 or h.hotellevel=:selectedhotellevel4");
			String values1=""+values.charAt(0);
			q.setString("active","yes");
			System.out.println("values1---"+values1);
			
			int indexof=values.indexOf(",");
			String values2=values.substring(indexof+1,indexof+2);
			System.out.println("values2---"+values2);
			
			int lastindex=values.lastIndexOf(",");
			String values3=values.substring(indexof+3, lastindex);
			
			System.out.println("values3---"+values3);
			
			String values4=values.substring(lastindex+1, values.length());
			
			System.out.println("values4---"+values4);
			
			q.setString("selectedhotellevel1",values1);
			q.setString("selectedhotellevel2",values2);
			q.setString("selectedhotellevel3",values3);
			q.setString("selectedhotellevel4",values4);
			hotelList=q.list();
		}
		else if(values.length()==9)
		{
			Query q=getSession().createQuery("select hotelID,hotelName,imgName From Hotel as h where h.isHotelActive=:active");
			q.setString("active","yes");
			hotelList=q.list();
		}
		
	}
	
	catch (HibernateException e) {
        rollback();
        //throw new AdException("Could not create user " + username, e);
        System.out.println("Exception while creating Hotel: " + e.getMessage());
    }
	
		return hotelList;
	}
	
}
