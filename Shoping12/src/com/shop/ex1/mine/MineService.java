package com.shop.ex1.mine;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	public MemberVO  modifyMyInfo(HashMap memberMap) throws Exception{
		 dao.modifyMyInfo(memberMap);
		 String member_id=(String)memberMap.get("member_id");
		 return dao.findMyInfo(member_id);
		 
	}
	
	public void cancelOrder(String order_id) throws Exception{
		dao.cancelOrder(order_id);
	}
	public MemberVO findMyInfo(String member_id) throws Exception{
		return dao.findMyInfo(member_id);
	}
}
