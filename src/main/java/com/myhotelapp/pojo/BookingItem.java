package com.myhotelapp.pojo;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="bookingItem")
public class BookingItem {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "bookingItemId", unique=true, nullable = false)
	private long bookingItemId;
	
	@OneToOne
	@JoinColumn(name="room")
	private Room room;
	
	@Column(name="bStartDate")
	private Date bStartDate;
	
	@Column(name="bEndDate")
	private Date bEndDate;
	
	@Column(name="cancelDate")
	private Date cancelDate;
	
	@Column(name="noOfPeople")
	private int noOfPeople;
	
	@Column(name="bookingStatus")
	private String bookingStatus;
	
	@Column(name="numberOfDays")
	private int numberOfDays;
	
	@Column(name="cost")
	private int cost;
	
	@ManyToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="booking")
	private Booking booking;

	public long getBookingItemId() {
		return bookingItemId;
	}

	public void setBookingItemId(long bookingItemId) {
		this.bookingItemId = bookingItemId;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public Date getbStartDate() {
		return bStartDate;
	}

	public void setbStartDate(Date bStartDate) {
		this.bStartDate = bStartDate;
	}

	public Date getbEndDate() {
		return bEndDate;
	}

	public void setbEndDate(Date bEndDate) {
		this.bEndDate = bEndDate;
	}

	public Date getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(Date cancelDate) {
		this.cancelDate = cancelDate;
	}

	public int getNoOfPeople() {
		return noOfPeople;
	}

	public void setNoOfPeople(int noOfPeople) {
		this.noOfPeople = noOfPeople;
	}

	public String getBookingStatus() {
		return bookingStatus;
	}

	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
	}

	public int getNumberOfDays() {
		return numberOfDays;
	}

	public void setNumberOfDays(int numberOfDays) {
		this.numberOfDays = numberOfDays;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public Booking getBooking() {
		return booking;
	}

	public void setBooking(Booking booking) {
		this.booking = booking;
	}
	

	
	/*
	@OneToMany(fetch=FetchType.LAZY,mappedBy="booking")
	private Set<Guest> guestList = new HashSet<Guest>();
	*/
	
	
	


}
