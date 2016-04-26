package com.shop.ex1.notice;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeDAO {
	private DataSource dataFactory;
	
	public NoticeDAO(){
		try{
			Context ctx=new InitialContext();
			dataFactory=(DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ArrayList list(){
		ArrayList list=new ArrayList();
		try{
			Connection con=dataFactory.getConnection();
			Statement stmt=con.createStatement();
			
			String query="select * from t_Notice";
			System.out.println(query);
			ResultSet rs=stmt.executeQuery(query);
			
			while(rs.next()){
				String nId=rs.getString("nId");
				String nTitle=rs.getString("nTitle");
				String nContents=rs.getString("nContents");
				Date creDate=rs.getDate("creDate");
				String id=rs.getString("id");
				
				
				NoticeVO notice=new NoticeVO();
				notice.setId(id);
				notice.setnTitle(nTitle);
				notice.setnContents(nContents);
				notice.setCreDate(creDate);
				notice.setId(id);
				list.add(notice);
			}
			
			rs.close();
			stmt.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

}

