package com.shop.ex1.mine;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.shop.ex1.goods.GoodsDAO;
import com.shop.ex1.goods.GoodsVO;
import com.shop.ex1.member.MemberVO;
import com.shop.ex1.notice.NoticeDAO;
import com.shop.ex1.notice.NoticeService;
import com.shop.ex1.order.OrderGoodsVO;

public class MineAction extends Action{
	String command;
	MineService service;
	HttpSession session;
	ArrayList<OrderGoodsVO>  my_order_list;
	
	public ActionForward  execute ( ActionMapping  mapping , ActionForm form , 
			HttpServletRequest  request , HttpServletResponse response ) throws Exception {

		request.setCharacterEncoding("utf-8");
		service=new MineService();
		session=request.getSession();
		session.setAttribute("side_menu", "my_page");
			
		command = request.getParameter("command");
		System.out.println("command:" + command);
		request.setAttribute("command", command);
		if(command.equals("my_page_list")){
			String isComeFrom=request.getParameter("isComeFrom"); //주문 취소후 다시 요청 유무 확인
			MemberVO memberVO=(MemberVO)session.getAttribute("member_info");
			my_order_list=service.listMyOrderGoods(memberVO);
			request.setAttribute("isComeFrom", isComeFrom);
			request.setAttribute("my_order_list", my_order_list);
		}else if(command.equals("my_order_detail")){
			session=request.getSession();
			MemberVO orderer=(MemberVO)session.getAttribute("member_info");
			
			String order_id=(String) request.getParameter("order_id");
			OrderGoodsVO order_goods_detail =service.findMyOrderInfo(order_id);
			request.setAttribute("orderer", orderer);
			request.setAttribute("order_goods_detail", order_goods_detail);
			
		}else if(command.equals("find_order_delivery_hist")){
			session=request.getSession();
			MemberVO memberVO=(MemberVO)session.getAttribute("member_info");
			String member_id=memberVO.getMember_id();
			String beginDate=null;
			String endDate=null;
			String endYear=null;
			String endMonth=null;
			String endDay=null;
			String beginYear=null;
			String beginMonth=null;
			String beginDay=null;
			String search_period=request.getParameter("search_period");
			
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
			
			System.out.println("beginDate:"+beginDate+", endDate:"+endDate);
			MineVO mineVO=new MineVO();
			mineVO.setMember_id(member_id);
			mineVO.setBeginDate(beginDate);
			mineVO.setEndDate(endDate);
			
			ArrayList<OrderGoodsVO> my_order_hist_list=service.findOrderDeliveryHist(mineVO);
			
			//System.out.println("현재 날짜:"+strDate);
			//request.setAttribute("curYear", curYear);
			
			request.setAttribute("beginYear", beginYear);
			request.setAttribute("beginMonth", beginMonth);
			request.setAttribute("beginDay", beginDay);
			
			request.setAttribute("endYear", endYear);
			request.setAttribute("endMonth", endMonth);
			request.setAttribute("endDay", endDay);
			request.setAttribute("my_order_hist_list", my_order_hist_list);


		}else if(command.equals("my_info_detail")){
			session=request.getSession();
			MemberVO member_info=(MemberVO)session.getAttribute("member_info");
			String member_id=member_info.getMember_id();
			MemberVO memberVO=service.findMyInfo(member_id);
			request.setAttribute("member_info", member_info);
		}else if(command.equals("modify_my_info")){
			session=request.getSession();
			HashMap<String,String> memberMap=new HashMap<String,String>();
			String val[]=null;
			PrintWriter pw=response.getWriter();
			MemberVO memberVO=new MemberVO();
			String member_id=request.getParameter("member_id");
			String mod_type=request.getParameter("mod_type");
			String value =request.getParameter("value");
			if(mod_type.equals("member_birth")){
				val=value.split(",");
				memberMap.put("member_birth_y",val[0]);
				memberMap.put("member_birth_m",val[1]);
				memberMap.put("member_birth_d",val[2]);
				memberMap.put("member_birth_gn",val[3]);
			}else if(mod_type.equals("tel")){
				val=value.split(",");
				memberMap.put("tel1",val[0]);
				memberMap.put("tel2",val[1]);
				memberMap.put("tel3",val[2]);
				
			}else if(mod_type.equals("hp")){
				val=value.split(",");
				memberMap.put("hp1",val[0]);
				memberMap.put("hp2",val[1]);
				memberMap.put("hp3",val[2]);
				memberMap.put("smsSts_yn", val[2]);
			}else if(mod_type.equals("email")){
				val=value.split(",");
				memberMap.put("email1",val[0]);
				memberMap.put("email2",val[1]);
				memberMap.put("emailSts_yn", val[2]);
			}else if(mod_type.equals("address")){
				val=value.split(",");
				memberMap.put("zipcode",val[0]);
				memberMap.put("roadAddress",val[1]);
				memberMap.put("jibunAddress", val[2]);
				memberMap.put("namujiAddress", val[3]);
			}
			
			memberMap.put("member_id", member_id);
			memberMap.put(mod_type, value);
			
			MemberVO member_info=(MemberVO)service.modifyMyInfo(memberMap);
			session.removeAttribute("member_info");
			session.setAttribute("member_info", member_info);
			pw.print("mod_success");
			pw.close();
			return null;
			
			/*session=request.getSession();
			String member_id=((MemberVO)session.getAttribute("member_info")).getMember_id();
			MemberVO memberVO=new MemberVO();
			String member_pw=request.getParameter("member_pw");
			String member_gender=request.getParameter("member_gender");
			String member_birth_y=request.getParameter("member_birth_y");
			String member_birth_m=request.getParameter("member_birth_m");
			String member_birth_d=request.getParameter("member_birth_d");
			String member_birth_gn=request.getParameter("member_birth_gn");
			String tel1=request.getParameter("tel1");
			String tel2=request.getParameter("tel2");
			String tel3=request.getParameter("tel3");
			
			String hp1=request.getParameter("hp1");
			String hp2=request.getParameter("hp2");
			String hp3=request.getParameter("hp3");
			String smsSts_yn=request.getParameter("smssts_yn");
			
			String email1=request.getParameter("email1");
			String email2=request.getParameter("email2");
			String emailSts_yn=request.getParameter("emailsts_yn");
			
			String zipcode=request.getParameter("zipcode");
			String namujiAddress=request.getParameter("namujiAddress");
			String roadAddress=request.getParameter("roadAddress");
			String jibunAddress=request.getParameter("jibunAddress");
			
			
			memberVO.setMember_id(member_id);
			memberVO.setMember_pw(member_pw);
			memberVO.setMember_gender(member_gender);
			memberVO.setMember_birth_y(member_birth_y);
			memberVO.setMember_birth_m(member_birth_m);
			memberVO.setMember_birth_d(member_birth_d);
			memberVO.setMember_birth_gn(member_birth_gn);
			memberVO.setTel1(tel1);
			memberVO.setTel2(tel2);
			memberVO.setTel3(tel3);
			
			memberVO.setHp1(hp1);
			memberVO.setHp2(hp2);
			memberVO.setHp3(hp3);
			memberVO.setSmsSts_yn(smsSts_yn);
			memberVO.setEmail1(email1);
			memberVO.setEmail2(email2);
			memberVO.setEmailSts_yn(emailSts_yn);
			memberVO.setZipcode(zipcode);
			memberVO.setRoadAddress(roadAddress);
			memberVO.setJibunAddress(jibunAddress);
			memberVO.setNamujiAddress(namujiAddress);*/
			
			
			
		}else if(command.equals("cancel_order")){
			String order_id=request.getParameter("order_id");
			System.out.println("order_id:"+order_id);
			service.cancelOrder(order_id);
			//command="my_page_list";
			response.sendRedirect("/Shoping12/mine/mine.do?command=my_page_list&isComeFrom=cancel_order");
			return null;
		}
		

		
		return  mapping.findForward(command);
	}
	
}
