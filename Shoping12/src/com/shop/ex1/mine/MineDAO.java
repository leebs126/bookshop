package com.shop.ex1.mine;

import javax.sql.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.Reader;
import java.sql.*;
import javax.naming.*;

import javax.servlet.http.HttpServletRequest;

import com.shop.ex1.member.MemberVO;
import com.shop.ex1.order.OrderGoodsVO;

import javax.servlet.http.*;
import javax.servlet.*;
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
	
	public ArrayList<OrderGoodsVO> listMyOrderGoods(MemberVO memberVO) throws Exception{
		String member_id=memberVO.getMember_id();
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		ArrayList<OrderGoodsVO> orderGoodsList=new ArrayList<OrderGoodsVO>();
		orderGoodsList=(ArrayList)sqlMap.selectList("mapper.mine.list_my_order",member_id);
		return orderGoodsList;
	}
	
	public OrderGoodsVO findMyOrderInfo(String order_id) throws Exception{
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		ArrayList<OrderGoodsVO> orderGoodsList=new ArrayList<OrderGoodsVO>();
		OrderGoodsVO orderGoodsVO=(OrderGoodsVO)sqlMap.selectOne("mapper.mine.find_my_order",order_id);
		return orderGoodsVO;
	}	
	
	public ArrayList<OrderGoodsVO> findOrderDeliveryHist(MineVO mineVO) throws Exception{
		
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		ArrayList<OrderGoodsVO> my_order_hist_list=(ArrayList)sqlMap.selectList("mapper.mine.find_my_order_delivery_hist",mineVO);
		return my_order_hist_list;
	}
	
	public void modifyMyInfo(HashMap memberMap) throws Exception{
		
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		sqlMap.update("mapper.mine.modify_my_info",memberMap);
		sqlMap.commit();
		
	}
	
	public MemberVO findMyInfo(String member_id) throws Exception{
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		MemberVO _memberVO=(MemberVO)sqlMap.selectOne("mapper.mine.find_my_info",member_id);
		return _memberVO;
		
	}
	
	public void cancelOrder(String order_id) throws Exception{
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		sqlMap.update("mapper.mine.cancel_order",order_id);
		sqlMap.commit();
	}
}
