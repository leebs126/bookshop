package com.shop.ex1.order;

import java.util.ArrayList;

import com.shop.ex1.member.MemberVO;

public class OrderService {
	OrderDAO dao=new OrderDAO();
	public ArrayList<OrderGoodsVO> listMyOrderGoods(OrderGoodsVO orderGoodsVO) throws Exception{
		ArrayList<OrderGoodsVO> orderGoodsList;
		orderGoodsList=dao.listMyOrderGoods(orderGoodsVO);
		
		return orderGoodsList;
	}
	
	
	public void addOrderGoods(OrderGoodsVO orderGoodsVO) throws Exception{
		String order_id=dao.getMaxOrderId();
		
		orderGoodsVO.setOrder_id(order_id);
		dao.addOrderGoods(orderGoodsVO);
		
		//카트에서 주문 상품 제거한다.
		dao.removeGoodsFromCart(orderGoodsVO);
	}
	

}
