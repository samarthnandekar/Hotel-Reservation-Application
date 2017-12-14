package com.myhotelapp.validator;


import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.myhotelapp.pojo.Customer;


import org.springframework.validation.ValidationUtils;

@Component
public class UserValidator implements Validator {

    public boolean supports(Class aClass)
    {
        return aClass.equals(Customer.class);
    }

    public void validate(Object obj, Errors errors)
    {
        Customer user = (Customer) obj;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "error.invalid.user", "First Name Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "error.invalid.user", "Last Name Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userAccount.email", "error.invalid.user", "User Name Required");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userAccount.userPassword", "error.invalid.userPassword", "Password Required");
        //ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email.emailId", "error.invalid.email.emailId", "Email Required");
    }
}
