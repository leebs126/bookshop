package com.shop.ex1.goods;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.shop.ex1.goods.GoodsDAO;
import com.shop.ex1.notice.NoticeDAO;

public class GoodsAction extends Action{
	GoodsDAO goodsDAO;
	NoticeDAO noticeDAO;
	HttpSession session;
	String command;
	GoodsVO goodsVO;
	ArrayList<GoodsVO> sticky_goods_list; //최근 본 상품 저장 ArrayList
	public ActionForward  execute ( ActionMapping  mapping , ActionForm form , 
			HttpServletRequest  request , HttpServletResponse response ) throws Exception {

		request.setCharacterEncoding("euc-kr");
			GoodsService service=new GoodsService();
			
			command = request.getParameter("command");
			String type=request.getParameter("type");
			System.out.println("command:" + command);
			System.out.println("type:" + type);

			if (command.equals("goods_list")) {
				if(type.equals("computer")){
					int chapter=1;
					String _chapter=request.getParameter("chapter");
					if(_chapter==null)
						chapter=1;
					else
						chapter=Integer.parseInt(_chapter);
					
					GoodsVO goodsVO=new GoodsVO();
					goodsVO.setGoods_type("newbook");
					ArrayList goods_list = service.list(goodsVO);
					request.setAttribute("newbook_list", goods_list);
					
					goodsVO.setGoods_type("bestseller");
					goods_list = service.list(goodsVO);
					request.setAttribute("bestseller_list", goods_list);
					request.setAttribute("chapter", chapter);
				}else {
						/*ArrayList goods_list = service.list(type);
						request.setAttribute("goods_main", goods_list);*/
				}
			}else if(command.equals("goods_search")){
				String _searchWord = request.getParameter("searchWord");
				ArrayList goods_search_list = service.list(_searchWord);
				request.setAttribute("goods_search_list",goods_search_list);
			}else if (command.equals("goods_detail")){
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
		
		return  mapping.findForward(  command );
	}
	
	
}
