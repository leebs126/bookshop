package com.shop.ex1.mine;

import javax.sql.*;

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
	private DataSource dataFactory;
	
	public MineDAO() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<OrderGoodsVO> listMyOrderGoods(MemberVO memberVO) throws Exception{
		ArrayList<OrderGoodsVO> orderGoodsList=new ArrayList<OrderGoodsVO>();
		
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();
		String member_id=memberVO.getMember_id();
		
		String query="select * from t_shoping_order";
        query+=" where member_id='"+member_id+"' ";
        query+=" order by pay_order_time desc";
		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);

		while (rs.next()) {
			String pay_order_time = rs.getString("pay_order_time");
			String order_id = rs.getString("order_id");
			String goods_title = rs.getString("goods_title");
			String delivery_state = rs.getString("delivery_state");
			
			OrderGoodsVO orderGoodsVO=new OrderGoodsVO();
			orderGoodsVO.setPay_order_time(pay_order_time);
			orderGoodsVO.setOrder_id(order_id);
			orderGoodsVO.setGoods_title(goods_title);
			
			orderGoodsVO.setDelivery_state(delivery_state);
			orderGoodsList.add(orderGoodsVO);
		}
		
		return orderGoodsList;
	}
	
	public OrderGoodsVO findMyOrderInfo(String _order_id) throws Exception{
		OrderGoodsVO orderGoodsVO=new OrderGoodsVO();
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();
		
		String query="select * from t_shoping_order";
        query+=" where order_id='"+_order_id+"' ";
		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);

		while (rs.next()) {
			String order_id=rs.getString("order_id");
			String delivery_state = rs.getString("delivery_state");
			String goods_title=rs.getString("goods_title");
			int order_goods_qty=rs.getInt("order_goods_qty");
			int goods_sales_price=rs.getInt("goods_sales_price");
			
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
			
			orderGoodsVO.setOrder_id(order_id);
			orderGoodsVO.setDelivery_state(delivery_state);
			orderGoodsVO.setGoods_title(goods_title);
			orderGoodsVO.setOrder_goods_qty(order_goods_qty);
			orderGoodsVO.setGoods_sales_price(goods_sales_price);
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
	
	public ArrayList<OrderGoodsVO> findOrderDeliveryHist(MineVO mineVO) throws Exception{
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();
		
		String member_id=mineVO.getMember_id();
		String beginDate=mineVO.getBeginDate();
		String endDate=mineVO.getEndDate();
				
		ArrayList<OrderGoodsVO> my_order_hist_list=new ArrayList<OrderGoodsVO>();
		
		String query="select * from t_shoping_order";
        query+=" where member_id='"+member_id+"' ";
        query+=" and  to_char(pay_order_time,'yyyy-mm-dd')  between '"+beginDate+"' and '"+endDate+"'";
        query+=" order by pay_order_time desc";
		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);
		

		while (rs.next()) {
			String ORDER_ID = rs.getString("ORDER_ID");
			String pay_order_time=rs.getString("pay_order_time");
			String GOODS_TITLE = rs.getString("GOODS_TITLE");
			int ORDER_GOODS_QTY = rs.getInt("ORDER_GOODS_QTY");
			int GOODS_SALES_PRICE = rs.getInt("GOODS_SALES_PRICE");
			String delivery_state=rs.getString("delivery_state");
			String orderer_name=rs.getString("orderer_name");
			String receiver_name=rs.getString("receiver_name");
			
			
			OrderGoodsVO orderGoodsVO=new OrderGoodsVO();
			orderGoodsVO.setOrder_id(ORDER_ID);
			orderGoodsVO.setPay_order_time(pay_order_time);
			orderGoodsVO.setGoods_title(GOODS_TITLE);
			orderGoodsVO.setOrder_goods_qty(ORDER_GOODS_QTY);
			orderGoodsVO.setGoods_sales_price(GOODS_SALES_PRICE);
			orderGoodsVO.setDelivery_state(delivery_state);
			orderGoodsVO.setOrderer_name(orderer_name);
			orderGoodsVO.setReceiver_name(receiver_name);
			my_order_hist_list.add(orderGoodsVO);
			
		}
		return my_order_hist_list;
	}
	
	public void modifyMyInfo(MemberVO memberVO) throws Exception{
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();
		
		
		String member_id=memberVO.getMember_id();
		String member_pw=memberVO.getMember_pw();
		String member_gender=memberVO.getMember_gender();
		String member_birth_y=memberVO.getMember_birth_y();
		String member_birth_m=memberVO.getMember_birth_m();
		String member_birth_d=memberVO.getMember_birth_d();
		
		String member_birth_gn=memberVO.getMember_birth_gn();
		String tel1=memberVO.getTel1();
		String tel2=memberVO.getTel2();
		String tel3=memberVO.getTel3();
		
		String hp1=memberVO.getHp1();
		String hp2=memberVO.getHp2();
		String hp3=memberVO.getHp3();
		String smsSts_yn=memberVO.getSmsSts_yn();
		
		String email1=memberVO.getEmail1();
		String email2=memberVO.getEmail2();
		String emailSts_yn=memberVO.getEmailSts_yn();
		
		String zipcode=memberVO.getZipcode();
		String namujiAddress=memberVO.getNamujiAddress();
		String roadAddress=memberVO.getRoadAddress();
		String jibunAddress=memberVO.getJibunAddress();
		
		
		String query = "update t_shoping_member "
				     +" set member_pw='"+member_pw+"',"
				     +"     member_gender='"+member_gender+"',"
				          +"member_birth_y='"+member_birth_y+"',"
				          +"member_birth_m='"+member_birth_m+"',"
				          +"member_birth_d='"+member_birth_d+"',"
				          +"member_birth_gn='"+member_birth_gn+"',"
				          +"tel1='"+tel1+"',"
				          +"tel2='"+tel2+"',"
				          +"tel3='"+tel3+"',"
				          +"hp1='"+hp1+"',"
				          +"hp2='"+hp2+"',"
				          +"hp3='"+hp3+"',"
				          +"smsSts_yn='"+smsSts_yn+"',"
				          +"email1='"+email1+"',"
				          +"email2='"+email2+"',"
				          +"emailSts_yn='"+emailSts_yn+"',"
				          +"zipcode='"+zipcode+"',"
				          +"roadAddress='"+roadAddress+"',"
				          +"jibunAddress='"+jibunAddress+"',"
				          +"namujiAddress='"+namujiAddress+"'";
		query+=" where member_id='"+member_id+"'";
		System.out.println(query);
		stmt.executeUpdate(query);
	}
	
	public MemberVO findMemberInfo(MemberVO _memberVO) throws Exception{
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();
		String _member_id=_memberVO.getMember_id();
		
		String query="select * from t_shoping_member where"
				+ " member_id='"+_member_id+"'";
		
		
		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);
		
		MemberVO memberVO=new MemberVO();
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
}
