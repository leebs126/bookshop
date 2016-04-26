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
	
	public MemberVO findMember(MemberVO _memberVO) throws Exception{
		MemberVO memberVO=new MemberVO();
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();
		String _member_id=_memberVO.getMember_id();
		String _member_pw=_memberVO.getMember_pw();
		
		String query="select * from t_shoping_member where"
				+ " member_id='"+_member_id+"'"
				+" and member_pw='"+_member_pw+"'";
		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);
		
		while (rs.next()) {
			String member_id=rs.getString("member_id");
			String member_pw=rs.getString("member_pw");
			String member_name=rs.getString("member_name");
			String member_gender=rs.getString("member_gender");
			String tel1=rs.getString("tel1");
			String tel2=rs.getString("tel2");
			String tel3=rs.getString("tel3");
			
			String hp1=rs.getString("hp1");
			String hp2=rs.getString("hp2");
			String hp3=rs.getString("hp3");
			String smsSts_yn=rs.getString("smsSts_yn");
			
			String email1=rs.getString("email1");
			String email2=rs.getString("email2");
			String emailSts_yn=rs.getString("emailsts_yn");
			
			String zipcode=rs.getString("zipcode");
			String roadAddress=rs.getString("roadAddress");
			String jibunAddress=rs.getString("jibunAddress");
			String namujiAddress=rs.getString("namujiAddress");
			
			String member_birth_y=rs.getString("member_birth_y");
			String member_birth_m=rs.getString("member_birth_m");
			String member_birth_d=rs.getString("member_birth_d");
			String member_birth_gn=rs.getString("member_birth_gn");
			
			memberVO.setMember_id(member_id);
			memberVO.setMember_pw(member_pw);
			memberVO.setMember_name(member_name);
			memberVO.setMember_gender(member_gender);
			memberVO.setTel1(tel1);
			memberVO.setTel2(tel2);
			memberVO.setTel3(tel3);
			memberVO.setSmsSts_yn(smsSts_yn);
			
			memberVO.setHp1(hp1);
			memberVO.setHp2(hp2);
			memberVO.setHp3(hp3);
			memberVO.setEmail1(email1);
			memberVO.setEmail2(email2);
			memberVO.setEmailSts_yn(emailSts_yn);
			
			memberVO.setZipcode(zipcode);
			memberVO.setRoadAddress(roadAddress);
			memberVO.setJibunAddress(jibunAddress);
			memberVO.setNamujiAddress(namujiAddress);
			
			memberVO.setMember_birth_y(member_birth_y);
			memberVO.setMember_birth_m(member_birth_m);
			memberVO.setMember_birth_d(member_birth_d);
			memberVO.setMember_birth_gn(member_birth_gn);
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

