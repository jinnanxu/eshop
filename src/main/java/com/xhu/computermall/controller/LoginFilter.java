package com.xhu.computermall.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.annotation.Order;

//@Order规定多个Filter的执行顺序,按照从小到大执行()中的值
@Order(1)
//@WebFilter过滤对应的请求路径
@WebFilter(urlPatterns = {"/profile", "/orderScenic", "/orderProduct", "/orderHotel", "/saveOrder", "/myorders", "/publishComment"},filterName = "loginFilter")
public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		String uri = req.getRequestURI();
		if(uri.contains("admin")) {
			chain.doFilter(request, response);
		}else {
			Object obj = req.getSession().getAttribute("currUser");
			if(obj == null) {
				HttpServletResponse resp = (HttpServletResponse) response;
				System.out.println("未登录拦截");
				resp.sendRedirect("/music/tologin");
			}else {
				chain.doFilter(request, response);
			}
		}
	}

}
