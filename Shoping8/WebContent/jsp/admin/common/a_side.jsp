<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<NAV>
<UL>
	<LI>
		<H3>주요기능</H3>
		<UL>
			<LI><A href="<%=request.getContextPath()%>/admin/admin.do?command=manage_goods">제품관리</A></LI>
			<LI><A href="#">주문관리</A></LI>
			<LI><A href="#">회원관리</A></LI>
			<LI><A href="#">배송관리</A></LI>
			<LI><A href="#">게시판관리</A></LI>
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
</UL>
</NAV>
<DIV class="clear"></DIV>
<DIV id="banner">
	<IMG width="190" height="163" src="<%=request.getContextPath()%>/image/nikon1.jpg">
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
	<IMG width="190" height="362" src="<%=request.getContextPath()%>/image/slate.jpg">
</DIV>
<DIV id="banner">
	<IMG width="190" height="104" src="<%=request.getContextPath()%>/image/custom.jpg">
</DIV>
<DIV id="banner">
	<IMG width="190" height="69" src="<%=request.getContextPath()%>/image/faq.jpg">
</DIV>
</html>