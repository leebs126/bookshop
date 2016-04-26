<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<head>
 <title><tiles:insertAttribute name="title" /></title>
</head>
<BODY>
	<HGROUP>
		<H1>��ǻ�Ϳ� ���ͳ�</H1>
		<H2>������ ���� &gt; ��ǻ�Ϳ� ���ͳ� &gt; �� ����</H2>
	</HGROUP>
	<SECTION id="new_book">
		<H3>���γ��� å</H3>
		<DIV id="left_scroll">
			<A href='javascript:slide("left");'><IMG src="../image/left.gif"></A>
		</DIV>
		<DIV id="carousel_inner">
			<UL id="carousel_ul">
				<LI>
					<DIV id="book">
						<A href="http://css3.zerois.net/senop/detail_page.php"><IMG
							width="100" src="../image/html5.jpg"></A>
						<DIV class="sort">[��ǻ�� ���ͳ�]</DIV>
						<DIV class="title">
							<A href="http://css3.zerois.net/senop/detail_page.php">ó������
								�ٽ� ���...</A>
						</DIV>
						<DIV class="writer">��뼮 | �ε��</DIV>
						<DIV class="price">
							<SPAN>25,000��</SPAN> <BR>22,500��
						</DIV>
					</DIV>
				</LI>
				<LI>
					<DIV id="book">
						<IMG width="100" src="../image/jquery.jpg">

						<DIV class="sort">[��ǻ�� ���ͳ�]</DIV>
						<DIV class="title">�� �����̳ʸ� ...</DIV>
						<DIV class="writer">Nishihata | �ε��</DIV>
						<DIV class="price">
							<SPAN>25,000��</SPAN><BR>22,500��
						</DIV>
					</DIV>
				</LI>
				<LI>
					<DIV id="book">
						<IMG width="100" src="../image/challenge.jpg">

						<DIV class="sort">[��ǻ�� ���ͳ�]</DIV>
						<DIV class="title">���α׷���...</DIV>
						<DIV class="writer">Takuya | �ε��</DIV>
						<DIV class="price">
							<SPAN>25,000��</SPAN><BR>22,500��
						</DIV>
					</DIV>
				</LI>
				<LI>
					<DIV class="no_back" id="book">
						<IMG width="100" src="../image/xcode.jpg">

						<DIV class="sort">[��ǻ�� ���ͳ�]</DIV>
						<DIV class="title">Xcode4�� ...</DIV>
						<DIV class="writer">Yoshinao | �ε��</DIV>
						<DIV class="price">
							<SPAN>25,000��</SPAN><BR>22,500��
						</DIV>
					</DIV>
				</LI>
				<LI>
					<DIV class="no_back" id="book">
						<IMG width="100" src="../image/soft.jpg">

						<DIV class="sort">[��ǻ�� ���ͳ�]</DIV>
						<DIV class="title">�Ųٷ� ���� ....</DIV>
						<DIV class="writer">��ȣ�� | �ε��</DIV>
						<DIV class="price">
							<SPAN>16,000��</SPAN><BR>14,400��
						</DIV>
					</DIV>
				</LI>
				<LI>
					<DIV id="book">
						<A href="http://css3.zerois.net/senop/detail_page.php"><IMG
							width="100" src="../image/html5.jpg"></A>
						<DIV class="sort">[��ǻ�� ���ͳ�]</DIV>
						<DIV class="title">
							<A href="http://css3.zerois.net/senop/detail_page.php">ó������
								�ٽ� ���...</A>
						</DIV>
						<DIV class="writer">��뼮 | �ε��</DIV>
						<DIV class="price">
							<SPAN>25,000��</SPAN> <BR>22,500��
						</DIV>
					</DIV>
				</LI>
				<LI>
					<DIV id="book">
						<IMG width="100" src="../image/jquery.jpg">

						<DIV class="sort">[��ǻ�� ���ͳ�]</DIV>
						<DIV class="title">�� �����̳ʸ� ...</DIV>
						<DIV class="writer">Nishihata | �ε��</DIV>
						<DIV class="price">
							<SPAN>25,000��</SPAN><BR>22,500��
						</DIV>
					</DIV>
				</LI>
				<LI>
					<DIV id="book">
						<IMG width="100" src="../image/challenge.jpg">

						<DIV class="sort">[��ǻ�� ���ͳ�]</DIV>
						<DIV class="title">���α׷���...</DIV>
						<DIV class="writer">Takuya | �ε��</DIV>
						<DIV class="price">
							<SPAN>25,000��</SPAN><BR>22,500��
						</DIV>
					</DIV>
				</LI>
				<LI>
					<DIV class="no_back" id="book">
						<IMG width="100" src="../image/xcode.jpg">

						<DIV class="sort">[��ǻ�� ���ͳ�]</DIV>
						<DIV class="title">Xcode4�� ...</DIV>
						<DIV class="writer">Yoshinao | �ε��</DIV>
						<DIV class="price">
							<SPAN>25,000��</SPAN><BR>22,500��
						</DIV>
					</DIV>
				</LI>
				<LI>
					<DIV class="no_back" id="book">
						<IMG width="100" src="../image/soft.jpg">

						<DIV class="sort">[��ǻ�� ���ͳ�]</DIV>
						<DIV class="title">�Ųٷ� ���� ....</DIV>
						<DIV class="writer">��ȣ�� | �ε��</DIV>
						<DIV class="price">
							<SPAN>16,000��</SPAN><BR>14,400��
						</DIV>
					</DIV>
				</LI>
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
			<LI><A class="active" href="#">����Ʈ ����</A></LI>
			<LI><A href="#">�ֽ� �Ⱓ</A></LI>
			<LI><A style="border: currentColor; border-image: none;"
				href="#">�ֱ� ���</A></LI>
		</UL>
	</DIV>
	<TABLE id="list_view">
		<TBODY>
			<TR>
				<c:forEach var="item" items="${goods_search_list }">
					<TD class="goods_image">
					<a href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">
						<IMG width="75" alt="" src="<%=request.getContextPath() %>/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}""></TD>
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
		<UL id="page_control">
			<LI><A class="no_border" href="#">Prev</A></LI>
			<c:set var="page_num" value="0" />
			<c:forEach var="count" begin="1" end="10" step="1">
				<c:choose>
					<c:when test="${count==1 }">
						<LI><A class="page_contrl_active" href="#">${count+page_num*10 }</A></LI>
					</c:when>
					<c:otherwise>
						<LI><A href="#">${count+page_num*10 }</A></LI>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<LI><A class="no_border" href="#">Next</A></LI>
		</UL>
	</DIV>