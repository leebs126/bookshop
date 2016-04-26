package com.shop.ex1.common.file;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;

import com.shop.admin.AdminService;
import com.shop.ex1.goods.GoodsVO;
import com.shop.ex1.goods.ImageFileVO;

@WebServlet("/uploadFile.do")
public class UpLoadServlet  extends HttpServlet {
	private static String FILE_SERVER_DIR="C:\\repo";
	AdminService adminService;
	String filePath = FILE_SERVER_DIR;
	public void doGet(HttpServletRequest request,HttpServletResponse response ) throws IOException{
		doProcess(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		doProcess(request,response);
	}
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException{
		adminService=new AdminService();
		request.setCharacterEncoding("EUC-KR");
		String goods_id = null;
		String encoding = "euc-kr";
		File uploadFile = null;
		ArrayList<ImageFileVO> fileList=new ArrayList<ImageFileVO>();
		String command=null;
		
		String parameter=null;
		String value=null;
		String fileName=null;
		ArrayList<String> fileNameList=new ArrayList<String>();
		HttpSession session=request.getSession();
		GoodsVO goodsVO=(GoodsVO)session.getAttribute("goodsVO");
		
		//�̹��� ���� ���� �� ���� ������ �ִ� ������ �̹��� ������ ����� ���ο� ������ ���ε� �Ѵ�.
		ArrayList imageFileList=(ArrayList) session.getAttribute("imageFileList");
		
		command=request.getParameter("command");
		System.out.println(command);
		
		try {
			if(command!= null && command.equals("deleteImage")){
				String image_id=request.getParameter("image_id");
				fileName=request.getParameter("fileName");
				goods_id=goodsVO.getGoods_id();
				deleteImage(image_id,goods_id,fileName);
				PrintWriter pw=response.getWriter();
				pw.write("delete_success");
				return ;
			}
			
			//��ǰ ������ ������ �� ��ǰ ��ȣ�� ������ �ͼ� �̹��� �����̸� ���� ���� �̸����� ����Ѵ�.
			
			
			DiskFileUpload fileUpload = new DiskFileUpload();
			fileUpload.setRepositoryPath(filePath);
			fileUpload.setSizeMax(1024*1024);
			fileUpload.setSizeThreshold(1024*100);
			java.util.List fileItemList = fileUpload.parseRequest(request);

		
			
			for(int i=0; i < fileItemList.size();i++){
				FileItem fileItem = (FileItem) fileItemList.get(i);
				
				if(fileItem.isFormField()){
					parameter=fileItem.getFieldName();
					if(parameter.equals("command")){
						value=fileItem.getString(encoding);
						
						if(value == null ){
							/*goods_id =adminService.addNewGoods(goodsVO);
							tempDir+="\\"+goods_id;
							new  File(tempDir).mkdir();*/
						}else if(value.equals("mofify_goods_imageFile")) {
							goods_id=(String)goodsVO.getGoods_id();
							filePath=FILE_SERVER_DIR+"\\"+goods_id;
							new  File(filePath).mkdir();
						}else if(value.equals("add_goods_imageFile")) {
							goods_id=(String)goodsVO.getGoods_id();
							filePath=FILE_SERVER_DIR+"\\"+goods_id;
							new  File(filePath).mkdir();
						}
						
					}else if(parameter.equals("image_id")){
						if(fileName==null || fileName.length()==0)
							continue;
						
						String image_id=fileItem.getString(encoding);
						fileNameList.add(image_id);
					}
					
					continue;
				}else{
					
					if(value==null){ //��ǰ �߰��� ���� �̹��� ���� �߰��ϱ�
						if(goods_id==null){
							goods_id =adminService.addNewGoods(goodsVO);
							filePath=FILE_SERVER_DIR+"\\"+goods_id;
							new  File(filePath).mkdir();
						}
						
						fileName=fileItem.getName();
						String fileType=fileItem.getFieldName();
						ImageFileVO vo=new ImageFileVO();
						vo.setFileName(fileName);
						vo.setFileType(fileType);
						vo.setGoods_id(goods_id);
						vo.setId("admin");
						fileList.add(vo);
					}else if(value.equals("mofify_goods_imageFile")){
						
						fileName=fileItem.getName();
						if(fileName==null || fileName.length()==0)
							continue;
						else{
							String fileType=fileItem.getFieldName();
							ImageFileVO vo=new ImageFileVO();
							vo.setFileName(fileName);
							vo.setFileType(fileType);
							vo.setGoods_id(goods_id);
							vo.setId("admin");
							fileList.add(vo);
							
							//�̹����� �����ϱ� ���� ���ǿ� ����� �� �̹����� fileType�� ������ �ͼ� ���۵�
							//�̹����� fileType�� ���ؼ� ������ ���ǿ� ����� �̹��� �̸����� ������ �ִ� �̹����� 
							//������ �� ���۵� �̹����� ������ �����Ѵ�.
							for(int j=0; j<imageFileList.size();j++){
								ImageFileVO imageVO=(ImageFileVO)imageFileList.get(j);
								String fType=imageVO.getFileType();
								if(fileType.equals(fType)){
									fileName=imageVO.getFileName();
									filePath=FILE_SERVER_DIR+"\\"+goods_id+"\\"+fileName;
									 new  File(filePath).delete();
								}
							}
							
									
							
						}
					}else if(value.equals("add_goods_imageFile")){
						
						fileName=fileItem.getName();
						if(fileName==null || fileName.length()==0)
							continue;
						
						String fileType=fileItem.getFieldName();
						ImageFileVO vo=new ImageFileVO();
						vo.setFileName(fileName);
						vo.setFileType(fileType);
						vo.setGoods_id(goods_id);
						vo.setId("admin");
						fileList.add(vo);
					}
					
					System.out.println(fileItem.getFieldName());
					System.out.println(fileItem.getName());
					System.out.println(fileItem.getSize( ) + "bytes");
					//request.setAttribute(fileItem.getFieldName(),fileItem.getName());
					//���ε��� ������ �����ϴ� ���
					if(fileItem.getSize() > 0){
						int idx = fileItem.getName().lastIndexOf("\\");
						if(idx ==-1){
							idx = fileItem.getName().lastIndexOf("/");
						}
						
						String fName = fileItem.getName().substring(idx+1);
						request.setAttribute(fileItem.getFieldName(),fName);
						try{
							System.out.println("���� ��ġ:"+filePath);
							 filePath=FILE_SERVER_DIR+"\\"+goods_id;
							uploadFile = new  File(filePath+"\\"+fName);
							
							fileItem.write(uploadFile);
							//System.out.println("uploadfile");
						}catch(IOException e){
							e.printStackTrace();
						}
						
					} //end if
				
				} //end if
			} //end for
			
			if(value==null){
				adminService.addImageFile(fileList);
			}else if(value.equals("mofify_goods_imageFile")){
				for(int i=0; i<fileList.size();i++){
					String id=fileNameList.get(i);
					ImageFileVO vo=fileList.get(i);
					vo.setImage_id(id);
				}
				adminService.modifyGoodsInfo(goodsVO,fileList);
				
			}else if(value.equals("add_goods_imageFile")){
				adminService.addImageFile(fileList);
			}
			
			RequestDispatcher dispatch = request.getRequestDispatcher("/admin/admin.do");  
			dispatch.forward(request, response);
	}catch(Exception e){
		e.printStackTrace();
	}
 }
 
  private void deleteImage(String image_id,String goods_id,String fileName) throws Exception{
	  String filePath=FILE_SERVER_DIR+"\\"+goods_id+"\\"+fileName;
	  System.out.println("filePath: "+filePath);
	  adminService.deleteImage(image_id);
	  
	  new  File(filePath).delete();
  }
}
