package com.shop.ex1.common;

import javax.servlet.ServletException;

import org.apache.ibatis.logging.LogFactory;
import org.apache.struts.action.ActionServlet;

public class UserActionServlet  extends ActionServlet{

	@Override
	public void init() throws ServletException {
		super.init();
		System.out.println("init()����");
		LogFactory.useLog4JLogging();//myBatis�� log4j�� �����Ѵ�.
	}

	

}
