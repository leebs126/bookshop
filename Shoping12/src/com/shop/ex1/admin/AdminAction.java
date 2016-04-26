package com.shop.ex1.admin;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.shop.ex1.goods.GoodsVO;
import com.shop.ex1.order.OrderGoodsVO;

public class AdminAction extends Action{
	HttpSession session;
	AdminService service=new AdminService();
	
	public ActionForward  execute ( ActionMapping  mapping , ActionForm form , 
			HttpServletRequest  request , HttpServletResponse response ) throws Exception {

		//request.setCharacterEncoding("tfu-8");
		//request.setCharacterEncoding("euc-kr");
		String command = request.getParameter("command");
		String type = request.getParameter("type");
		System.out.println("command:" + command);
		System.out.println("type:" + type);
		
		session=request.getSession();  //사이드 메뉴를 설정한다.
		session.setAttribute("side_menu", "admin_mode");
		request.setAttribute("command",command);
		if (command == null || command.equals("manage_goods")) {
			String _chapter=null,_pageNum=null,period;
			int curChapter=0,curPageNum=0;
			period=request.getParameter("period");
			_chapter=request.getParameter("chapter");
			_pageNum=request.getParameter("pageNum");
			
			if(_chapter==null){
				curChapter=1;
			}else{
				curChapter=Integer.parseInt(_chapter);
			}
			if(_pageNum==null){
				curPageNum=1;
			}else{
				curPageNum=Integer.parseInt(_pageNum);
			}
			HashMap<String,Object> search_con=new HashMap<String,Object>();
			String date_con=calcPeriod(period);
			String date[] =date_con.split(",");
			
			search_con.put("chapter",curChapter);
			search_con.put("pageNum",curPageNum);
			search_con.put("beginDate",date[0]);
			search_con.put("endDate", date[1]);
			ArrayList<GoodsVO> new_goods_list=service.listNewGoods(search_con);
			request.setAttribute("new_goods_list", new_goods_list);
			request.setAttribute("chapter", curChapter);
			request.setAttribute("pageNum", curPageNum);
		}else if(command.equals("search_goods")){
			String _chapter=null,_pageNum=null,period;
			int curChapter=0,curPageNum=0;
			period=request.getParameter("period");
			_chapter=request.getParameter("chapter");
			_pageNum=request.getParameter("pageNum");
			
			if(_chapter==null){
				curChapter=1;
			}else{
				curChapter=Integer.parseInt(_chapter);
			}
			
			if(_pageNum==null){
				curPageNum=1;
			}else{
				curPageNum=Integer.parseInt(_pageNum);
			}
			
			HashMap<String,Object> search_con=new HashMap<String,Object>();
			String date_con=calcPeriod(period);
			String date[] =date_con.split(",");
			
			search_con.put("chapter",curChapter);
			search_con.put("pageNum",curPageNum);
			search_con.put("beginDate",date[0]);
			search_con.put("endDate", date[1]);
			ArrayList<GoodsVO> new_goods_list=service.listNewGoods(search_con);
			request.setAttribute("new_goods_list", new_goods_list);
			request.setAttribute("chapter", curChapter);
			request.setAttribute("pageNum", curPageNum);
		}else if(command.equals("add_goods_page")){
			
		}else if(command.equals("add_goods")){
			String goods_id=request.getParameter("goods_id");
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
			
			String goods_delivery_price=request.getParameter("goods_delivery_price");
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
			
			goodsVO.setGoods_sales_price(goods_sales_price);
			goodsVO.setGoods_point(Integer.parseInt(goods_point));
			goodsVO.setGoods_published_date(goods_published_date);
			goodsVO.setGoods_page_total(Integer.parseInt(goods_page_total));
			goodsVO.setGoods_isbn(goods_isbn);
			
			
			goodsVO.setGoods_delivery_price(goods_delivery_price);
			goodsVO.setGoods_delivery_date(goods_delivery_date);
			
			goodsVO.setGoods_type(goods_type);
			goodsVO.setGoods_contents_order(goods_contents_order);
			goodsVO.setRecommendation(recommendation);
			
			goodsVO.setGoods_writer_intro(goods_writer_intro);
			goodsVO.setGoods_intro(goods_intro);
			goodsVO.setPublisher_comment(publisher_comment);
			
			
			session.setAttribute("goodsVO",goodsVO );
			response.sendRedirect("/Shoping12/admin/admin.do?command=add_goods_imagefile&goods_id="+goods_id);
			return null;
			
		}else if(command.equals("add_goods_imagefile")){
			String goods_id=request.getParameter("goods_id");
			request.setAttribute("goods_id", goods_id);
		}else if(command.equals("modify_goods_page")){
			String goods_id=request.getParameter("goods_id");
			GoodsVO goodsVO=service.goods_detail(goods_id);
			request.setAttribute("goods",goodsVO);
			
		}else if(command.equals("modify_goods_info")){
			PrintWriter pw=response.getWriter();
			GoodsVO goodsVO=new GoodsVO();
			String goods_id=request.getParameter("goods_id");
			String mod_type=request.getParameter("mod_type");
			String value =request.getParameter("value");
			HashMap<String,String> goodsMap=new HashMap<String,String>();
			goodsMap.put("goods_id", goods_id);
			goodsMap.put(mod_type, value);

			
			service.modifyGoodsInfo(goodsMap);
			pw.print("mod_success");
			pw.close();
			return null;
		}else if(command.equals("modify_goods_image_page")){
			String goods_id=request.getParameter("goods_id");
			ArrayList imageFileList = service.goods_image_file(goods_id);
			session.setAttribute("goods_id", goods_id);
			session.setAttribute("imageFileList", imageFileList);
		}
		
		else if(command.equals("manage_order")){
			
		}else if(command.equals("list_simple_order_goods")){
			String _chapter=null,_pageNum=null,period;
			int curChapter=0,curPageNum=0;
			period=request.getParameter("period");
			_chapter=request.getParameter("chapter");
			_pageNum=request.getParameter("pageNum");
			
			if(_chapter==null){
				curChapter=1;
			}else{
				curChapter=Integer.parseInt(_chapter);
			}
			
			if(_pageNum==null){
				curPageNum=1;
			}else{
				curPageNum=Integer.parseInt(_pageNum);
			}
			
			HashMap<String,Object> search_con=new HashMap<String,Object>();
			String date_con=calcPeriod(period);
			String date[] =date_con.split(",");
			
			search_con.put("chapter",curChapter);
			search_con.put("pageNum",curPageNum);
			search_con.put("beginDate",date[0]);
			search_con.put("endDate", date[1]);
			ArrayList<OrderGoodsVO> order_goods_list=service.listOrderGoods(search_con);
			request.setAttribute("order_goods_list", order_goods_list);
			request.setAttribute("chapter", curChapter);
			request.setAttribute("pageNum", curPageNum);
			
		}else if(command.equals("list_detail_order_goods")){
			String _chapter=null,_pageNum=null,period;
			int curChapter=0,curPageNum=0;
			String beginDate=request.getParameter("beginDate");
			String endDate=request.getParameter("endDate");
			String search_type=request.getParameter("search_type");
			String search_word=request.getParameter("search_word");
			
			_chapter=request.getParameter("chapter");
			_pageNum=request.getParameter("pageNum");
			
			if(_chapter==null){
				curChapter=1;
			}else{
				curChapter=Integer.parseInt(_chapter);
			}
			
			if(_pageNum==null){
				curPageNum=1;
			}else{
				curPageNum=Integer.parseInt(_pageNum);
			}
			
			HashMap<String,Object> search_con=new HashMap<String,Object>();
			
			search_con.put("chapter",curChapter);
			search_con.put("pageNum",curPageNum);
			search_con.put("beginDate",beginDate);
			search_con.put("endDate", endDate);
			search_con.put("search_type", search_type);
			search_con.put("search_word", search_word);
			
			ArrayList<OrderGoodsVO> order_goods_list=service.listOrderGoods(search_con);
			request.setAttribute("order_goods_list", order_goods_list);
			request.setAttribute("chapter", curChapter);
			request.setAttribute("pageNum", curPageNum);
			
		}else if(command.equals("modify_delivery_state")){
			PrintWriter pw=response.getWriter();
			String order_id=request.getParameter("order_id");
			String mod_type=request.getParameter("mod_type");
			String value=request.getParameter("value");

			HashMap<String,String> orderMap=new HashMap<String,String>();
			orderMap.put("order_id", order_id);
			orderMap.put(mod_type, value);
			
			service.modifyOrderGoods(orderMap);
			pw.print("mod_success");
			pw.close();
			
			
			return null;
			
		}
		
		
		return  mapping.findForward(command);
	}
	
	private String calcPeriod(String search_period){
		String beginDate=null;
		String endDate=null;
		String endYear=null;
		String endMonth=null;
		String endDay=null;
		String beginYear=null;
		String beginMonth=null;
		String beginDay=null;
		
		if(search_period==null || search_period.equals("four_month") ){ //페이지 첫 접속시
			DecimalFormat df = new DecimalFormat("00");
			Calendar cal=Calendar.getInstance();
			endYear   = Integer.toString(cal.get(Calendar.YEAR));
			endMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			endDay   = df.format(cal.get(Calendar.DATE));
			endDate = endYear +"-"+ endMonth +"-"+endDay;
			
			cal.add(cal.MONTH,-4);
			beginYear   = Integer.toString(cal.get(Calendar.YEAR));
			beginMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			beginDay   = df.format(cal.get(Calendar.DATE));
			beginDate = beginYear +"-"+ beginMonth +"-"+beginDay;
		}else if(search_period.equals("today")){
			DecimalFormat df = new DecimalFormat("00");
			Calendar cal=Calendar.getInstance();
			endYear   = Integer.toString(cal.get(Calendar.YEAR));
			endMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			endDay   = df.format(cal.get(Calendar.DATE));
			endDate = endYear +"-"+ endMonth +"-"+endDay;
			
			//cal.add(cal.DATE,-1);
			beginYear   = Integer.toString(cal.get(Calendar.YEAR));
			beginMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			beginDay   = df.format(cal.get(Calendar.DATE));
			beginDate = beginYear +"-"+ beginMonth +"-"+beginDay;
		}else if(search_period.equals("one_week")){
			DecimalFormat df = new DecimalFormat("00");
			Calendar cal=Calendar.getInstance();
			endYear   = Integer.toString(cal.get(Calendar.YEAR));
			endMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			endDay   = df.format(cal.get(Calendar.DATE));
			endDate = endYear +"-"+ endMonth +"-"+endDay;
			
			cal.add(cal.DATE,-7);
			beginYear   = Integer.toString(cal.get(Calendar.YEAR));
			beginMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			beginDay   = df.format(cal.get(Calendar.DATE));
			beginDate = beginYear +"-"+ beginMonth +"-"+beginDay;
		}else if(search_period.equals("two_week")){
			DecimalFormat df = new DecimalFormat("00");
			Calendar cal=Calendar.getInstance();
			endYear   = Integer.toString(cal.get(Calendar.YEAR));
			endMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			endDay   = df.format(cal.get(Calendar.DATE));
			endDate = endYear +"-"+ endMonth +"-"+endDay;
			
			cal.add(cal.DATE,-14);
			beginYear   = Integer.toString(cal.get(Calendar.YEAR));
			beginMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			beginDay   = df.format(cal.get(Calendar.DATE));
			beginDate = beginYear +"-"+ beginMonth +"-"+beginDay;
		}else if (search_period.equals("one_month")){
			DecimalFormat df = new DecimalFormat("00");
			Calendar cal=Calendar.getInstance();
			endYear   = Integer.toString(cal.get(Calendar.YEAR));
			endMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			endDay   = df.format(cal.get(Calendar.DATE));
			endDate = endYear +"-"+ endMonth +"-"+endDay;
			
			cal.add(cal.MONTH,-1);
			beginYear   = Integer.toString(cal.get(Calendar.YEAR));
			beginMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			beginDay   = df.format(cal.get(Calendar.DATE));
			beginDate = beginYear +"-"+ beginMonth +"-"+beginDay;
		}else if (search_period.equals("two_month")){
			DecimalFormat df = new DecimalFormat("00");
			Calendar cal=Calendar.getInstance();
			endYear   = Integer.toString(cal.get(Calendar.YEAR));
			endMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			endDay   = df.format(cal.get(Calendar.DATE));
			endDate = endYear +"-"+ endMonth +"-"+endDay;
			
			cal.add(cal.MONTH,-2);
			beginYear   = Integer.toString(cal.get(Calendar.YEAR));
			beginMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			beginDay   = df.format(cal.get(Calendar.DATE));
			beginDate = beginYear +"-"+ beginMonth +"-"+beginDay;
		}else if (search_period.equals("three_month")){
			DecimalFormat df = new DecimalFormat("00");
			Calendar cal=Calendar.getInstance();
			endYear   = Integer.toString(cal.get(Calendar.YEAR));
			endMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			endDay   = df.format(cal.get(Calendar.DATE));
			endDate = endYear +"-"+ endMonth +"-"+endDay;
			
			cal.add(cal.MONTH,-3);
			beginYear   = Integer.toString(cal.get(Calendar.YEAR));
			beginMonth  = df.format(cal.get(Calendar.MONTH) + 1);
			beginDay   = df.format(cal.get(Calendar.DATE));
			beginDate = beginYear +"-"+ beginMonth +"-"+beginDay;
		}
		
		
		return beginDate+","+endDate;
	}
}
