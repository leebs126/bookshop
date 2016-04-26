package com.shop.admin.main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.ex1.goods.GoodsService;

@WebServlet("/admin/admin.do")
public class AdminServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	public void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String command = request.getParameter("command");
		String type = request.getParameter("type");
		System.out.println("command:" + command);
		System.out.println("type:" + type);

		if (command == null || command.equals("admin_index")) {
			RequestDispatcher dis = request.getRequestDispatcher("/jsp/admin/main/admin_index.jsp");
			dis.forward(request, response);
		}else if(command.equals("search_goods")){
			RequestDispatcher dis = request.getRequestDispatcher("/jsp/admin/goods/admin_goods_list.jsp");
			dis.forward(request, response);
			
		}else if(command.equals("add_goods")){
			RequestDispatcher dis = request.getRequestDispatcher("/jsp/admin/goods/admin_add_goods.jsp");
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
}
