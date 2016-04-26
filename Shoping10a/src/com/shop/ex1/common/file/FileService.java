package com.shop.ex1.common.file;

import java.util.ArrayList;

public class FileService {
	FileDAO dao;
	public void addFile(ArrayList fileList) {
		dao=new FileDAO();
		
		dao.addFile(fileList);
		
	}

}
