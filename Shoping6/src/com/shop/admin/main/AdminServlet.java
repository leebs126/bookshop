package com.shop.admin.main;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/admin/admin.do")
public class AdminServlet extends HttpServlet {
	AdminService service=new AdminService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doProcess(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException ,SQLException{
		request.setCharacterEncoding("euc-kr");
		String command = request.getParameter("command");
		String type = request.getParameter("type");
		System.out.println("command:" + command);
		System.out.println("type:" + type);

		if (command == null || command.equals("manage_goods")) {
			RequestDispatcher dis = request.getRequestDispatcher("/jsp/admin/main/admin_index.jsp");
			dis.forward(request, response);
		}else if(command.equals("search_goods")){
			RequestDispatcher dis = request.getRequestDispatcher("/jsp/admin/goods/admin_goods_list.jsp");
			dis.forward(request, response);
			
		}else if(command.equals("add_goods_page")){
			RequestDispatcher dis = request.getRequestDispatcher("/jsp/admin/goods/admin_add_goods.jsp");
			dis.forward(request, response);
			
		}else if(command.equals("add_goods")){
			String goods_sort = request.getParameter("goods_sort");
			String goods_title=request.getParameter("goods_title");
			String goods_writer=request.getParameter("goods_writer");
			String goods_publisher=request.getParameter("goods_publisher");
			String goods_price=request.getParameter("goods_price");
			
			String goods_sales_price=request.getParameter("goods_sales_price");
			String goods_point=request.getParameter("goods_point");
			String goods_published_date=request.getParameter("goods_published_date");
			String goods_page_total=request.getParameter("goods_page_total");
			String goods_isbn=request.getParameter("goods_isbn");
			
			String goods_delivery_date=request.getParameter("goods_delivery_date");
			String goods_type=request.getParameter("goods_type");
			String goods_contents_order = request.getParameter("goods_contents_order");
			String recommendation =request.getParameter("recommendation");
			
			String goods_writer_intro=request.getParameter("goods_writer_intro");
			String goods_intro=request.getParameter("goods_intro");
			String publisher_comment=request.getParameter("publisher_comment");
			
			/*
			System.out.println(goods_sort);
			System.out.println("목차:"+ goods_contents_order);
			System.out.println("추천사:"+ recommendation);
			System.out.println("목차 크기:"+ goods_contents_order.length()+"바이트");
			*/
			
			GoodsVO goodsVO=new GoodsVO();
			goodsVO.setGoods_sort(goods_sort);
			goodsVO.setGoods_title(goods_title);
			goodsVO.setGoods_writer(goods_writer);
			goodsVO.setGoods_publisher(goods_publisher);
			goodsVO.setGoods_price(Integer.parseInt(goods_price));
			
			goodsVO.setGoods_sales_price(Integer.parseInt(goods_sales_price));
			goodsVO.setGoods_point(Integer.parseInt(goods_point));
			goodsVO.setGoods_published_date(goods_published_date);
			goodsVO.setGoods_page_total(Integer.parseInt(goods_page_total));
			goodsVO.setGoods_isbn(goods_isbn);
			
			
			
			goodsVO.setGoods_delivery_date(goods_delivery_date);
			
			goodsVO.setGoods_type(goods_type);
			goodsVO.setGoods_contents_order(goods_contents_order);
			goodsVO.setRecommendation(recommendation);
			
			goodsVO.setGoods_writer_intro(goods_writer_intro);
			goodsVO.setGoods_intro(goods_intro);
			goodsVO.setPublisher_comment(publisher_comment);
			
			String goods_id=service.addGoods(goodsVO);
			
			request.setAttribute("goods_id", goods_id);
			RequestDispatcher dis = request.getRequestDispatcher("/jsp/admin/goods/admin_add_goods_file.jsp");
			dis.forward(request, response);
			
		}else{
			try {

				RequestDispatcher dis = request.getRequestDispatcher("/jsp/admin/main/admin_index.jsp");
				dis.forward(request, response);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
	
	private Date convertToDate(String _date){
		Date date=null;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
		 try {
			date = formatter.parse(_date);
		} catch (ParseException e) {
			e.printStackTrace();
		} 
		 
		 return date;
	}
}

