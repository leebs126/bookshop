<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<head>
 <title>���� ��� ������</title>
</head>
<BODY>
	<HGROUP>
		<H1>�� ���� ��õ ����</H1>
		<H2>������ ���� &gt; IT/���ͳ�
	</HGROUP>
	<SECTION id="new_book">
		<H3>���γ��� å</H3>
		<DIV id="left_scroll">
			<A href='javascript:slide("left");'><IMG src="../image/left.gif"></A>
		</DIV>
		<DIV id="carousel_inner">
			<UL id="carousel_ul">
			  <c:forEach var="item" items="${bestseller_list }" >
				<LI>
					<DIV id="book">
						<!-- <A href="#"><IMG  width="100" src="../image/html5.jpg"></A> -->
						<A href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">
						   <IMG width="85"   height="100"
						 		src="<%=request.getContextPath()%>/download.do?goods_id=${item.goods_id}&fileName=${item.fileName}">
						</A>
						<DIV class="title">
							<A href="#">${item.goods_title }</A>
						</DIV>
						<DIV class="writer">${item.goods_writer } | ${item.goods_publisher }</DIV>
						<DIV class="price">
							<SPAN>${item.goods_price }</SPAN> <BR>${item.goods_sales_price }
						</DIV>
					</DIV>
				</LI>
				</c:forEach>
			</UL>
		</DIV>
		<DIV id="right_scroll">
			<A href='javascript:slide("right");'><IMG
				src="../image/right.gif"></A>
		</DIV>
		<INPUT id="hidden_auto_slide_seconds" type="hidden" value="0">

		<DIV class="clear"></DIV>
	</SECTION>
	<DIV class="clear"></DIV>
	<DIV id="sorting">
		<UL>
			<LI><A  href="#">����Ʈ ����</A></LI>
			<LI><A class="active" href="#">�ֽ� �Ⱓ</A></LI>
			<LI><A style="border: currentColor; border-image: none;"
				href="#">�ֱ� ���</A></LI>
		</UL>
	</DIV>
	<TABLE id="list_view">
		<TBODY>
			<TR>
				<c:forEach var="item" items="${newbook_list }">
					<TD class="goods_image">
					<a href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">
						<IMG width="75" alt="" src="<%=request.getContextPath() %>/download.do?goods_id=${item.goods_id}&fileName=${item.fileName}""></TD>
					</a>
					<TD class="goods_description">
						<H2>
							<A href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">${item.goods_title }</A>
						</H2>
						<DIV class="writer_press">${item.goods_writer }��
							|${item.goods_publisher }|${item.goods_published_date }</DIV>
						<P>${item.goods_intro}</P>
					</TD>
					<TD class="price"><SPAN>${item.goods_price }��</SPAN><BR>
						<STRONG>${item.goods_sales_price }</STRONG><BR>(10% ����)</TD>
					<TD><INPUT type="checkbox" value=""></TD>
					<TD class="buy_btns">
						<UL>
							<LI><A href="#">��ٱ���</A></LI>
							<LI><A href="#">�����ϱ�</A></LI>
							<LI><A href="#">���ϱ�</A></LI>
						</UL>
					</TD>
			</TR>
			</c:forEach>
		</TBODY>
	</TABLE>
	<DIV class="clear"></DIV>
	<DIV id="page_wrap">
		 <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${chapter >1 && page==1 }">
		          <a href="<%=request.getContextPath()%>/goods/goods.do?command=goods_list&chapter=${chapter-1}&pageNum=${(chapter-1)*10 +1 }">&nbsp;pre &nbsp;</a>
		         </c:if>
		          <a href="<%=request.getContextPath()%>/goods/goods.do?command=goods_list&chapter=${chapter}&pageNum=${page}">${(chapter-1)*10 +page } </a>
		         <c:if test="${page ==10 }">
		          <a href="<%=request.getContextPath()%>/goods/goods.do?command=goods_list&chapter=${chapter+1}&pageNum=${chapter*10+1}">&nbsp; next</a>
		         </c:if> 
	      </c:forEach> 
	</DIV>