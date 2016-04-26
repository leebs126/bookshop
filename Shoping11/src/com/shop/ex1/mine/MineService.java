package com.shop.ex1.mine;

import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.ex1.member.MemberVO;
import com.shop.ex1.order.OrderGoodsVO;

public class MineService {
	MineDAO dao;
	public MineService() {
		this.dao = new MineDAO();
	}

	public ArrayList<OrderGoodsVO> listMyOrderGoods(MemberVO memberVO) throws Exception{
		return dao.listMyOrderGoods(memberVO);
		
	}
	
	public OrderGoodsVO findMyOrderInfo(String order_id) throws Exception{
		return dao.findMyOrderInfo(order_id);
	}
	
	public ArrayList<OrderGoodsVO> findOrderDeliveryHist(MineVO mineVO) throws Exception{
		return dao.findOrderDeliveryHist(mineVO);
	}
	
	public MemberVO  modifyMyInfo(MemberVO memberVO) throws Exception{
		 dao.modifyMyInfo(memberVO);
		 
		 return dao.findMyInfo(memberVO);
	}
	
	public void cancelOrder(String order_id) throws Exception{
		dao.cancelOrder(order_id);
	}
}
