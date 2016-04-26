<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "" "">
<head>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">

<META charset="utf-8">
<META name="viewport" content="width=device-width">
<LINK href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet" type="text/css"
	media="screen">
<LINK href="<%=request.getContextPath() %>/css/basic-jquery-slider.css" rel="stylesheet"
	type="text/css" media="screen">
<LINK href="<%=request.getContextPath() %>/css/mobile.css" rel="stylesheet" type="text/css">
<SCRIPT src="<%=request.getContextPath() %>/jquery/jquery-1.6.2.min.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=request.getContextPath() %>/jquery/jquery.easing.1.3.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=request.getContextPath() %>/jquery/stickysidebar.jquery.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=request.getContextPath() %>/jquery/tabs.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=request.getContextPath() %>/jquery/carousel.js" type="text/javascript"></SCRIPT>
</head>
	
<SCRIPT>
 $(function () {
    $("#sticky").stickySidebar({
       timer: 100 , easing: "easeInBounce"
    });
 }); 	  
	  
 </SCRIPT>
 

<META name="GENERATOR" content="MSHTML 11.00.9600.17801">
</HEAD>
<BODY>
	<DIV id="outer_wrap">
		<DIV id="wrap">
			<HEADER>
				<%@ include file="../common/a_header.jsp"%>
			</HEADER>
			<DIV class="clear"></DIV>
			<ASIDE>
				<%@ include file="../common/a_side.jsp"%>
			</ASIDE>
			<ARTICLE>
				<HGROUP>
					<H1>�˻� ���</H1>
				</HGROUP>

				<DIV class="clear"></DIV>
				<DIV id="sorting">
					<UL>
						<LI><A class="active"
							href="http://css3.zerois.net/senop/list_page.php#">����Ʈ ����</A></LI>
						<LI><A href="http://css3.zerois.net/senop/list_page.php#">�ֽ�
								�Ⱓ</A></LI>
						<LI><A style="border: currentColor; border-image: none;"
							href="http://css3.zerois.net/senop/list_page.php#">�ֱ� ���</A></LI>
					</UL>
				</DIV>
				<TABLE id="list_view">
					<TBODY>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="<%=request.getContextPath() %>/image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="http://css3.zerois.net/senop/detail_page.php">ó������
										�ٽ� ���� HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">��뼮 �� | �ε�� | 2011.10</DIV>
								<P>HTML5�� CSS3�� ���ο� ���� ��Ŀ���� ���߰� ������ �ʴ�. �� ǥ���� �ٽ� ö���� "������
									�������� �и�"��� ������ �°� �޶��� �� ���� ����� ����� ��� �� �ֵ��� �ϴ� ���� �� å�� �ָ���. ��
									å���� �н��ϴ� ���ڰ� HTML5�� ������ ����� ������ �� �ְ� CSS3�� �����ϰ� ��������� �������� ��Ʈ����
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000��</SPAN><BR>
							<STRONG>22,500��</STRONG><BR>(10% ����)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="#">�����ϱ�</A></LI>
									<LI><A href="#">�����ϱ�</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="<%=request.getContextPath() %>/image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="http://css3.zerois.net/senop/list_page.php#">ó������
										�ٽ� ���� HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">��뼮 �� | �ε�� | 2011.10</DIV>
								<P>HTML5�� CSS3�� ���ο� ���� ��Ŀ���� ���߰� ������ �ʴ�. �� ǥ���� �ٽ� ö���� "������
									�������� �и�"��� ������ �°� �޶��� �� ���� ����� ����� ��� �� �ֵ��� �ϴ� ���� �� å�� �ָ���. ��
									å���� �н��ϴ� ���ڰ� HTML5�� ������ ����� ������ �� �ְ� CSS3�� �����ϰ� ��������� �������� ��Ʈ����
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000��</SPAN><BR>
							<STRONG>22,500��</STRONG><BR>(10% ����)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">�����ϱ�</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">�����ϱ�</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="../image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="http://css3.zerois.net/senop/list_page.php#">ó������
										�ٽ� ���� HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">��뼮 �� | �ε�� | 2011.10</DIV>
								<P>HTML5�� CSS3�� ���ο� ���� ��Ŀ���� ���߰� ������ �ʴ�. �� ǥ���� �ٽ� ö���� "������
									�������� �и�"��� ������ �°� �޶��� �� ���� ����� ����� ��� �� �ֵ��� �ϴ� ���� �� å�� �ָ���. ��
									å���� �н��ϴ� ���ڰ� HTML5�� ������ ����� ������ �� �ְ� CSS3�� �����ϰ� ��������� �������� ��Ʈ����
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000��</SPAN><BR>
							<STRONG>22,500��</STRONG><BR>(10% ����)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">�����ϱ�</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">�����ϱ�</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="../image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="http://css3.zerois.net/senop/list_page.php#">ó������
										�ٽ� ���� HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">��뼮 �� | �ε�� | 2011.10</DIV>
								<P>HTML5�� CSS3�� ���ο� ���� ��Ŀ���� ���߰� ������ �ʴ�. �� ǥ���� �ٽ� ö���� "������
									�������� �и�"��� ������ �°� �޶��� �� ���� ����� ����� ��� �� �ֵ��� �ϴ� ���� �� å�� �ָ���. ��
									å���� �н��ϴ� ���ڰ� HTML5�� ������ ����� ������ �� �ְ� CSS3�� �����ϰ� ��������� �������� ��Ʈ����
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000��</SPAN><BR>
							<STRONG>22,500��</STRONG><BR>(10% ����)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">��ٱ���</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">�����ϱ�</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">���ϱ�</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="../image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="http://css3.zerois.net/senop/list_page.php#">ó������
										�ٽ� ���� HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">��뼮 �� | �ε�� | 2011.10</DIV>
								<P>HTML5�� CSS3�� ���ο� ���� ��Ŀ���� ���߰� ������ �ʴ�. �� ǥ���� �ٽ� ö���� "������
									�������� �и�"��� ������ �°� �޶��� �� ���� ����� ����� ��� �� �ֵ��� �ϴ� ���� �� å�� �ָ���. ��
									å���� �н��ϴ� ���ڰ� HTML5�� ������ ����� ������ �� �ְ� CSS3�� �����ϰ� ��������� �������� ��Ʈ����
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000��</SPAN><BR>
							<STRONG>22,500��</STRONG><BR>(10% ����)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">��ٱ���</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">�����ϱ�</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">���ϱ�</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="../image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="http://css3.zerois.net/senop/list_page.php#">ó������
										�ٽ� ���� HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">��뼮 �� | �ε�� | 2011.10</DIV>
								<P>HTML5�� CSS3�� ���ο� ���� ��Ŀ���� ���߰� ������ �ʴ�. �� ǥ���� �ٽ� ö���� "������
									�������� �и�"��� ������ �°� �޶��� �� ���� ����� ����� ��� �� �ֵ��� �ϴ� ���� �� å�� �ָ���. ��
									å���� �н��ϴ� ���ڰ� HTML5�� ������ ����� ������ �� �ְ� CSS3�� �����ϰ� ��������� �������� ��Ʈ����
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000��</SPAN><BR>
							<STRONG>22,500��</STRONG><BR>(10% ����)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">��ٱ���</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">�����ϱ�</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">���ϱ�</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="../image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="http://css3.zerois.net/senop/list_page.php#">ó������
										�ٽ� ���� HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">��뼮 �� | �ε�� | 2011.10</DIV>
								<P>HTML5�� CSS3�� ���ο� ���� ��Ŀ���� ���߰� ������ �ʴ�. �� ǥ���� �ٽ� ö���� "������
									�������� �и�"��� ������ �°� �޶��� �� ���� ����� ����� ��� �� �ֵ��� �ϴ� ���� �� å�� �ָ���. ��
									å���� �н��ϴ� ���ڰ� HTML5�� ������ ����� ������ �� �ְ� CSS3�� �����ϰ� ��������� �������� ��Ʈ����
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000��</SPAN><BR>
							<STRONG>22,500��</STRONG><BR>(10% ����)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">��ٱ���</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">�����ϱ�</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">���ϱ�</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="../image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="http://css3.zerois.net/senop/list_page.php#">ó������
										�ٽ� ���� HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">��뼮 �� | �ε�� | 2011.10</DIV>
								<P>HTML5�� CSS3�� ���ο� ���� ��Ŀ���� ���߰� ������ �ʴ�. �� ǥ���� �ٽ� ö���� "������
									�������� �и�"��� ������ �°� �޶��� �� ���� ����� ����� ��� �� �ֵ��� �ϴ� ���� �� å�� �ָ���. ��
									å���� �н��ϴ� ���ڰ� HTML5�� ������ ����� ������ �� �ְ� CSS3�� �����ϰ� ��������� �������� ��Ʈ����
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000��</SPAN><BR>
							<STRONG>22,500��</STRONG><BR>(10% ����)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="#">�����ϱ�</A></LI>
									<LI><A href="#">�����ϱ�</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="../image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="#">ó������
										�ٽ� ���� HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">��뼮 �� | �ε�� | 2011.10</DIV>
								<P>HTML5�� CSS3�� ���ο� ���� ��Ŀ���� ���߰� ������ �ʴ�. �� ǥ���� �ٽ� ö���� "������
									�������� �и�"��� ������ �°� �޶��� �� ���� ����� ����� ��� �� �ֵ��� �ϴ� ���� �� å�� �ָ���. ��
									å���� �н��ϴ� ���ڰ� HTML5�� ������ ����� ������ �� �ְ� CSS3�� �����ϰ� ��������� �������� ��Ʈ����
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000��</SPAN><BR>
							<STRONG>22,500��</STRONG><BR>(10% ����)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="#">��ٱ���</A></LI>
									<LI><A href="#">�����ϱ�</A></LI>
									<LI><A href="#">���ϱ�</A></LI>
								</UL>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
				<DIV class="clear"></DIV>
				<DIV id="page_wrap">
					<UL id="page_control">
						<LI><A class="no_border"  href="#">Prev</A></LI>
						<c:set var="page_num" value="0"/>
						<c:forEach var="count" begin="1" end="10" step="1">
						  <c:choose>
						  <c:when  test="${count==1 }">
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
			</ARTICLE>
			<DIV class="clear"></DIV>

			<%@ include file="../common/a_footer.jsp"%>