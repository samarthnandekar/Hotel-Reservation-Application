package com.myhotelapp.pojo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import com.myhotelapp.dao.UserAddDao;

@Entity
@Table(name="adminUser")
@PrimaryKeyJoinColumn(name="personID")
public class AdminUser extends Person{
	
	public AdminUser()
	{
		
	}
	
	@OneToMany(mappedBy="adminUser",cascade=CascadeType.ALL)
	private Set<HotelRequest> hotelRequestList = new HashSet<HotelRequest>();

	public Set<HotelRequest> getHotelRequestList() {
		return hotelRequestList;
	}

	public void setHotelRequestList(Set<HotelRequest> hotelRequestList) {
		this.hotelRequestList = hotelRequestList;
	}

}
