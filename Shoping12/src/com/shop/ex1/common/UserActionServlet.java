package com.shop.ex1.common;

import javax.servlet.ServletException;

import org.apache.ibatis.logging.LogFactory;
import org.apache.struts.action.ActionServlet;

public class UserActionServlet  extends ActionServlet{

	@Override
	public void init() throws ServletException {
		super.init();
		System.out.println("init()실행");
		LogFactory.useLog4JLogging();//myBatis에 log4j를 적용한다.
	}

	

}
