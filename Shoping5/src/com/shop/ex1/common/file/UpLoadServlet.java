package com.shop.ex1.common.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;

import com.shop.ex1.goods.ImageFileVO;

@WebServlet("/uploadFile.do")
public class UpLoadServlet  extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response ) throws IOException{
		doProcess(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		doProcess(request,response);
	}
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		request.setCharacterEncoding("EUC-KR");
		String goods_id = null;
		String tempDir = "C:\\repo1";
		String encoding = "euc-kr";
		File uploadFile = null;
		FileService service=new FileService();
		ArrayList<ImageFileVO> fileList=new ArrayList<ImageFileVO>();
		try {
	
		DiskFileUpload fileUpload = new DiskFileUpload();
		fileUpload.setRepositoryPath(tempDir);
		fileUpload.setSizeMax(1024*1024);
		fileUpload.setSizeThreshold(1024*100);
		java.util.List fileItemList = fileUpload.parseRequest(request);

		
		
		for(int i=0; i < fileItemList.size();i++){
			FileItem fileItem = (FileItem) fileItemList.get(i);
			
			if(fileItem.isFormField()){
				goods_id=fileItem.getFieldName();
				System.out.println("goods_id:"+goods_id);
				System.out.println(fileItem.getFieldName()+ "=" +fileItem.getString(encoding));
				goods_id=fileItem.getString(encoding);
				tempDir+="\\"+goods_id;
				new  File(tempDir).mkdir();
			}else{
				
				String fileName=fileItem.getName();
				String fileType=fileItem.getFieldName();
				ImageFileVO vo=new ImageFileVO();
				vo.setFileName(fileName);
				vo.setFileType(fileType);
				vo.setGoods_id(goods_id);
				fileList.add(vo);
				
				System.out.println(fileItem.getFieldName());
				System.out.println(fileItem.getName());
				System.out.println(fileItem.getSize( ) + "bytes");
				//request.setAttribute(fileItem.getFieldName(),fileItem.getName());
				//업로드한 파일이 존재하는 경우
				if(fileItem.getSize() > 0){
					int idx = fileItem.getName().lastIndexOf("\\");
					if(idx ==-1){
						idx = fileItem.getName().lastIndexOf("/");
					}
					
					String fName = fileItem.getName().substring(idx+1);
					request.setAttribute(fileItem.getFieldName(),fName);
					try{
					//	File uploadFile = new  File("c:\\temp1", fileName);
						System.out.println("저장 위치:"+tempDir);
						uploadFile = new  File(tempDir+"\\"+ fName);
						
						fileItem.write(uploadFile);
						//System.out.println("uploadfile");
					}catch(IOException e){
						e.printStackTrace();
					}
				}
			
			}
		
		}
		
		
		service.addFile(fileList);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/jsp/admin/goods/admin_add_goods.jsp");  //dispatch 방식으로 tohello에 포워딩한다.
		dispatch.forward(request, response);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
}
}
