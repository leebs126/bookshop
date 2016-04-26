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
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		doProcess(request,response);
	}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		doProcess(request,response);
	}

	
	public void doProcess(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		request.setCharacterEncoding("euc-kr");
		try{
			GoodsService service=new GoodsService();
			
			command = request.getParameter("command");
			String type=request.getParameter("type");
			System.out.println("command:" + command);
			System.out.println("type:" + type);

			if (command.equals("goods_main")) {
				if(type.equals("computer")){
/*					RequestDispatcher dis = request.getRequestDispatcher("/jsp/goods/goods_list_page.jsp");
					dis.forward(request, response);
*/				
					
				}else {
						ArrayList goods_list = service.list();
						request.setAttribute("goods_main", goods_list);
/*						RequestDispatcher dis = request.getRequestDispatcher("/jsp/main/index.jsp");
						dis.forward(request, response);
*/				}
			}else if(command.equals("goods_search")){
				String _searchWord = request.getParameter("searchWord");
				ArrayList goods_search_list = service.list(_searchWord);
				request.setAttribute("goods_search_list",goods_search_list);
			}
			
			else if (command.equals("goods_detail")){
				String goods_id = request.getParameter("goods_id");
				goodsVO=service.goods_detail(goods_id);
				request.setAttribute("goods",goodsVO);
				
		}
			request.setAttribute("command", command);
			RequestDispatcher dis=request.getRequestDispatcher("/jsp/goods/goods_page.jsp");
			dis.forward(request,response);
		
		}catch(Exception e){
			e.printStackTrace();
		}
				
	}
	

}
