package com.shop.ex1.goods;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/goods/goods.do")
public class GoodsServlet extends HttpServlet {
	String command;
	GoodsVO goodsVO;
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	 throws IOException,ServletException{
		try{
			GoodsService service=new GoodsService();
			
			command = request.getParameter("command");
			System.out.println("command:" + command);

			if (command.equals("goods_list")) {
				ArrayList goods_list = service.list();
				request.setAttribute("goods_list", goods_list);
				RequestDispatcher dis = request.getRequestDispatcher("/jsp/main/index.jsp");
				dis.forward(request, response);
			} else if (command.equals("goods_detail")){
				String goods_id = request.getParameter("goods_id");
				goodsVO=service.goods_detail(goods_id);
				request.setAttribute("goods",goodsVO);
				RequestDispatcher dis=request.getRequestDispatcher("/jsp/goods/goods_detail.jsp");
				dis.forward(request,response);
		}
		
		}catch(Exception e){
			e.printStackTrace();
		}
				
	}

}
