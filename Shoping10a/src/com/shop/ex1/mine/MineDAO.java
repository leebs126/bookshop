package com.shop.ex1.mine;

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

public class MineDAO{
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
	

	public List listMyOrder( OrderGoodsVO orderGoodsVO ){   	
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		List orderList = null;
		boolean result = false;
		try{
			orderList=sqlMap.selectList("mapper.mine.listMyOrder",orderGoodsVO);
		}catch(Exception e){
			System.out.println(e);
		}
	   return orderList;	
     
	}
/*	
	public boolean insertMember(MemberBean m){
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		boolean result=false;
		try{
			sqlMap.insert("mapper.member.insertMember",m);
			result = true;
			sqlMap.commit();
		}catch(Exception e){
			e.printStackTrace();
			sqlMap.rollback();
		}
		
		return result;
	}*/ //end insertMember()
}//end class MemberDAO

