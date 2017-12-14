package com.myhotelapp.pojo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="Customer")
@PrimaryKeyJoinColumn(name="personID")
public class Customer extends Person{
	
	
	public Customer()
	{
		
	}
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy="customer")
	private Set<Booking> bookingList = new HashSet<Booking>();


	public Set<Booking> getBookingList() {
		return bookingList;
	}


	public void setBookingList(Set<Booking> bookingList) {
		this.bookingList = bookingList;
	}
	
}
