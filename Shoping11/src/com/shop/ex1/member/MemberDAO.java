package com.shop.ex1.member;

import javax.sql.*;

import java.io.Reader;
import java.sql.*;
import javax.naming.*;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.shop.ex1.order.OrderGoodsVO;

import javax.servlet.http.*;
import javax.servlet.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import java.util.*;

public class MemberDAO{
	public static SqlSessionFactory sqlMapper = null;
	
	public static SqlSessionFactory getInstance(){
		if(sqlMapper == null) {
			try {
				String resource = "myBatis/SqlMapConfig.xml";
				Reader reader = Resources.getResourceAsReader(resource);
				sqlMapper = new SqlSessionFactoryBuilder().build(reader);
				reader.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return sqlMapper;
	}		
	

	public MemberVO findMember( MemberVO memberVO) throws Exception{   	
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		MemberVO member=null;
		member=sqlMap.selectOne("mapper.member.findMember",memberVO);
	   return member;	
     
	}
	
	public void addMember(MemberVO memberVO) throws Exception{
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		sqlMap.insert("mapper.member.addMember",memberVO);
		sqlMap.commit();
	}
}//end class MemberDAO

