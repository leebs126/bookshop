package com.shop.admin.main;

import java.sql.SQLException;

public class AdminService{
	
	AdminDAO dao=new AdminDAO();
	public String  addGoods(GoodsVO goodsVO) throws SQLException{
		
		String goods_id=dao.getMaxGoodsId();  //새 제품 번호를 얻어온다.
		//System.out.println("새 제품 번호:"+goods_id);
		goodsVO.setGoods_id(goods_id);
		dao.addGoods(goodsVO);
		
		return goods_id;
	}

}
