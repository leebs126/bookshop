package com.shop.ex1.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.shop.ex1.goods.GoodsVO;

public class CartDAO {

	private DataSource dataFactory;

	public CartDAO() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<CartVO> listMyCart(CartVO cartVO) throws Exception {
		ArrayList<CartVO> cartList = new ArrayList<CartVO>();

		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();
		String member_id = cartVO.getMember_id();

		String query = "select goods_id from t_shoping_cart ";
		query += " where ";
		query += "member_id='" + member_id + "'";

		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);

		while (rs.next()) {
			String goods_id = rs.getString("goods_id");

			CartVO _cartVO = new CartVO();
			_cartVO.setGoods_id(goods_id);
			cartList.add(_cartVO);
		}

		rs.close();
		stmt.close();
		con.close();

		return cartList;
	}

	public ArrayList<GoodsVO> listMyGoods(ArrayList<CartVO> cartList) throws Exception {
		ArrayList<GoodsVO> myGoodsList =new  ArrayList<GoodsVO>();
		ResultSet rs=null;
		Connection con = dataFactory.getConnection();
		String query = "select g.*,d.fileName from t_goods_info g, goods_detail_image d";
		query += " where ";
		query += "g.goods_id=d.goods_id ";
		query += " and d.filetype='main_image'";
		query += " and g.goods_id=?";
		query += " order by g.creDate desc";
		System.out.println(query);

		PreparedStatement ptmt = con.prepareStatement(query);

		for (int i = 0; i < cartList.size(); i++) {
			String _goods_id = ((CartVO) cartList.get(i)).getGoods_id();
			ptmt.setString(1,_goods_id);
			rs = ptmt.executeQuery();
			
			while (rs.next()) {
				String goods_id = rs.getString("goods_id");
				String goods_sort = rs.getString("goods_sort");
				String goods_title = rs.getString("goods_title");
				String goods_writer = rs.getString("goods_writer");
				int goods_price = rs.getInt("goods_price");
				String goods_sales_price = rs.getString("goods_sales_price");
				String goods_publisher = rs.getString("goods_publisher");
				String goods_type = rs.getString("goods_type");
				String goods_fileName = rs.getString("fileName");

				GoodsVO goods = new GoodsVO();
				goods.setGoods_id(goods_id);
				goods.setGoods_sort(goods_sort);
				goods.setGoods_title(goods_title);
				goods.setGoods_writer(goods_writer);
				goods.setGoods_price(goods_price);
				goods.setGoods_sales_price(goods_sales_price);
				goods.setGoods_publisher(goods_publisher);
				goods.setGoods_type(goods_type);
				goods.setGoods_fileName(goods_fileName);
				myGoodsList.add(goods);
			}
		}
		rs.close();
		ptmt.close();
		con.close();

		return myGoodsList;
	}

	public int searchCart(CartVO cartVO) throws Exception {
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();

		String goods_id = cartVO.getGoods_id();
		String member_id = cartVO.getMember_id();

		String query = "select count(*) from t_shoping_cart";
		query += " where goods_id='" + goods_id + "'";
		query += " and member_id='" + member_id + "'";

		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		int count = rs.getInt(1);

		return count;
	}

	public void addCart(CartVO cartVO) throws Exception {
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();

		String query = "insert into t_shoping_cart( CART_ID," + "GOODS_ID," + "MEMBER_ID)";
		query += " values(" + cartVO.getCart_id() + ",'" + cartVO.getGoods_id() + "','" + cartVO.getMember_id() + "')";

		System.out.println(query);
		stmt.executeUpdate(query);
	}
	
	public void modifyCartQty(CartVO cartVO) throws SQLException{
		boolean result=false;
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();
		String member_id=cartVO.getMember_id();
		String goods_id=cartVO.getGoods_id();
		int goods_qty=cartVO.getGoods_qty();
		String query = "update t_shoping_cart ";
		query+=  " set goods_qty="+goods_qty;
		query+= " where member_id='"+member_id+"'";
		query+="   and goods_id='"+goods_id+"'";
		
		System.out.println(query);
		stmt.executeUpdate(query);

	}

	public int getMaxCartId() throws SQLException {
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();

		String query = "select count(*)+1 from t_shoping_cart";
		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		int cart_id = rs.getInt(1);

		return cart_id;
	}

}
