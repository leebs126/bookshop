<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<NAV>
<UL>
<c:choose>
<c:when test="${command=='mypage_list' }">
	<LI>
		<H3>�ֹ�����</H3>
		<UL>
			<LI><A href="#">�ֹ�����/��� ��ȸ</A></LI>
			<LI><A href="#">��ǰ/��ȯ ��û �� ��ȸ</A></LI>
			<LI><A href="#">��� �ֹ� ����</A></LI>
			<LI><A href="#">���� ��꼭</A></LI>
		</UL>
	</LI>
	<LI>
		<H3>��������</H3>
		<UL>
			<LI><A href="#">ȸ����������</A></LI>
			<LI><A href="#">���� �ּҷ�</A></LI>
			<LI><A href="#">�������� ���ǳ���</A></LI>
			<LI><A href="#">ȸ��Ż��</A></LI>
		</UL>
	</LI>
</c:when>
<c:otherwise>
	<LI>
		<H3>������ ����</H3>
		<UL>
			<LI><A href="<%=request.getContextPath()%>/goods/goods.do?command=goods_list&type=computer">��ǻ�Ϳ� ���ͳ�</A></LI>
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
 </c:otherwise>
 </c:choose>	
</UL>
</NAV>
<DIV class="clear"></DIV>
<DIV id="banner">
	<IMG width="190" height="163" src="<%=request.getContextPath() %>/image/n-pay.jpg">
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
	<IMG width="190" height="362" src="<%=request.getContextPath() %>/image/side_banner1.jpg">
</DIV>
<DIV id="banner">
	<IMG width="190" height="104" src="<%=request.getContextPath() %>/image/custom.jpg">
</DIV>
<DIV id="banner">
	<IMG width="190" height="69" src="<%=request.getContextPath() %>/image/faq.jpg">
</DIV>
</html>