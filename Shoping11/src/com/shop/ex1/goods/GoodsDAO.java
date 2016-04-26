package com.shop.ex1.goods;

import java.io.Reader;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.shop.ex1.member.MemberVO;

public class GoodsDAO {
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

	public ArrayList list() throws Exception {
		sqlMapper=getInstance();
		ArrayList list = new ArrayList();
		SqlSession sqlMap=sqlMapper.openSession();
		list=(ArrayList)sqlMap.selectList("mapper.goods.listGoods");
	   return list;	
     
	}
	
	public ArrayList list(String _searchWord) throws Exception {
		sqlMapper=getInstance();
		ArrayList list = new ArrayList();
		SqlSession sqlMap=sqlMapper.openSession();
		list=(ArrayList)sqlMap.selectList("mapper.goods.listGoods",_searchWord);
	   return list;
		
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
	
}
