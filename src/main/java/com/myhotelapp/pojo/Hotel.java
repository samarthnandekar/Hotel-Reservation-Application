package com.myhotelapp.pojo;


import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;



@Entity
@Table(name="hotel")
public class Hotel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "hotelId", unique=true, nullable = false)
	private int hotelID;
	
	@Column(name="hotelName")
	private String hotelName;
	
	@Column(name="hotelInformation")
	private String hotelInformation;
	
	@Column(name="primaryContactName")
	private String primaryContactName;
	
	@Column(name="primaryContactNumber")
	private String primaryContactNumber;
	
	@Column(name="hotellevel")
	private int hotellevel=0;
	
	@Column(name="hotelShortDecription")
	private String hotelShortDecription;
	
	@Column(name="hotelrating")
	private int hotelrating=0;
	
	@Column(name="isHotelActive")
	private String isHotelActive="No";

	@Column(name="streetAddress")
	private String streetAddress;
	
	@Column(name="pincode")
	private int pincode=0;
	
	@Column(name="city")
	private String city;
	
	@Column(name="state")
	private String state;
	
	@Column(name="country")
	private String country;	
	
//	@Column(name="price")
//	private String price;
//	
	
	@Column(name="numbersOFRooms")
	private int numbersOFRooms;
	
	@Column(name="imagePath")
	private String imgName;
	
	@Transient
	private MultipartFile photo;
	
	
	@OneToMany(fetch=FetchType.EAGER,mappedBy="hotel",cascade=CascadeType.ALL)
	private Set<Room> listOfroom=new HashSet<Room>();
	
	
	@OneToMany(fetch=FetchType.EAGER,mappedBy="hotel",cascade=CascadeType.ALL)
	private Set<RatingByPeople> listOfRating=new HashSet<RatingByPeople>();
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy="hotel",cascade=CascadeType.ALL)
	private Set<Booking> bookingList = new HashSet<Booking>();
	
	
	@OneToMany(mappedBy="hotel", cascade=CascadeType.ALL)
	List<HotelImages> hotelImages;
	
	
	public int getHotelID() {
		return hotelID;
	}

	public void setHotelID(int hotelID) {
		this.hotelID = hotelID;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public String getHotelInformation() {
		return hotelInformation;
	}

	public void setHotelInformation(String hotelInformation) {
		this.hotelInformation = hotelInformation;
	}

	public String getPrimaryContactName() {
		return primaryContactName;
	}
	

	public int getHotelrating() {
		return hotelrating;
	}

	public void setHotelrating(int hotelrating) {
		this.hotelrating = hotelrating;
	}

	public int getHotellevel() {
		return hotellevel;
	}

	public void setHotellevel(int hotellevel) {
		this.hotellevel = hotellevel;
	}

	public String getHotelShortDecription() {
		return hotelShortDecription;
	}

	public void setHotelShortDecription(String hotelShortDecription) {
		this.hotelShortDecription = hotelShortDecription;
	}
	
	public Set<Booking> getBookingList() {
		return bookingList;
	}

	public void setBookingList(Set<Booking> bookingList) {
		this.bookingList = bookingList;
	}


	public Set<RatingByPeople> getListOfRating() {
		return listOfRating;
	}

	public void setListOfRating(Set<RatingByPeople> listOfRating) {
		this.listOfRating = listOfRating;
	}

	public Set<Room> getListOfroom() {
		return listOfroom;
	}

	public void setListOfroom(Set<Room> listOfroom) {
		this.listOfroom = listOfroom;
	}

	
	public int getNumbersOFRooms() {
		return numbersOFRooms;
	}

	public void setNumbersOFRooms(int numbersOFRooms) {
		this.numbersOFRooms = numbersOFRooms;
	}

	public void setPrimaryContactName(String primaryContactName) {
		this.primaryContactName = primaryContactName;
	}

	public String getPrimaryContactNumber() {
		return primaryContactNumber;
	}

	public void setPrimaryContactNumber(String primaryContactNumber) {
		this.primaryContactNumber = primaryContactNumber;
	}

	public String getIsHotelActive() {
		return isHotelActive;
	}

	public void setIsHotelActive(String isHotelActive) {
		this.isHotelActive = isHotelActive;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public List<HotelImages> getHotelImages() {
		return hotelImages;
	}

	public void setHotelImages(List<HotelImages> hotelImages) {
		this.hotelImages = hotelImages;
	}

//	public String getPrice() {
//		return price;
//	}
//
//	public void setPrice(String price) {
//		this.price = price;
//	}
//
//	
	
	

}
