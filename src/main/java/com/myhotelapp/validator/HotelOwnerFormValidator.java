package com.myhotelapp.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.myhotelapp.pojo.HotelOwner;

public class HotelOwnerFormValidator implements Validator{

	@Override
	public boolean supports(Class aclazz) {
		
		return aclazz.equals(HotelOwner.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		//System.out.println(target.toString()+"------------------------");
		HotelOwner hotelOwner=(HotelOwner)target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "error.invalid.user", "First Name Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "error.invalid.user", "Last Name Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "error.invalid.user", "User Name Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userPassword", "error.invalid.userPassword", "Password Required");
	}

}
