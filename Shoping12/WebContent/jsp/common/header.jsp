<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<body>
	<DIV id="logo">
	<A href="<%=request.getContextPath()%>/main/index.do">
		<IMG width="176" height="80" alt="booktopia" src="<%=request.getContextPath()%>/image/Booktopia_Logo1.jpg">
		</A>
	</DIV>
	<DIV id="head_link">
		<UL>
		   <c:choose>
		     <c:when test="${isLogOn==true }">
			<LI><A href="<%=request.getContextPath()%>/member/member.do?command=action_logout">�α׾ƿ�</A></LI>
			<LI><A href="<%=request.getContextPath()%>/mine/mine.do?command=my_page_list">���������� </A></LI>
			 </c:when>
			 <c:otherwise>
			<LI><A href="<%=request.getContextPath()%>/member/member.do?command=member_login_page">�α���</A></LI>
			<LI><A href="<%=request.getContextPath()%>/member/member.do?command=member_join_page">ȸ������</A></LI> 
			 </c:otherwise>
			</c:choose>
			<LI><A href="<%=request.getContextPath()%>/cart/cart.do?command=my_cart_list">��ٱ���</A></LI>
			<LI><A href="#">������</A></LI>
			<LI><A href="#">�ֹ����</A></LI>
			<LI class="no_line"><A href="<%=request.getContextPath()%>/admin/admin.do?command=manage_goods">������</A></LI>
		</UL>
	</DIV>
	<BR>
	<DIV id="search">
		<FORM action="<%=request.getContextPath()%>/goods/goods.do" method='post'>
			<INPUT name="command"  type="hidden" value="goods_search">
			<INPUT name="searchWord" class="main_input" type="text"> 
			<INPUT name="search" class="btn1" type="submit" value="�� ��">
		</FORM>
	</DIV>

</body>
</html>