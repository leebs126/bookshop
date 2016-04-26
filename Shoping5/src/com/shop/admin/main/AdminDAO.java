package com.shop.admin.main;

import java.io.BufferedWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import oracle.jdbc.OracleResultSet;
import oracle.sql.CLOB;

public class AdminDAO {
	private DataSource dataFactory;

	public AdminDAO() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
	public void addGoods(GoodsVO goodsVO) throws SQLException {
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();

		String query = "insert into t_Goods_info (GOODS_ID,"+
													"GOODS_SORT,"+
													"GOODS_TITLE,"+
													"GOODS_WRITER,"+
													"GOODS_PUBLISHER,"+
													
													"GOODS_PRICE,"+
													"GOODS_SALES_PRICE,"+
													"GOODS_POINT,"+
													"GOODS_PUBLISHED_DATE,"+
													"GOODS_PAGE_TOTAL,"+
													
													"GOODS_ISBN,"+
													"GOODS_DELIVERY_PRICE,"+  //택배비
													"GOODS_DELIVERY_DATE,"+
													"GOODS_FILENAME,"+
													"GOODS_TYPE,"+
													
													"GOODS_WRITER_INTRO,"+
													"GOODS_INTRO,"+
													"PUBLISHER_COMMENT,"+
													"RECOMMEDATION,"+
													"GOODS_CONTENTS_ORDER)";
			query+=" values('"+
					goodsVO.getGoods_id()+"','"+
					goodsVO.getGoods_sort()+"','"+
					goodsVO.getGoods_title()+"','"+
					goodsVO.getGoods_writer()+"','"+
					goodsVO.getGoods_publisher()+"',"+
					
					goodsVO.getGoods_price()+","+
					goodsVO.getGoods_sales_price()+","+
					goodsVO.getGoods_point()+",'"+
					goodsVO.getGoods_published_date()+"',"+
					goodsVO.getGoods_page_total()+",'"+
					
					goodsVO.getGoods_isbn()+"',"+
					goodsVO.getGoods_delivery_price()+",'"+
					goodsVO.getGoods_delivery_date()+"','"+
					goodsVO.getGoods_fileName()+"','"+
					goodsVO.getGoods_type()+"','"+
					
					goodsVO.getGoods_writer_intro()+"','"+
					goodsVO.getGoods_intro()+"','"+
					goodsVO.getPublisher_comment()+"','"+
					goodsVO.getRecommendation()+"','"+
					"empty_clob()'"+")";
			System.out.println(query);
			stmt.executeUpdate(query);
			String goods_id=goodsVO.getGoods_id();

			// 2. setAutoCommit을 false로 한다.
			con.setAutoCommit(false);
			// 3. CLOB column에 대한 lock을 얻는다.
			ResultSet rs =stmt.executeQuery("select goods_contents_order from t_goods_info where goods_id = "+goods_id+" for update");
			if (rs.next()) {

				// 4. 오라클의 함수들을 사용하기 위해 cast한다.
				CLOB cl = ((OracleResultSet) rs).getCLOB("goods_contents_order");

				// 스트림을 이용한 값 저장
				BufferedWriter writer = new BufferedWriter(cl.getCharacterOutputStream());
				try {
					writer.write(goodsVO.getGoods_contents_order().toString());
					
				} catch (IOException e) {
					e.printStackTrace();
				}finally{
					try {
						writer.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			
			}
			con.commit();
			con.setAutoCommit(true);		
			
					
	}
	
	public void addGoodsImage(GoodsImageVO goodsImageVO) throws SQLException {
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();

		String query = "insert into t_Goods_info ";
	}
	
	public String getMaxGoodsId() throws SQLException{
		Connection con = dataFactory.getConnection();
		Statement stmt = con.createStatement();

		String query = "select max(goods_id)+1 from t_goods_info";
		System.out.println(query);
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
		String goods_id=rs.getString(1);
		
		return goods_id;
	}
}
