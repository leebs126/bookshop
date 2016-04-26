package com.shop.ex1.order;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.shop.ex1.member.MemberVO;

public class OrderDAO {
	private DataSource dataFactory;

	public OrderDAO() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addOrderGoods(OrderGoodsVO orderGoodsVO) throws Exception{
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();

		String query = "insert into t_shoping_order (ORDER_ID,"
													+"MEMBER_ID,"
									                +"GOODS_ID,"
									                +"GOODS_TITLE,"
									                +"GOODS_FILENAME,"
									                +"ORDER_GOODS_QTY,"
									                +"ORDER_TOTAL_PRICE,"
									                +"ORDERER_NAME,"
									                +"RECEIVER_NAME,"
									                +"RECEIVER_HP1,"
									                +"RECEIVER_HP2,"
									                +"RECEIVER_HP3,"
									                +"RECEIVER_tel1,"
									                +"RECEIVER_tel2,"
									                +"RECEIVER_tel3,"
									                +"DELIVERY_ADDRESS,"
									                +"DELIVERY_MESSAGE,"
									                +"DELIVERY_METHOD,"
									                +"GIFT_WRAPPING,"
									                + "PAY_METHOD,"
									                + "CARD_COM_NAME,"
									                + "CARD_PAY_MONTH,"
									                + "PAY_ORDERER_HP_NUM)";
									            
						query+=" values('"+  
													orderGoodsVO.getOrder_id()+"','"+
													orderGoodsVO.getMember_id()+"','"+
													orderGoodsVO.getGoods_id()+"','"+
													orderGoodsVO.getGoods_title()+"','"+
													orderGoodsVO.getGoods_fileName()+"',"+
													orderGoodsVO.getOrder_goods_qty()+","+
													orderGoodsVO.getOrder_total_price()+",'"+
													orderGoodsVO.getOrderer_name()+"','"+
													orderGoodsVO.getReceiver_name()+"','"+
													orderGoodsVO.getReceiver_hp1()+"','"+
													orderGoodsVO.getReceiver_hp2()+"','"+
													orderGoodsVO.getReceiver_hp3()+"','"+
													orderGoodsVO.getReceiver_tel1()+"','"+
													orderGoodsVO.getReceiver_tel2()+"','"+
													orderGoodsVO.getReceiver_tel3()+"','"+
													orderGoodsVO.getDelivery_address()+"','"+
													orderGoodsVO.getDelivery_message()+"','"+
													orderGoodsVO.getDelivery_method()+"','"+
													orderGoodsVO.getGift_wrapping()+"','"+
													orderGoodsVO.getPay_method()+"','"+
													orderGoodsVO.getCard_com_name()+"','"+
													orderGoodsVO.getCard_pay_month()+"','"+
													orderGoodsVO.getPay_orderer_hp_num()+"')";

				System.out.println(query);
				stmt.executeUpdate(query);
	}
	
	public ArrayList<OrderGoodsVO> listMyOrderGoods(OrderGoodsVO _orderGoodsVO) throws Exception{
		ArrayList<OrderGoodsVO> orderGoodsList=new ArrayList<OrderGoodsVO>();
		
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();
		String order_id=_orderGoodsVO.getOrder_id();
		
		String query="select * from t_shoping_order";
        query+=" where to_char(pay_order_time,'yyyy-mm-dd')=to_char(sysdate,'yyyy-mm-dd') ";
        query+=" and order_id='"+order_id+"' ";
        query+=" order by pay_order_time desc";
		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);

		while (rs.next()) {
			String ORDER_ID = rs.getString("ORDER_ID");
			String MEMBER_ID = rs.getString("MEMBER_ID");
			String GOODS_ID=rs.getString("GOODS_ID");
			String GOODS_TITLE = rs.getString("GOODS_TITLE");
			String GOODS_FILENAME=rs.getString("GOODS_FILENAME");
			int ORDER_GOODS_QTY = rs.getInt("ORDER_GOODS_QTY");
			int ORDER_TOTAL_PRICE = rs.getInt("ORDER_TOTAL_PRICE");
			
			OrderGoodsVO orderGoodsVO=new OrderGoodsVO();
			orderGoodsVO.setOrder_id(ORDER_ID);
			orderGoodsVO.setMember_id(MEMBER_ID);
			orderGoodsVO.setGoods_id(GOODS_ID);
			orderGoodsVO.setGoods_title(GOODS_TITLE);
			orderGoodsVO.setGoods_fileName(GOODS_FILENAME);
			orderGoodsVO.setOrder_goods_qty(ORDER_GOODS_QTY);
			
			orderGoodsVO.setOrder_total_price(ORDER_TOTAL_PRICE);
			orderGoodsList.add(orderGoodsVO);
		}
		
		return orderGoodsList;
	}
	
	
	public String getMaxOrderId() throws SQLException{
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();

		String query = "select nvl(max(order_id),0)+1 from t_shoping_order";
		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		String order_id=rs.getString(1);
		
		return order_id;
	}
	
	public void removeGoodsFromCart(OrderGoodsVO orderGoodsVO)throws SQLException{
		String goods_id=orderGoodsVO.getGoods_id();
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();
		
		String query = "delete from t_shoping_cart "
				+ " where goods_id='"+goods_id+"'";
		System.out.println(query);
		stmt.executeUpdate(query);		
	}
}

