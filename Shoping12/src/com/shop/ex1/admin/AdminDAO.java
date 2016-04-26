package com.shop.ex1.admin;

import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.shop.ex1.goods.GoodsVO;
import com.shop.ex1.goods.ImageFileVO;
import com.shop.ex1.order.OrderGoodsVO;

public class AdminDAO {
	public static SqlSessionFactory sqlMapper = null;
	public static SqlSessionFactory getInstance(){
		if(sqlMapper == null) {
			try {
				String resource = "myBatis/SqlMapConfig.xml";
				Reader reader = Resources.getResourceAsReader(resource);
				sqlMapper = new SqlSessionFactoryBuilder().build(reader);
				reader.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return sqlMapper;
	}	
	
	public String addNewGoods(GoodsVO goodsVO) throws SQLException {
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		sqlMap.insert("mapper.admin.addNewGoods",goodsVO);
		sqlMap.commit();
		return goodsVO.getGoods_id();
	}
	
	
	public ArrayList<GoodsVO>listNewGoods(HashMap search_con) throws SQLException{
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		ArrayList<GoodsVO>  goodsList=(ArrayList)sqlMap.selectList("mapper.admin.list_new_goods",search_con);
		return goodsList;
	}
	
	public GoodsVO goods_detail(String goods_id) throws Exception {
		GoodsVO goodsVO = new GoodsVO();
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		goodsVO=(GoodsVO)sqlMap.selectOne("mapper.goods.goods_detail",goods_id);
		return goodsVO;
	}
	
	public ArrayList goods_detail_image(String goods_id) throws Exception {
		ArrayList imageList=new ArrayList();
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		imageList=(ArrayList)sqlMap.selectList("mapper.goods.goods_detail_image",goods_id);
		return imageList;
	}
	
	public void addImageFile(ArrayList fileList){
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
			for(int i=0; i<fileList.size();i++){
				ImageFileVO fileVO=(ImageFileVO)fileList.get(i);
				sqlMap.insert("mapper.admin.addImageFile",fileVO);
			}
		sqlMap.commit();
	}
	
	public void modifyGoodsInfo(GoodsVO goodsVO) {
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		sqlMap.update("mapper.admin.modifyGoodsInfo",goodsVO);
		sqlMap.commit();
	}
	
	public void modifyGoodsInfo(HashMap goodsMap) throws Exception{
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		sqlMap.update("mapper.admin.modifyGoodsInfo2",goodsMap);
		sqlMap.commit();
		
	}
	
	
	public void modifyImageFile(ArrayList fileList){
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
			for(int i=0; i<fileList.size();i++){
				ImageFileVO fileVO=(ImageFileVO)fileList.get(i);
				sqlMap.insert("mapper.admin.modifyImageFile",fileVO);
			}
		sqlMap.commit();
	}
	
	public void deleteImage(String image_id) {
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		sqlMap.delete("mapper.admin.deleteImage",image_id);
		sqlMap.commit();
	}
	
	public ArrayList<OrderGoodsVO>listOrderGoods(HashMap search_con) throws SQLException{
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		ArrayList<OrderGoodsVO>  orderGoodsList=(ArrayList)sqlMap.selectList("mapper.admin.list_order_goods",search_con);
		return orderGoodsList;
	}	
	
	public void modifyOrderGoods(HashMap orderMap) throws Exception{
		sqlMapper=getInstance();
		SqlSession sqlMap=sqlMapper.openSession();
		sqlMap.update("mapper.admin.modifyOrderGoods",orderMap);
		sqlMap.commit();
		
	}
}
