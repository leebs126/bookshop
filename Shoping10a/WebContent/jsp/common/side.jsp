<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<NAV>
<UL>
<c:choose>
<c:when test="${command=='mypage_list' }">
	<LI>
		<H3>주문내역</H3>
		<UL>
			<LI><A href="#">주문내역/배송 조회</A></LI>
			<LI><A href="#">반품/교환 신청 및 조회</A></LI>
			<LI><A href="#">취소 주문 내역</A></LI>
			<LI><A href="#">세금 계산서</A></LI>
		</UL>
	</LI>
	<LI>
		<H3>정보내역</H3>
		<UL>
			<LI><A href="#">회원정보관리</A></LI>
			<LI><A href="#">나의 주소록</A></LI>
			<LI><A href="#">개인정보 동의내역</A></LI>
			<LI><A href="#">회원탈퇴</A></LI>
		</UL>
	</LI>
</c:when>
<c:otherwise>
	<LI>
		<H3>국내외 도서</H3>
		<UL>
			<LI><A href="<%=request.getContextPath()%>/goods/goods.do?command=goods_list&type=computer">컴퓨터와 인터넷</A></LI>
			<LI><A href="#">비즈니스와 경제</A></LI>
			<LI><A href="#">대학교재</A></LI>
			<LI><A href="#">자기관리</A></LI>
			<LI><A href="#">자연과 과학</A></LI>
			<LI><A href="#">역사와 문화</A></LI>
		</UL>
	</LI>
	<LI>
		<H3>digital 기기</H3>
		<UL>
			<LI><A href="#">dslr및 lens</A></LI>
			<LI><A href="#">스마트폰</A></LI>
			<LI><A href="#">노트북</A></LI>
			<LI><A href="#">pc 본체</A></LI>
			<LI><A href="#">컴퓨터 부품</A></LI>
			<LI><A href="#">악세사리</A></LI>
		</UL>
	</LI>
 </c:otherwise>
 </c:choose>	
</UL>
</NAV>
<DIV class="clear"></DIV>
<DIV id="banner">
	<IMG width="190" height="163" src="<%=request.getContextPath() %>/image/n-pay.jpg">
</DIV>
<DIV id="notice">
	<H2>공지사항</H2>
	<UL>
	<c:forEach var="item" items="${notice_list }">
		<LI><A href="#">${item.nTitle }</A></LI>
	</c:forEach>
	</UL>
</DIV>


<DIV id="banner">
	<IMG width="190" height="362" src="<%=request.getContextPath() %>/image/side_banner1.jpg">
</DIV>
<DIV id="banner">
	<IMG width="190" height="104" src="<%=request.getContextPath() %>/image/custom.jpg">
</DIV>
<DIV id="banner">
	<IMG width="190" height="69" src="<%=request.getContextPath() %>/image/faq.jpg">
</DIV>
</html>