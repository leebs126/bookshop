package com.shop.ex1.goods;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GoodsDAO {
	private DataSource dataFactory;
	
	public GoodsDAO(){
		try{
			Context ctx=new InitialContext();
			dataFactory=(DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ArrayList list(){
		ArrayList list=new ArrayList();
		try{
			Connection con=dataFactory.getConnection();
			Statement stmt=con.createStatement();
			String query="select * from t_Goods";
			System.out.println(query);
			ResultSet rs=stmt.executeQuery(query);
			
			while(rs.next()){
				String goods_id=rs.getString("goods_id");
				String goods_sort=rs.getString("goods_sort");
				String goods_title=rs.getString("goods_title");
				String goods_writer=rs.getString("goods_writer");
				String goods_price=rs.getString("goods_price");
				String goods_publisher=rs.getString("goods_publisher");
				String goods_type=rs.getString("goods_type");
				String fileName=rs.getString("fileName");
				
				
				GoodsVO goods=new GoodsVO();
				goods.setGoods_id(goods_id);
				goods.setGoods_sort(goods_sort);
				goods.setGoods_title(goods_title);
				goods.setGoods_writer(goods_writer);
				goods.setGoods_price(goods_price);
				goods.setGoods_publisher(goods_publisher);
				goods.setGoods_type(goods_type);
				goods.setFileName(fileName);
				list.add(goods);
			}
			
			rs.close();
			stmt.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

}

