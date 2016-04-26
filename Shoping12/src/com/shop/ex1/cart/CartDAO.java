package com.shop.ex1.cart;

import java.io.Reader;
import java.sql.Connection;
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

import com.shop.ex1.goods.GoodsVO;

public class CartDAO {
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

	public ArrayList<CartVO> listMyCart(CartVO cartVO) throws Exception {
		sqlMapper=getInstance();
		ArrayList<CartVO> cartList = new ArrayList<CartVO>();
		SqlSession sqlMap=sqlMapper.openSession();
		cartList=(ArrayList)sqlMap.selectList("mapper.cart.list_my_cart",cartVO);
		return cartList;
	}

	public ArrayList<GoodsVO> listMyGoods(ArrayList<CartVO> cartList) throws Exception {
		
		sqlMapper=getInstance();
		ArrayList<GoodsVO> myGoodsList =new  ArrayList<GoodsVO>();
		SqlSession sqlMap=sqlMapper.openSession();

		for (int i = 0; i < cartList.size(); i++) {
			GoodsVO goodsVO = new GoodsVO();
			String goods_id = ((CartVO) cartList.get(i)).getGoods_id();
			goodsVO=(GoodsVO)sqlMap.selectOne("mapper.cart.list_my_goods",goods_id);
			myGoodsList.add(goodsVO);
			
		}
		return myGoodsList;

	}

	public int searchCart(CartVO cartVO) throws Exception {
		sqlMapper=getInstance();
		ArrayList<CartVO> cartList = new ArrayList<CartVO>();
		SqlSession sqlMap=sqlMapper.openSession();
		int count=0;
		count=sqlMap.selectOne("mapper.cart.search_cart",cartVO);
		return count;
	}

	public void addCart(CartVO cartVO) throws Exception {
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		sqlMap.insert("mapper.cart.add_cart",cartVO);
		sqlMap.commit();
	}
	
	public void modifyCartQty(CartVO cartVO) throws SQLException{
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		sqlMap.insert("mapper.cart.modify_cart_qty",cartVO);
		sqlMap.commit();
	}

	public int getMaxCartId() throws SQLException {
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		int cart_id =sqlMap.selectOne("mapper.cart.get_max_cart_id");
		return cart_id;
	}

}
