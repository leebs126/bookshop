package com.shop.ex1.order;

import java.io.Reader;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.shop.ex1.cart.CartVO;
import com.shop.ex1.member.MemberVO;

public class OrderDAO {
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
	
	public ArrayList<OrderGoodsVO> listMyOrderGoods(OrderGoodsVO orderGoodsVO) throws Exception{
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		ArrayList<OrderGoodsVO> orderGoodsList=new ArrayList<OrderGoodsVO>();
		orderGoodsList=(ArrayList)sqlMap.selectList("mapper.order.list_my_order",orderGoodsVO);
		return orderGoodsList;
	}
	
	
	public void addOrderGoods(OrderGoodsVO orderGoodsVO) throws Exception{
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		sqlMap.insert("mapper.order.add_order_goods",orderGoodsVO);
		//sqlMap.commit();
	}
	
	public void addOrderGoods(ArrayList<OrderGoodsVO> my_order_list) throws Exception{
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		for(int i=0; i<my_order_list.size();i++){
			OrderGoodsVO orderGoodsVO =(OrderGoodsVO)my_order_list.get(i);
			sqlMap.insert("mapper.order.add_order_goods",orderGoodsVO);
		}
		sqlMap.commit();
	}	
	

	
	public OrderGoodsVO findMyOrder(String order_id) throws Exception{
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		OrderGoodsVO orderGoodsVO=(OrderGoodsVO)sqlMap.selectOne("mapper.order.find_my_order",order_id);		
		return orderGoodsVO;
	}
	
	
	public void removeGoodsFromCart(OrderGoodsVO orderGoodsVO)throws SQLException{
		String goods_id=orderGoodsVO.getGoods_id();
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		
		sqlMap.delete("mapper.order.delete_goods_from_cart",orderGoodsVO);
		sqlMap.commit();
	}
	
	public void removeGoodsFromCart(ArrayList<OrderGoodsVO> my_order_list)throws SQLException{
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		for(int i=0; i<my_order_list.size();i++){
			OrderGoodsVO orderGoodsVO =(OrderGoodsVO)my_order_list.get(i);
			sqlMap.delete("mapper.order.delete_goods_from_cart",orderGoodsVO);		
		}
		sqlMap.commit();
	}	
}

