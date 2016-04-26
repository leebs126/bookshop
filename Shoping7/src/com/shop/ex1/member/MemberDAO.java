package com.shop.ex1.member;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private DataSource dataFactory;

	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean isUserJoined(MemberVO memberVO) throws Exception{
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();
		String member_id=memberVO.getMember_id();
		String member_pw=memberVO.getMember_pw();
		
		String query="select count(member_id) from t_shoping_member where"
				+ " member_id='"+member_id+"'"
				+" and member_pw='"+member_pw+"'";
		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		int  count=rs.getInt(1);
		
		if(count>=1)
			return true;
		else 
			return false;
		
	}
	
	public void addMember(MemberVO memberVO) throws Exception{
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();
		
		String query = "insert into t_shoping_member (MEMBER_ID,"
				 									  +"Member_pw,"
			                                          +"Member_NAME,"
			                                          +"MEMBER_GENDER,"
			                                          +"MEMBER_BIRTH_y,"
			                                          +"MEMBER_BIRTH_m,"
			                                          +"MEMBER_BIRTH_d,"
			                                          +"MEMBER_BIRTH_gn,"
			                                          +"TEL1,"
			                                          +"TEL2,"
			                                          +"TEL3,"
			                                          +"HP1,"
			                                          +"HP2,"
			                                          +"HP3,"
			                                          +"SMSSTS_YN,"
			                                          +"EMAIL1,"
			                                          + "EMAIL2,"
			                                          + "EMAILSTS_YN,"
			                                          + "ZIPCODE,"
			                                          + "ROADADDRESS,"
			                                          + "JIBUNADDRESS,"
			                                          + "NAMUJIADDRESS)";
		                                          
		        query+=" values('"+  
		        		memberVO.getMember_id()+"','"+
		        		memberVO.getMember_pw()+"','"+
		        		memberVO.getMember_name()+"','"+
		        		memberVO.getMember_gender()+"','"+
		        		memberVO.getMember_birth_y()+"','"+
		        		memberVO.getMember_birth_m()+"','"+
		        		memberVO.getMember_birth_d()+"','"+
		        		memberVO.getMember_birth_gn()+"','"+
		        		memberVO.getTel1()+"','"+
		        		memberVO.getTel2()+"','"+
		        		memberVO.getTel3()+"','"+
		        		memberVO.getHp1()+"','"+
		        		memberVO.getHp2()+"','"+
		        		memberVO.getHp3()+"','"+
		        		memberVO.getSmsSts_yn()+"','"+
		        		memberVO.getEmail1()+"','"+
		        		memberVO.getEmail2()+"','"+
		        		memberVO.getEmailSts_yn()+"','"+
		        		memberVO.getZipcode()+"','"+
		        		memberVO.getRoadAddress()+"','"+
		        		memberVO.getJibunAddress()+"','"+
		        		memberVO.getNamujiAddress()+"')";
		        		
		System.out.println(query);
		stmt.executeUpdate(query);
	}

}
