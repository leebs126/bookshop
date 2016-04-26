package com.shop.admin.main;

import java.sql.SQLException;

public class AdminService{
	
	AdminDAO dao=new AdminDAO();
	public String  addGoods(GoodsVO goodsVO) throws SQLException{
		
		String goods_id=dao.getMaxGoodsId();  //�� ��ǰ ��ȣ�� ���´�.
		//System.out.println("�� ��ǰ ��ȣ:"+goods_id);
		goodsVO.setGoods_id(goods_id);
		dao.addGoods(goodsVO);
		
		return goods_id;
	}

}
