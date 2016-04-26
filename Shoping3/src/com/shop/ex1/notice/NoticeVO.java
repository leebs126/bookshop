package com.shop.ex1.notice;

import java.sql.Date;

public class NoticeVO {
	private String nId;
	private String nTitle;
	private String nContents;
	private Date creDate;
	private String id;
	public NoticeVO() {
		super();
	}
	public String getnId() {
		return nId;
	}
	public void setnId(String nId) {
		this.nId = nId;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnContents() {
		return nContents;
	}
	public void setnContents(String nContents) {
		this.nContents = nContents;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getCreDate() {
		return creDate;
	}
	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}
	
	
	
	

}
