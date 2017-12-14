package com.myhotelapp.pojo;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="room")
public class Room {
	
	@Id
	@GeneratedValue
	private long roomID;
	
	@Column(name="roomNumner")
	private int roomNumber;
	
	@Column(name="peopleCapacity")
	private int peopleCapacity;
	
	@ManyToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="hotelID")
	private Hotel hotel;
	
	@Column(name="price")
	private int price;
	
	@Column(name="airConditioner")
	private String airConditioner="No";
	
	@Column(name="wifiAvailable")
	private String wifiAvailable="No";
	
	@Column(name="airPortShuttle")
	private String airPortShuttle="No";
	
	@Column(name="breakFase")
	private String breakFase="No";
	
	@Column(name="lunch")
	private String lunch="No";
	
	@Column(name="dinner")
	private String dinner="No";
	
	@Column(name="freeParking")
	private String freeParking="No";

	@Column(name="roomimageName")
	private String roomimageName;
	
	@Transient
	private MultipartFile roomimage;
	
	public Room() {
		
	}
	
	public int getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}

	public int getPeopleCapacity() {
		return peopleCapacity;
	}

	public void setPeopleCapacity(int peopleCapacity) {
		this.peopleCapacity = peopleCapacity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getAirConditioner() {
		return airConditioner;
	}

	public void setAirConditioner(String airConditioner) {
		this.airConditioner = airConditioner;
	}

	public String getWifiAvailable() {
		return wifiAvailable;
	}

	public void setWifiAvailable(String wifiAvailable) {
		this.wifiAvailable = wifiAvailable;
	}

	public String getAirPortShuttle() {
		return airPortShuttle;
	}

	public void setAirPortShuttle(String airPortShuttle) {
		this.airPortShuttle = airPortShuttle;
	}

	public String getBreakFase() {
		return breakFase;
	}

	public void setBreakFase(String breakFase) {
		this.breakFase = breakFase;
	}

	public String getLunch() {
		return lunch;
	}

	public void setLunch(String lunch) {
		this.lunch = lunch;
	}

	public String getDinner() {
		return dinner;
	}

	public void setDinner(String dinner) {
		this.dinner = dinner;
	}

	public String getFreeParking() {
		return freeParking;
	}

	public void setFreeParking(String freeParking) {
		this.freeParking = freeParking;
	}

	public long getRoomID() {
		return roomID;
	}

	public void setRoomID(long roomID) {
		this.roomID = roomID;
	}

	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}

	public String getRoomimageName() {
		return roomimageName;
	}

	public void setRoomimageName(String roomimageName) {
		this.roomimageName = roomimageName;
	}

	public MultipartFile getRoomimage() {
		return roomimage;
	}

	public void setRoomimage(MultipartFile roomimage) {
		this.roomimage = roomimage;
	}



}
