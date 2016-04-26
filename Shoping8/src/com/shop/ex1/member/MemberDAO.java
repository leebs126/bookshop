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
	
	public MemberVO findMember(MemberVO memberVO) throws Exception{
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();
		String _member_id=memberVO.getMember_id();
		String _member_pw=memberVO.getMember_pw();
		
		String query="select * from t_shoping_member where"
				+ " member_id='"+_member_id+"'"
				+" and member_pw='"+_member_pw+"'";
		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);
		
		while (rs.next()) {
			String member_name=rs.getString("member_name");
			String tel1=rs.getString("tel1");
			String tel2=rs.getString("tel2");
			String tel3=rs.getString("tel3");
			
			String hp1=rs.getString("hp1");
			String hp2=rs.getString("hp2");
			String hp3=rs.getString("hp3");
			
			String email1=rs.getString("email1");
			String email2=rs.getString("email2");
			
			String zipcode=rs.getString("zipcode");
			String roadAddress=rs.getString("roadAddress");
			String jibunAddress=rs.getString("jibunAddress");
			String namujiAddress=rs.getString("namujiAddress");
			
			memberVO.setMember_name(member_name);
			memberVO.setTel1(tel1);
			memberVO.setTel2(tel2);
			memberVO.setTel3(tel3);
			
			memberVO.setHp1(hp1);
			memberVO.setHp2(hp2);
			memberVO.setHp3(hp3);
			memberVO.setEmail1(email1);
			memberVO.setEmail2(email2);
			
			
			memberVO.setZipcode(zipcode);
			memberVO.setRoadAddress(roadAddress);
			memberVO.setJibunAddress(jibunAddress);
			memberVO.setNamujiAddress(namujiAddress);
		}
		
		return memberVO;
		
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

