package com.myhotelapp.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.myhotelapp.pojo.Hotel;
import com.myhotelapp.pojo.Room;

public class RoomformValidation implements Validator{

	@Override
	public boolean supports(Class aclazz) {
		
		return aclazz.equals(Room.class);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		// TODO Auto-generated method stub
		
		Room room = (Room) obj;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "roomNumber", "error.invalid.room", "Room number Required");
		
	}
	
	

}
