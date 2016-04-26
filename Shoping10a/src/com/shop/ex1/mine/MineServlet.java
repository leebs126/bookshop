package com.shop.ex1.mine;

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

@WebServlet("/mine/mine.do")
public class MineServlet extends HttpServlet {
	String command;
	String forwardPage = "/jsp/mine/mine_page.jsp";
	HttpSession session;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doProcess(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doProcess(request, response);
	}

	public void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("euc-kr");
		
		try {
			command = request.getParameter("command");
			System.out.println("command:" + command);

			if(command.equals("mypage_list")){
				request.setAttribute("command", command);
			}
			
			RequestDispatcher dis = request.getRequestDispatcher(forwardPage);
			dis.forward(request, response);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

