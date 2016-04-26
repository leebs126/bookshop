package com.shop.ex1.download;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/download.do")
public class DownLoadServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException,IOException{
			doProcess(request, response);
		}
		
		protected void doPost(HttpServletRequest request,HttpServletResponse response)
		  throws ServletException, IOException{
			doProcess(request, response);
		}
		  
		
		protected void doProcess(HttpServletRequest request,HttpServletResponse response)
		  throws ServletException, IOException{
			request.setCharacterEncoding("EUC-KR");
			response.setContentType("text/html; charset=EUC-KR");
			
			//자바 I/O를 이용해서 파일을 전송한다.
			String file = (String)request.getParameter("fileName");
			OutputStream out = response.getOutputStream();
			String fileName="c:\\repo\\"+file;
			File f=new File(fileName);
			//response.setHeader("Cache-Control", "no-cache");
			//response.addHeader("Content-disposition", "attachment; filename=" + fileName);
			FileInputStream in=new FileInputStream(f); //파일을 읽어온다.
			
			byte[] buffer=new byte[1024*8];
			while(true){
				int count=in.read(buffer); //버퍼에 읽어들인 문자개수
				if(count==-1)  //버퍼의 마지막에 도달했는지 체크
					break;
				out.write(buffer,0,count);
			}
			
			in.close();
			out.close();
	    }

}
