package com.myhotelapp.pojo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="hotelOwner")
@PrimaryKeyJoinColumn(name="personID")
public class HotelOwner extends Person{
	
	public HotelOwner()
	{
		
	}
	
	@OneToMany(fetch=FetchType.EAGER,mappedBy="hotelOwner",cascade=CascadeType.ALL)
	private Set<HotelRequest> requestList = new HashSet<HotelRequest>();

	public Set<HotelRequest> getRequestList() {
		return requestList;
	}

	public void setRequestList(Set<HotelRequest> requestList) {
		this.requestList = requestList;
	}

	
	
	

}
