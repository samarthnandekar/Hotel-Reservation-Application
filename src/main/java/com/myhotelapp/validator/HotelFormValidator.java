package com.myhotelapp.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.myhotelapp.pojo.Hotel;


public class HotelFormValidator implements Validator {
	
	 public boolean supports(Class aClass)
	    {
	        return aClass.equals(Hotel.class);
	    }

	@Override
	public void validate(Object obj, Errors errors) {
		Hotel hotel = (Hotel) obj;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "hotelName", "error.invalid.hotel", "First Name Required");
		
	}

}
