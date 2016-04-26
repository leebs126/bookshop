package com.shop.ex1.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.shop.ex1.goods.GoodsDAO;
import com.shop.ex1.notice.NoticeDAO;

public class NoticeAction extends Action{
	GoodsDAO goodsDAO;
	NoticeDAO noticeDAO;
	HttpSession session;
	
	public ActionForward  execute ( ActionMapping  mapping , ActionForm form , 
			HttpServletRequest  request , HttpServletResponse response ) throws Exception {

		session=request.getSession();
		session.setAttribute("side_menu", "user");
		
		GoodsDAO goodsDAO = new GoodsDAO();
		NoticeDAO noticeDAO = new NoticeDAO();

		ArrayList notice_list = noticeDAO.listNotice();
		request.setAttribute("notice_list", notice_list);
		//mapping.setAttribute("goods_list",goods_list);
		
		return  mapping.findForward("mainPage");
	}
	
	
	/*public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		doProcess(request,response);
	}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		doProcess(request,response);
	}
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		 * response.setContentType("text/html;charset=euc-kr"); PrintWriter
		 * out=response.getWriter();
		 
		session=request.getSession();
		session.setAttribute("side_menu", "user");
		
		GoodsDAO goodsDAO = new GoodsDAO();
		NoticeDAO noticeDAO = new NoticeDAO();

		ArrayList goods_list;
		try {
			goods_list = goodsDAO.list();

			ArrayList notice_list = noticeDAO.listNotice();

			request.setAttribute("goods_list", goods_list);
			request.setAttribute("notice_list", notice_list);
			//RequestDispatcher dis = request.getRequestDispatcher("/jsp/layout/layout.jsp");
			//request.setAttribute("command", "mainLayout");
			RequestDispatcher dis = request.getRequestDispatcher("/jsp/main/homepage.jsp");
			dis.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
*/
}
