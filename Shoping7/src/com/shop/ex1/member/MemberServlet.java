package com.shop.ex1.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/member.do")
public class MemberServlet extends HttpServlet {
	String command;
	MemberVO memberVO;
	MemberService service;
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		doProcess(request,response);
	}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		doProcess(request,response);
	}

	
	public void doProcess(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		request.setCharacterEncoding("euc-kr");
		String forwardPath="/jsp/member/member_page.jsp";
		try{
			service=new MemberService();
			
			command = request.getParameter("command");
			String type=request.getParameter("type");
			System.out.println("command:" + command);
			System.out.println("type:" + type);

			if (command.equals("member_login_page")) {
/*					RequestDispatcher dis = request.getRequestDispatcher("/jsp/goods/goods_list_page.jsp");
					dis.forward(request, response);
*/				
					
						//ArrayList goods_list = service.list();
//						request.setAttribute("goods_main", goods_list);
/*						RequestDispatcher dis = request.getRequestDispatcher("/jsp/main/index.jsp");
						dis.forward(request, response);
						*/
			}else if(command.equals("member_join_page")){
//				ArrayList goods_search_list = service.list(_searchWord);
//				request.setAttribute("goods_search_list",goods_search_list);
			}
			
			else if (command.equals("action_login")){
				String member_id=request.getParameter("member_id");
				String member_pw=request.getParameter("member_pw");
				MemberVO memberVO=new MemberVO();
				memberVO.setMember_id(member_id);
				memberVO.setMember_pw(member_pw);
				Boolean isAlreadyJoined=service.isUserJoined(memberVO);
				if(isAlreadyJoined==true){
					HttpSession sess=request.getSession();
					sess.setAttribute("isLogOn", new Boolean(true));
					sess.setAttribute("member_id",member_id);
					command=null;
					forwardPath="/main/index.do";
				}else{
					String errMessage="아이디나  비밀번호가 틀립니다. 다시 로그인해주세요";
					request.setAttribute("errMessage", errMessage);
					command="member_login_page";
				}
					
		}else if (command.equals("action_logout")){
			HttpSession sess=request.getSession();
			sess.setAttribute("isLogOn", new Boolean(false));
			command=null;
			forwardPath="/main/index.do";
		}else if (command.equals("action_join")){
			memberVO=new MemberVO();
			String member_id=request.getParameter("member_id");
			String member_pw=request.getParameter("member_pw");
			String member_name=request.getParameter("member_name");
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
			memberVO.setMember_name(member_name);
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
			memberVO.setNamujiAddress(namujiAddress);
			
			service.addMember(memberVO);
			
			
			
		}
			request.setAttribute("command", command);
			RequestDispatcher dis=request.getRequestDispatcher(forwardPath);
			dis.forward(request,response);
		
		}catch(Exception e){
			e.printStackTrace();
		}
				
	}
	

}

