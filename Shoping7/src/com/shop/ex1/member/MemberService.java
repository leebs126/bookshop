package com.shop.ex1.member;

public class MemberService {
	
	MemberDAO dao=new MemberDAO();
	
	public void addMember(MemberVO memberVO) throws Exception{
		dao.addMember(memberVO);
	}
	
	public boolean isUserJoined(MemberVO memberVO) throws Exception{
		return dao.isUserJoined(memberVO);
	}

}
