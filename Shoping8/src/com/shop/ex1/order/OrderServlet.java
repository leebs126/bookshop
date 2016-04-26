package com.shop.ex1.order;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.ex1.goods.GoodsVO;
import com.shop.ex1.member.MemberVO;

@WebServlet("/order/order.do")
public class OrderServlet extends HttpServlet {
	String command;
	OrderGoodsVO orderGoodsVO;
	String forwardPage = "/jsp/order/order_page.jsp";
	OrderService service;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doProcess(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doProcess(request, response);
	}

	public void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("euc-kr");
		service = new OrderService();
		orderGoodsVO = new OrderGoodsVO();
		ArrayList<OrderGoodsVO> orderList=new ArrayList<OrderGoodsVO>();
		
		try {
			command = request.getParameter("command");
			orderGoodsVO=new OrderGoodsVO();
			System.out.println("command:" + command);
			

			if (command.equals("order_goods")){
				String goods_id = request.getParameter("goods_id");
				String goods_title=request.getParameter("goods_title");
				int goods_qty=Integer.parseInt(request.getParameter("goods_qty"));
				String goods_sales_price=request.getParameter("goods_sales_price");
				String goods_fileName=request.getParameter("goods_fileName");
				System.out.println("good_id:" + goods_id);
				System.out.println("goods_sales_price:" + goods_sales_price);
				System.out.println("goods_qty: "+goods_qty);
				orderGoodsVO.setGoods_id(goods_id);
				orderGoodsVO.setGoods_title(goods_title);
				orderGoodsVO.setGoods_qty(goods_qty);
				orderGoodsVO.setGoods_sales_price(goods_sales_price);
				orderGoodsVO.setGoods_fileName(goods_fileName);
				
				//service.listOrderGoods(orderVO);
				orderList=new ArrayList<OrderGoodsVO>();
				orderList.add(orderGoodsVO);

				HttpSession session=request.getSession();
				MemberVO memberVO=(MemberVO)session.getAttribute("member_info");
				
				request.setAttribute("command", command);
				request.setAttribute("my_order_list", orderList);
				request.setAttribute("orderer", memberVO);
			}else if(command.equals("order_all_cart_goods")){
				String[] select_goods =request.getParameterValues("select_goods");
				for(int i=0; i<select_goods.length;i++){
					System.out.println(select_goods[i]);
				}
				
			}else if(command.equals("pay_order_goods")){
				String goods_id = request.getParameter("goods_id");
				String goods_title=request.getParameter("goods_title");
				String goods_fileName=request.getParameter("goods_fileName");
				
				int order_goods_qty=Integer.parseInt(request.getParameter("order_goods_qty"));
				int order_total_price=Integer.parseInt(request.getParameter("order_total_price"));
				String orderer_name=request.getParameter("orderer_name");
				String receiver_name=request.getParameter("receiver_name");
				String receiver_hp1=request.getParameter("receiver_hp1");
				String receiver_hp2=request.getParameter("receiver_hp2");
				String receiver_hp3=request.getParameter("receiver_hp3");
				String receiver_tel1=request.getParameter("receiver_tel1");
				String receiver_tel2=request.getParameter("receiver_tel2");
				String receiver_tel3=request.getParameter("receiver_tel3");
				
				String delivery_address=request.getParameter("delivery_address");
				String delivery_message=request.getParameter("delivery_message");
				String delivery_method=request.getParameter("delivery_method");
				String gift_wrapping=request.getParameter("gift_wrapping");
				String pay_method=request.getParameter("pay_method");
				String card_com_name=request.getParameter("card_com_name");
				String card_pay_month=request.getParameter("card_pay_month");
				String pay_orderer_hp_num=request.getParameter("pay_orderer_hp_num");
				
				HttpSession session=request.getSession();
				MemberVO memberVO=(MemberVO)session.getAttribute("member_info");
				String member_id=memberVO.getMember_id();
				
				orderGoodsVO.setMember_id(member_id);
				orderGoodsVO.setGoods_id(goods_id);
				orderGoodsVO.setGoods_title(goods_title);
				orderGoodsVO.setGoods_fileName(goods_fileName);
				orderGoodsVO.setOrder_goods_qty(order_goods_qty);
				orderGoodsVO.setOrder_total_price(order_total_price);
				orderGoodsVO.setOrderer_name(orderer_name);
				orderGoodsVO.setReceiver_name(receiver_name);
				
				orderGoodsVO.setReceiver_hp1(receiver_hp1);
				orderGoodsVO.setReceiver_hp2(receiver_hp2);
				orderGoodsVO.setReceiver_hp3(receiver_hp3);
				orderGoodsVO.setReceiver_tel1(receiver_tel1);
				orderGoodsVO.setReceiver_tel2(receiver_tel2);
				orderGoodsVO.setReceiver_tel3(receiver_tel3);
				
				orderGoodsVO.setDelivery_address(delivery_address);
				orderGoodsVO.setDelivery_message(delivery_message);
				orderGoodsVO.setDelivery_method(delivery_method);
				orderGoodsVO.setGift_wrapping(gift_wrapping);
				orderGoodsVO.setPay_method(pay_method);
				orderGoodsVO.setCard_com_name(card_com_name);
				orderGoodsVO.setCard_pay_month(card_pay_month);
				orderGoodsVO.setPay_orderer_hp_num(pay_orderer_hp_num);
				
				
				System.out.println("order_goods_qty:"+order_goods_qty);
				System.out.println("order_total_price:"+order_total_price);
				
				service.addOrderGoods(orderGoodsVO);
				//response.addHeader("Refresh","1;url=order_result");
				session.setAttribute("my_order_info",orderGoodsVO);
				response.sendRedirect("order.do?command=order_result");
				//request.setAttribute("command", "order_result");
				//forwardPage="order.do";
				return;
			}else if(command.equals("order_result")){
				HttpSession session=request.getSession();
				MemberVO memberVO=(MemberVO)session.getAttribute("member_info");
				OrderGoodsVO my_order_info=(OrderGoodsVO)session.getAttribute("my_order_info");
				
				String order_id=my_order_info.getOrder_id();
				orderGoodsVO.setOrder_id(order_id);
				ArrayList<OrderGoodsVO> my_order_goods_list= service.listMyOrderGoods( orderGoodsVO);
				
				request.setAttribute("orderer", memberVO);
				request.setAttribute("my_order_info",my_order_info);
				request.setAttribute("command", command);
				request.setAttribute("my_order_goods_list", my_order_goods_list);
			}
			
			RequestDispatcher dis = request.getRequestDispatcher(forwardPage);
			dis.forward(request, response);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

