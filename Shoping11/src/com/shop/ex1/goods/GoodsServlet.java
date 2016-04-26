package com.shop.ex1.goods;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/goods/goods.do")
public class GoodsServlet extends HttpServlet {
	String command;
	GoodsVO goodsVO;
	ArrayList<GoodsVO> sticky_goods_list; //최근 본 상품 저장 ArrayList
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
				boolean already_existed=false;
				
				goodsVO=service.goods_detail(goods_id);
				
				HttpSession session=request.getSession();
				sticky_goods_list=(ArrayList<GoodsVO>)session.getAttribute("sticky_goods_list");
				
				if(sticky_goods_list!=null){
					if(sticky_goods_list.size()<4){ //미리본 상품 리스트에 상품개수가 세개 이하인 경우
						for(int i=0; i<sticky_goods_list.size();i++){
							GoodsVO _goodsVO=(GoodsVO)sticky_goods_list.get(i);
							if(goods_id.equals(_goodsVO.getGoods_id())){
								already_existed=true;
								break;
							}
						}
						if(already_existed==false){
							sticky_goods_list.add(goodsVO);
						}
						session.setAttribute("sticky_goods_list",sticky_goods_list);
					}
					
				}else{
					sticky_goods_list =new ArrayList<GoodsVO>();
					sticky_goods_list.add(goodsVO);
					session.setAttribute("sticky_goods_list",sticky_goods_list);
					
					
					
				}
				
				session.setAttribute("sticky_list_num", sticky_goods_list.size());
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
