package com.shop.ex1.common.file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.shop.ex1.goods.ImageFileVO;

public class FileDAO {
	private DataSource dataFactory;
	
	public FileDAO() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void addFile(ArrayList fileList){
		String query = "insert into goods_detail_image (GOODS_ID,"+
													"FILENAME,"+
													"FILETYPE,"+
													"id,"+
													"image_Id,"+
													"CREDATE)";
		query+=" values(?,?,?,?,?,?)";

		try {
			Connection con = dataFactory.getConnection();
			PreparedStatement pstmt = con.prepareStatement(query);
			
			for(int i=0; i<fileList.size();i++){
				ImageFileVO vo=(ImageFileVO)fileList.get(i);
				String goods_id=vo.getGoods_id();
				String fileName=vo.getFileName();
				String fileType=vo.getFileType();
				
				pstmt.setString(1,goods_id);
		    	pstmt.setString(2,fileName);
		    	pstmt.setString(3,fileType);
		    	pstmt.setString(4,"");
		    	pstmt.setString(5,"");
		    	pstmt.setString(6,"2015-11-11");
				pstmt.executeUpdate();	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
