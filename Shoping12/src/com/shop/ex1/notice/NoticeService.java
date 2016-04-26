package com.shop.ex1.notice;

import java.util.ArrayList;

public class NoticeService {
	NoticeDAO dao=new NoticeDAO();
	public ArrayList listNotice() throws Exception{
		ArrayList notiList = new ArrayList();
		notiList=dao.listNotice();
		
		return notiList;
		
	}

}
