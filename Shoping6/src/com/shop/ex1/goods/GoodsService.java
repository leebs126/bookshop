package com.shop.ex1.goods;

import java.util.ArrayList;

public class GoodsService {
	GoodsDAO dao = new GoodsDAO();
	
	public ArrayList list() throws Exception {
		ArrayList list=dao.list();
				
		return list;
	}
	
	public GoodsVO goods_detail(String _goods_id) throws Exception {
		GoodsVO goodsVO=new GoodsVO();
		goodsVO = dao.goods_detail(_goods_id);
		ArrayList imageList =dao.goods_detail_image(_goods_id);
		goodsVO.setList_detail_Image(imageList);
		return goodsVO;
	}
}
