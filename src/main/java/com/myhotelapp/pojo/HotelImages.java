package com.myhotelapp.pojo;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name="Hotelimages")
public class HotelImages {
	
	@Id
	@GeneratedValue
	private long HotelImageID;
	
	@Column(name="hotelImages")
	private String hotelImages;
	
	@OneToOne
	@JoinColumn(name = "hotelId")
	private Hotel hotel;
	
	

	public long getHotelImageID() {
		return HotelImageID;
	}

	public void setHotelImageID(long hotelImageID) {
		HotelImageID = hotelImageID;
	}


	public String getHotelImages() {
		return hotelImages;
	}

	public void setHotelImages(String hotelImages) {
		this.hotelImages = hotelImages;
	}

	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}

	
	
	
}
