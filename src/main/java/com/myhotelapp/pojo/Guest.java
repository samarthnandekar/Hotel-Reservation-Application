package com.myhotelapp.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="guest")
public class Guest {
	
	@Id
	@GeneratedValue
	private long guestNumber;
	
	@Column(name="firstName")
	private String firstName;
	
	@Column(name="lastName")
	private String lastName;
	
	@Column(name="age")
	private int age;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="booking")
	private Booking booking;

	Guest()
	{
		
	}
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public long getGuestNumber() {
		return guestNumber;
	}

	public void setGuestNumber(long guestNumber) {
		this.guestNumber = guestNumber;
	}
/*
	public Booking getBooking() {
		return booking;
	}

	public void setBooking(Booking booking) {
		this.booking = booking;
	}
*/

	
	
}
