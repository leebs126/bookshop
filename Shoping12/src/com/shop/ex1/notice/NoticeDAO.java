package com.shop.ex1.notice;

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

public class NoticeDAO {
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
	
	
	public ArrayList listNotice(){
		sqlMapper=getInstance();
		ArrayList list = new ArrayList();
		SqlSession sqlMap=sqlMapper.openSession();
		list=(ArrayList)sqlMap.selectList("mapper.notice.list_notice");
		return list;
	}

}

