<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<NAV>
<UL>
	<LI>
		<H3>������ ����</H3>
		<UL>
			<LI><A href="./list_page.jsp">��ǻ�Ϳ� ���ͳ�</A></LI>
			<LI><A href="#">����Ͻ��� ����</A></LI>
			<LI><A href="#">���б���</A></LI>
			<LI><A href="#">�ڱ����</A></LI>
			<LI><A href="#">�ڿ��� ����</A></LI>
			<LI><A href="#">����� ��ȭ</A></LI>
		</UL>
	</LI>
	<LI>
		<H3>digital ���</H3>
		<UL>
			<LI><A href="#">dslr�� lens</A></LI>
			<LI><A href="#">����Ʈ��</A></LI>
			<LI><A href="#">��Ʈ��</A></LI>
			<LI><A href="#">pc ��ü</A></LI>
			<LI><A href="#">��ǻ�� ��ǰ</A></LI>
			<LI><A href="#">�Ǽ��縮</A></LI>
		</UL>
	</LI>
</UL>
</NAV>
<DIV class="clear"></DIV>
<DIV id="banner">
	<IMG width="190" height="163" src="<%=request.getContextPath()%>/image/nikon1.jpg">
</DIV>
<DIV id="notice">
	<H2>��������</H2>
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