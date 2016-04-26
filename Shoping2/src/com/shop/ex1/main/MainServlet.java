package com.shop.ex1.main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.ex1.goods.GoodsDAO;
import com.shop.ex1.notice.NoticeDAO;

@WebServlet("/main/index.do")
public class MainServlet extends HttpServlet {
	GoodsDAO  goodsDAO;
	NoticeDAO noticeDAO;
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	 throws IOException,ServletException{
		/*response.setContentType("text/html;charset=euc-kr");
		PrintWriter out=response.getWriter();
		*/
		GoodsDAO goodsDAO=new GoodsDAO();
		NoticeDAO noticeDAO=new NoticeDAO();
		
		ArrayList goods_list=goodsDAO.list();
		ArrayList notice_list=noticeDAO.list();

		request.setAttribute("goods_list",goods_list);
		request.setAttribute("notice_list",notice_list);
		RequestDispatcher dis=request.getRequestDispatcher("/jsp/main/index.jsp");
		dis.forward(request,response);
				
	}

}
