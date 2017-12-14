package com.myhotelapp.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="RatingByPeople")
public class RatingByPeople {
	
	
	@Id
	@GeneratedValue
	private long ratingID;
	
	/*
	@Column
	private Customer givenBy;
	
	*/
	@Column(name="ratingGivenDate")
	private String ratingGivenDate;
	
	@Column(name="comment")
	private String comment;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="hotel")
	private Hotel hotel;
	
	
	public RatingByPeople() {
		
	}



	public String getRatingGivenDate() {
		return ratingGivenDate;
	}

	public void setRatingGivenDate(String ratingGivenDate) {
		this.ratingGivenDate = ratingGivenDate;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}



	public long getRatingID() {
		return ratingID;
	}



	public void setRatingID(long ratingID) {
		this.ratingID = ratingID;
	}

/*

	public Customer getGivenBy() {
		return givenBy;
	}



	public void setGivenBy(Customer givenBy) {
		this.givenBy = givenBy;
	}


*/
	public Hotel getHotel() {
		return hotel;
	}



	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
	
	
	
}
