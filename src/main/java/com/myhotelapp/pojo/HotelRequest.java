package com.myhotelapp.pojo;

import java.util.Date;

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

import org.springframework.aop.aspectj.AspectJAdviceParameterNameDiscoverer.AmbiguousBindingException;

@Entity
@Table(name="hotelRequest")
public class HotelRequest {
	
	@Id
	@GeneratedValue
	@Column(name = "hotelRequestId", unique=true, nullable = false)
	private long hotelRequestId;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="hotelID")
	private Hotel hotel;
	
	@ManyToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="hotelOwner")
	private HotelOwner hotelOwner;
	
	@ManyToOne
	@JoinColumn(name="adminUser")
	private AdminUser adminUser;
	
	@Column(name="requestRaisedDate")
	private Date requestRaisedDate;
	
	@Column(name="requestApprovedDate")
	private Date requestApprovedDate;
	
	@Column(name="requestStatus")
	private String requestStatus="Under Review";
	
	@Column(name="CommentByUser")
	private String CommentByUser;
	
	@Column(name="CommentByAdmin")
	private String CommentByAdmin;

	public long getHotelRequestId() {
		return hotelRequestId;
	}

	public void setHotelRequestId(long hotelRequestId) {
		this.hotelRequestId = hotelRequestId;
	}


	public HotelOwner getHotelOwner() {
		return hotelOwner;
	}

	public void setHotelOwner(HotelOwner hotelOwner) {
		this.hotelOwner = hotelOwner;
	}

	public Date getRequestRaisedDate() {
		return requestRaisedDate;
	}

	public void setRequestRaisedDate(Date requestRaisedDate) {
		this.requestRaisedDate = requestRaisedDate;
	}

	public Date getRequestApprovedDate() {
		return requestApprovedDate;
	}

	public void setRequestApprovedDate(Date requestApprovedDate) {
		this.requestApprovedDate = requestApprovedDate;
	}

	public String getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}

	public String getCommentByUser() {
		return CommentByUser;
	}

	public void setCommentByUser(String commentByUser) {
		CommentByUser = commentByUser;
	}

	public String getCommentByAdmin() {
		return CommentByAdmin;
	}

	public void setCommentByAdmin(String commentByAdmin) {
		CommentByAdmin = commentByAdmin;
	}

	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}

	public AdminUser getAdminUser() {
		return adminUser;
	}

	public void setAdminUser(AdminUser adminUser) {
		this.adminUser = adminUser;
	}

	
	
	

}
