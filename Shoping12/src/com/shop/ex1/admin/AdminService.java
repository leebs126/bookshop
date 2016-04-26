package com.shop.ex1.admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.shop.ex1.goods.GoodsVO;
import com.shop.ex1.order.OrderGoodsVO;

public class AdminService{
	
	AdminDAO dao=new AdminDAO();
	public String  addNewGoods(GoodsVO goodsVO) throws SQLException{
		String goods_id=null;
		goods_id=dao.addNewGoods(goodsVO);
		return goods_id;
	}
	
	public void  addImageFile(ArrayList fileList) throws SQLException{
		dao.addImageFile(fileList);
	}
	
	public ArrayList<GoodsVO> listNewGoods(HashMap search_con) throws SQLException{
		return dao.listNewGoods(search_con);
	}
	
	public GoodsVO goods_detail(String goods_id) throws Exception {
		GoodsVO goodsVO=new GoodsVO();
		goodsVO = dao.goods_detail(goods_id);
		
		return goodsVO;
	}
	
	public ArrayList goods_image_file(String goods_id) throws Exception{
		ArrayList imageList =dao.goods_detail_image(goods_id);
		return imageList;
	}
	
	
	public void modifyGoodsInfo(ArrayList fileList) throws Exception{
		//dao.modifyGoodsInfo(goodsVO);
		dao.modifyImageFile(fileList);
		
	}
	
	public void modifyGoodsInfo(HashMap goodsMap) throws Exception{
		dao.modifyGoodsInfo(goodsMap);
		
	}	
	
	public void deleteImage(String image_id) throws Exception{
		dao.deleteImage(image_id);
	}
	
	public ArrayList<OrderGoodsVO> listOrderGoods(HashMap search_con) throws SQLException{
		return dao.listOrderGoods(search_con);
	}
	
	public void modifyOrderGoods(HashMap orderMap) throws Exception{
		dao.modifyOrderGoods(orderMap);
		
	}

}
