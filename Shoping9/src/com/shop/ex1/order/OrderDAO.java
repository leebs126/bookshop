package com.shop.ex1.order;

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
									                +"goods_sales_PRICE,"
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
													getMaxOrderId()+"','"+
													orderGoodsVO.getMember_id()+"','"+
													orderGoodsVO.getGoods_id()+"','"+
													orderGoodsVO.getGoods_title()+"','"+
													orderGoodsVO.getGoods_fileName()+"',"+
													orderGoodsVO.getOrder_goods_qty()+","+
													orderGoodsVO.getGoods_sales_price()+",'"+
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
	
	public void addOrderGoods(ArrayList<OrderGoodsVO> my_order_list) throws Exception{
		Connection con = dataFactory.getConnection();
		String query = "insert into t_shoping_order (ORDER_ID,"
													+"MEMBER_ID,"
									                +"GOODS_ID,"
									                +"GOODS_TITLE,"
									                +"GOODS_FILENAME,"
									                +"ORDER_GOODS_QTY,"
									                +"goods_sales_price,"
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
												            
		query+=" values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		PreparedStatement pstmt = con.prepareStatement(query);
		
		for(int i=0; i<my_order_list.size();i++){
			OrderGoodsVO orderGoodsVO =(OrderGoodsVO)my_order_list.get(i);
			pstmt.setString(1,getMaxOrderId());
        	pstmt.setString(2,orderGoodsVO.getMember_id());
        	pstmt.setString(3,orderGoodsVO.getGoods_id());
	        pstmt.setString(4, orderGoodsVO.getGoods_title());
            pstmt.setString(5, orderGoodsVO.getGoods_fileName() );
            pstmt.setInt(6, orderGoodsVO.getOrder_goods_qty() );
            pstmt.setInt(7, orderGoodsVO.getGoods_sales_price() );
            pstmt.setString(8, orderGoodsVO.getOrderer_name() );
            pstmt.setString(9, orderGoodsVO.getReceiver_name());
            pstmt.setString(10, orderGoodsVO.getReceiver_hp1());
            pstmt.setString(11, orderGoodsVO.getReceiver_hp2() );
            pstmt.setString(12, orderGoodsVO.getReceiver_hp3() );
            pstmt.setString(13, orderGoodsVO.getReceiver_tel1() );
            pstmt.setString(14, orderGoodsVO.getReceiver_tel2() );
            pstmt.setString(15, orderGoodsVO.getReceiver_tel3() );
            
            pstmt.setString(16, orderGoodsVO.getDelivery_address() );
            pstmt.setString(17, orderGoodsVO.getDelivery_message() );
            pstmt.setString(18, orderGoodsVO.getDelivery_method());
            pstmt.setString(19, orderGoodsVO.getGift_wrapping() );
            pstmt.setString(20, orderGoodsVO.getReceiver_tel3() );
            
            pstmt.setString(21, orderGoodsVO.getCard_com_name());
            pstmt.setString(22, orderGoodsVO.getCard_pay_month());
            pstmt.setString(23, orderGoodsVO.getPay_orderer_hp_num());
            System.out.println(query);
			pstmt.executeUpdate();
		}
	}	
	
	public ArrayList<OrderGoodsVO> listMyOrderGoods(OrderGoodsVO _orderGoodsVO) throws Exception{
		ArrayList<OrderGoodsVO> orderGoodsList=new ArrayList<OrderGoodsVO>();
		
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();
		String member_id=_orderGoodsVO.getMember_id();
		
		String query="select * from t_shoping_order";
		query+=" where to_char(pay_order_time,'yyyy-mm-dd')=to_char(sysdate,'yyyy-mm-dd') ";
        query+=" and member_id='"+member_id+"' ";
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
			int GOODS_SALES_PRICE = rs.getInt("GOODS_SALES_PRICE");
			
			OrderGoodsVO orderGoodsVO=new OrderGoodsVO();
			orderGoodsVO.setOrder_id(ORDER_ID);
			orderGoodsVO.setMember_id(MEMBER_ID);
			orderGoodsVO.setGoods_id(GOODS_ID);
			orderGoodsVO.setGoods_title(GOODS_TITLE);
			orderGoodsVO.setGoods_fileName(GOODS_FILENAME);
			orderGoodsVO.setOrder_goods_qty(ORDER_GOODS_QTY);
			
			orderGoodsVO.setGoods_sales_price(GOODS_SALES_PRICE);
			orderGoodsList.add(orderGoodsVO);
		}
		
		return orderGoodsList;
	}
	
	
	public OrderGoodsVO findMyOrderInfo(String order_id) throws Exception{
		OrderGoodsVO orderGoodsVO=new OrderGoodsVO();
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();
		
		String query="select * from t_shoping_order";
        query+=" where to_char(pay_order_time,'yyyy-mm-dd')=to_char(sysdate,'yyyy-mm-dd') ";
        query+=" and order_id='"+order_id+"' ";
        query+=" order by pay_order_time desc";
		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);

		while (rs.next()) {
			String ORDERER_NAME = rs.getString("ORDERER_NAME");
			String RECEIVER_NAME = rs.getString("RECEIVER_NAME");
			String RECEIVER_HP1 = rs.getString("RECEIVER_HP1");
			String RECEIVER_HP2 = rs.getString("RECEIVER_HP2");
			String RECEIVER_HP3 = rs.getString("RECEIVER_HP3");
			String RECEIVER_tel1 = rs.getString("RECEIVER_tel1");
			String RECEIVER_tel2 = rs.getString("RECEIVER_tel2");
			String RECEIVER_tel3 = rs.getString("RECEIVER_tel3");
			
			String DELIVERY_ADDRESS=rs.getString("DELIVERY_ADDRESS");
			String DELIVERY_MESSAGE=rs.getString("DELIVERY_MESSAGE");
			String DELIVERY_METHOD=rs.getString("DELIVERY_METHOD");
			String GIFT_WRAPPING = rs.getString("GIFT_WRAPPING");
			
			String PAY_METHOD= rs.getString("PAY_METHOD");
			String CARD_COM_NAME=rs.getString("CARD_COM_NAME");
			String CARD_PAY_MONTH=rs.getString("CARD_PAY_MONTH");
			String PAY_ORDERER_HP_NUM=rs.getString("PAY_ORDERER_HP_NUM");
			String DELIVERY_STATE=rs.getString("DELIVERY_STATE");
			
			orderGoodsVO.setOrderer_name(ORDERER_NAME);
			orderGoodsVO.setReceiver_name(RECEIVER_NAME);
			orderGoodsVO.setReceiver_hp1(RECEIVER_HP1);
			orderGoodsVO.setReceiver_hp2(RECEIVER_HP2);
			orderGoodsVO.setReceiver_hp3(RECEIVER_HP3);
			orderGoodsVO.setReceiver_tel1(RECEIVER_tel1);
			orderGoodsVO.setReceiver_tel2(RECEIVER_tel2);
			orderGoodsVO.setReceiver_tel3(RECEIVER_tel3);
			
			orderGoodsVO.setDelivery_address(DELIVERY_ADDRESS);
			orderGoodsVO.setDelivery_message(DELIVERY_MESSAGE);
			orderGoodsVO.setDelivery_method(DELIVERY_METHOD);
			orderGoodsVO.setGift_wrapping(GIFT_WRAPPING);
			orderGoodsVO.setPay_method(PAY_METHOD);
			
			orderGoodsVO.setCard_com_name(CARD_COM_NAME);
			orderGoodsVO.setCard_pay_month(CARD_PAY_MONTH);
			orderGoodsVO.setPay_orderer_hp_num(PAY_ORDERER_HP_NUM);
			orderGoodsVO.setDelivery_state(DELIVERY_STATE);
		}
		
		return orderGoodsVO;
	}
	
	private  String getMaxOrderId() throws SQLException{
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
	
	public void removeGoodsFromCart(ArrayList<OrderGoodsVO> my_order_list)throws SQLException{
		Connection con = dataFactory.getConnection();
		String query = "delete from t_shoping_cart "
				+ " where goods_id=?";
				
		PreparedStatement pstmt = con.prepareStatement(query);
		for(int i=0; i<my_order_list.size();i++){
			OrderGoodsVO orderGoodsVO =(OrderGoodsVO)my_order_list.get(i);
			pstmt.setString(1,orderGoodsVO.getGoods_id());
			
			System.out.println(query);
			pstmt.executeUpdate();
		
		}
	}	
}

