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
		dao.addOrderGoods(orderGoodsVO);
		
		//īƮ���� �ֹ� ��ǰ �����Ѵ�.
		dao.removeGoodsFromCart(orderGoodsVO);
	}
	public void addOrderGoods(ArrayList<OrderGoodsVO> my_order_list) throws Exception{
		dao.addOrderGoods(my_order_list);
		//īƮ���� �ֹ� ��ǰ �����Ѵ�.
		dao.removeGoodsFromCart(my_order_list);
	}	
	
	public OrderGoodsVO findMyOrderInfo(String order_id) throws Exception{
		return dao.findMyOrderInfo(order_id);
	}

}
