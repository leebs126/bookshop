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
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	 throws IOException,ServletException{
		/*response.setContentType("text/html;charset=euc-kr");
		PrintWriter out=response.getWriter();
		*/
		GoodsDAO dao=new GoodsDAO();
		ArrayList goods_list=dao.list();

		/*System.out.println("BoardFrontController »£√‚");
		BoardService service=new BoardService();
		ArrayList<BoardBean> list=new ArrayList<BoardBean>();
		BoardBean bean=new BoardBean();
		
		list =service.listBoard(bean);
		request.setAttribute("list",list);*/
		request.setAttribute("goods_list",goods_list);
		RequestDispatcher dis=request.getRequestDispatcher("/jsp/main/index.jsp");
		dis.forward(request,response);
				
	}

}
