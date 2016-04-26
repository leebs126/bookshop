package com.shop.ex1.order;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.shop.ex1.common.mail.MailSender;
import com.shop.ex1.goods.GoodsDAO;
import com.shop.ex1.goods.GoodsVO;
import com.shop.ex1.member.MemberVO;
import com.shop.ex1.notice.NoticeDAO;

public class OrderAction extends Action{
	String command;
	OrderGoodsVO orderGoodsVO;
	String forwardPage = "/jsp/order/order_page.jsp";
	OrderService service;
	HttpSession session;
	
	public ActionForward  execute ( ActionMapping  mapping , ActionForm form , 
			HttpServletRequest  request , HttpServletResponse response ) throws Exception {
		request.setCharacterEncoding("euc-kr");
		service = new OrderService();
		orderGoodsVO = new OrderGoodsVO();
		ArrayList<OrderGoodsVO> orderList=new ArrayList<OrderGoodsVO>();
		session=request.getSession();
		session.setAttribute("side_menu", "user");
		
		command = request.getParameter("command");
		orderGoodsVO=new OrderGoodsVO();
		System.out.println("command:" + command);

		if (command.equals("order_goods")){
			String goods_id = request.getParameter("goods_id");
			String goods_title=request.getParameter("goods_title");
			int order_goods_qty=Integer.parseInt(request.getParameter("select_goods_qty"));
			int goods_sales_price=Integer.parseInt(request.getParameter("goods_sales_price"));
			String fileName=request.getParameter("fileName");
			/*System.out.println("good_id:" + goods_id);
			System.out.println("goods_sales_price:" + goods_sales_price);
			System.out.println("goods_qty: "+goods_qty);
			System.out.println("goods_fileName:"+goods_fileName);*/
			orderGoodsVO.setGoods_id(goods_id);
			orderGoodsVO.setGoods_title(goods_title);
			orderGoodsVO.setOrder_goods_qty(order_goods_qty);
			orderGoodsVO.setGoods_sales_price(goods_sales_price);
			orderGoodsVO.setFileName(fileName);
			
			//service.listOrderGoods(orderVO);
			orderList=new ArrayList<OrderGoodsVO>();
			orderList.add(orderGoodsVO);

			HttpSession session=request.getSession();
			MemberVO memberVO=(MemberVO)session.getAttribute("member_info");
			
			session.setAttribute("my_order_list", orderList);
			session.setAttribute("orderer", memberVO);
			request.setAttribute("command", command);
		}else if(command.equals("order_all_cart_goods")){
			String[] select_goods_ids =request.getParameterValues("select_goods");
			String[] select_goods_qty =request.getParameterValues("select_goods_qty");
			session=request.getSession();
			ArrayList<GoodsVO> my_cart_list=(ArrayList<GoodsVO>)session.getAttribute("my_cart_list");
			MemberVO memberVO=(MemberVO)session.getAttribute("member_info");
			
			for(int i=0; i<select_goods_ids.length;i++){
				//System.out.println("select_goods: "+select_goods_ids[i]);
				String goods_id=select_goods_ids[i];
			
				for(int j=0; i<select_goods_qty.length;i++){
					//System.out.println("select_goods_qty: "+select_goods_qty[i]);
					String[] temp=select_goods_qty[i].split(":");
					if(goods_id.equals(temp[0])){
						OrderGoodsVO orderGoodsVO=new OrderGoodsVO();
						int order_goods_qty=Integer.parseInt(temp[1]);
					//	System.out.println("goods_id:"+goods_id+", 주문 수량:"+order_goods_qty);
						orderGoodsVO.setGoods_id(goods_id);
						orderGoodsVO.setOrder_goods_qty(order_goods_qty);

						
						for(int k=0; k<my_cart_list.size();k++){
							GoodsVO goodsVO=my_cart_list.get(i);
							if(goods_id.equals(goodsVO.getGoods_id())){
								String goods_title=goodsVO.getGoods_title();
								int goods_sales_price=Integer.parseInt(goodsVO.getGoods_sales_price());
								String fileName=goodsVO.getFileName();
								/*System.out.println("good_id:" + goods_id);
								System.out.println("goods_title:"+goods_title);
								System.out.println("goods_sales_price:" + goods_sales_price);
								System.out.println("goods_fileName: "+goods_fileName);*/
								orderGoodsVO.setGoods_id(goods_id);
								orderGoodsVO.setGoods_title(goods_title);
								orderGoodsVO.setGoods_sales_price(goods_sales_price);
								orderGoodsVO.setFileName(fileName);
								break;
							}
						} //end for
						
						orderList.add(orderGoodsVO);
						break;
					}
				}
			} //end for
			session.setAttribute("my_order_list", orderList);
			request.setAttribute("command", command);
			session.setAttribute("orderer", memberVO);
			
			/*for(int i=0; i<select_goods_qty.length;i++){
				System.out.println("select_goods_qty: "+select_goods_qty[i]);
			}
			*/
		}else if(command.equals("pay_order_goods")){
			OrderGoodsVO my_order_info=null;
			HttpSession session=request.getSession();
			MemberVO memberVO=(MemberVO)session.getAttribute("member_info");
			String member_id=memberVO.getMember_id();
			String orderer_name=memberVO.getMember_name();
			
			ArrayList<OrderGoodsVO> my_order_list=(ArrayList<OrderGoodsVO>)session.getAttribute("my_order_list");
			
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
			
			for(int i=0; i<my_order_list.size();i++){
				OrderGoodsVO orderGoodsVO =(OrderGoodsVO)my_order_list.get(i);
				orderGoodsVO.setMember_id(member_id);
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
				my_order_list.set(i, orderGoodsVO); //각 VO에 주문자 정보를 세팅한 후 다시 my_order_list에 저장한다.
				session.setAttribute("my_order_list", my_order_list);
				service.addOrderGoods(my_order_list);
				//response.addHeader("Refresh","1;url=order_result");
				if(i==0){
					my_order_info=(OrderGoodsVO)my_order_list.get(i);
					session.setAttribute("my_order_info",my_order_info);//OrderGoodsVO로 JSP에서  주문자 정보를 표시한다.
				}
			}//end for
			
							
			sendOrderEMail(my_order_info, memberVO);
			response.sendRedirect("order.do?command=order_result");
			
			return null;
		}else if(command.equals("order_result")){
			request.setAttribute("command", command);
			HttpSession session=request.getSession();
			MemberVO memberVO=(MemberVO)session.getAttribute("member_info");
			String member_id=memberVO.getMember_id();
			orderGoodsVO.setMember_id(member_id);
			ArrayList<OrderGoodsVO> my_order_goods_list= service.listMyOrderGoods( orderGoodsVO);
			
			request.setAttribute("command", command);
			request.setAttribute("my_order_goods_list", my_order_goods_list);
		}
		
		return  mapping.findForward(command);
	}
	
	private void sendOrderEMail(OrderGoodsVO my_order_info,MemberVO orderer) throws Exception{
		//주문자에게 메일을 보낸다.
		String from="leebs126@gmail.com";
		String to=orderer.getEmail1()+"@"+orderer.getEmail2();
		String cc="";
		String subject="쇼핑몰에서 보낸 메일입니다.";
		
		String content="쇼핑몰에서 주문한 제품 정보입니다.\n\n";
		
		content+="-----------------------------------------\n" 
				+" 주문자:"+my_order_info.getOrderer_name()+"\n"
				+" 수령인:"+my_order_info.getReceiver_name()+"\n"
				+" 제품명:"+my_order_info.getGoods_title()+"\n"
				+" 제품 가격:"+my_order_info.getGoods_sales_price()+"\n"
				+" 제품 수량:"+my_order_info.getGoods_qty()+"\n"
				+" 배달 주소:"+my_order_info.getDelivery_address();
		MailSender.sendEmail(from, to, cc, subject, content);
	}
}
