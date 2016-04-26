package com.shop.ex1.cart;

import java.util.ArrayList;

import com.shop.ex1.goods.GoodsVO;

public class CartService {
	CartDAO dao=new CartDAO();
	public void addCart(CartVO cartVO) throws Exception{
		int cart_id=dao.getMaxCartId();
		cartVO.setCart_id(cart_id);
		
		dao.addCart(cartVO);
	}
	
	public boolean modifyCartQty(CartVO cartVO) throws Exception{
		boolean result=true;
		dao.modifyCartQty(cartVO);
		
		return result;
	}
	
	public ArrayList<GoodsVO> listMyCart(CartVO cartVO) throws Exception{
		ArrayList<CartVO> cartList=null;
		cartList=dao.listMyCart(cartVO);
		ArrayList<GoodsVO> goodsList=null;
		
		
		return dao.listMyGoods(cartList);
		
		
	}
	public boolean searchCart(CartVO cartVO) throws Exception{
		int res=0;
		
		res=dao.searchCart(cartVO);
		if(res==0)
			return false;
		else
			return true;
		
	}

}
