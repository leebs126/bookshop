package com.shop.ex1.cart;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/cart/cart.do")
public class CartServlet extends HttpServlet {
	CartService service;
	CartVO cartVO;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doProcess(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doProcess(request, response);
	}

	public void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("euc-kr");
		String forwardPath="/jsp/cart/cart_page.jsp";
		service = new CartService();
		cartVO = new CartVO();
		try {
			String command = request.getParameter("command");
			String goods_id = request.getParameter("goods_id");
			System.out.println("command: " + command);
			System.out.println("goods_id: " + goods_id);
			
			if(command.equals("add_cart")){
				PrintWriter pw=response.getWriter();
				HttpSession session=request.getSession();
				MemberVO memberVO=(MemberVO)session.getAttribute("member_info");
				
				String member_id=memberVO.getMember_id();
				cartVO.setMember_id(member_id);
				//카트 등록전에 이미 등록된 제품인지 판별한다.
				cartVO.setGoods_id(goods_id);
				cartVO.setMember_id(member_id);
				boolean isAreadyExisted=service.searchCart(cartVO);
				System.out.println("isAreadyExisted:"+isAreadyExisted);
				if(isAreadyExisted==true){
					pw.print("already_existed");
				}else{
					service.addCart(cartVO);
					pw.print("add_success");	
				}
				
				pw.close();
				return ;
			}else if(command.equals("my_cart_list")){
				ArrayList<GoodsVO> my_cart_list=new ArrayList<GoodsVO>();
				HttpSession session=request.getSession();
				MemberVO memberVO=(MemberVO)session.getAttribute("member_info");
				
				String member_id=memberVO.getMember_id();
				cartVO.setMember_id(member_id);
				my_cart_list=service.listMyCart(cartVO);
				request.setAttribute("my_cart_list", my_cart_list);
				
			}else if(command.equals("modify_cart_qty")){
				PrintWriter pw=response.getWriter();
				HttpSession session=request.getSession();
				String member_id=(String)session.getAttribute("member_id");
				String goods_qty = request.getParameter("goods_qty");
				System.out.println("goods_qty: " + goods_qty);
				cartVO.setGoods_id(goods_id);
				cartVO.setMember_id(member_id);
				cartVO.setGoods_qty(Integer.parseInt(goods_qty));
				boolean result=service.modifyCartQty(cartVO);
				
				if(result==true){
					pw.print("modify_success");
				}else{
					pw.print("modify_failed");	
				}
				
				pw.close();
				return ;
			}
			
			request.setAttribute("command", command);
			RequestDispatcher dis=request.getRequestDispatcher(forwardPath);
			dis.forward(request,response);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			
		}
	}
}
