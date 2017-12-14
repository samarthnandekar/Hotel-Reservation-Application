package com.myhotelapp.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class HotelSearchInterseptor extends HandlerInterceptorAdapter {
	
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		System.out.println("-------------------------------");
		String name = request.getParameter("searchGoingto");
		
		if (name != null) {
			name = name.replaceAll("<", "& lt;").replaceAll(">", "& gt;");
			name = name.replaceAll("\\(", "& #40;").replaceAll("\\)", "& #41;");
			name = name.replaceAll("'", "");
			
			name = name.replaceAll("script", "");			
			request.getSession().setAttribute("searchGoingto", name);
			
			System.out.println("-------------------------------");
		}		
		return true;
	}

}
