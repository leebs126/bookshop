<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "" "">
<HTML>
<HEAD>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">

<META charset="utf-8">
<META name="viewport" content="width=device-width">
<TITLE>���� ���θ�</TITLE>
<LINK href="../css/main.css" rel="stylesheet" type="text/css"
	media="screen">
<LINK href="../css/basic-jquery-slider.css" rel="stylesheet"
	type="text/css" media="screen">
<LINK href="../css/mobile.css" rel="stylesheet" type="text/css">
<SCRIPT src="../jquery/jquery-1.6.2.min.js" type="text/javascript"></SCRIPT>
<SCRIPT src="../jquery/jquery.easing.1.3.js" type="text/javascript"></SCRIPT>
<SCRIPT src="../jquery/stickysidebar.jquery.js" type="text/javascript"></SCRIPT>
<SCRIPT src="../jquery/basic-jquery-slider.js" type="text/javascript"></SCRIPT>
<!--[if lt IE 9]> 
    <script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script> 
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>    
<![endif]-->

<SCRIPT>
	$(function() {
		$("#sticky").stickySidebar({
			timer : 100,
			easing : "easeInBounce"
		});
	});
</SCRIPT>
<META name="GENERATOR" content="MSHTML 11.00.9600.17801">
</HEAD>
<BODY>
	<DIV id="outer_wrap">
		<DIV id="wrap">
			<HEADER>
				<%@ include file="../common/header.jsp"%>
			</HEADER>
			<DIV class="clear"></DIV>
			<ASIDE>
				<%@ include file="../common/side.jsp"%>
			</ASIDE>
			
			<ARTICLE>
				<HGROUP>
					<H1>��ǻ�Ϳ� ���ͳ�</H1>
					<H2>������ ���� &gt; ��ǻ�Ϳ� ���ͳ� &gt; �� ����</H2>
					<H3>${goods.goods_title }</H3>
					<H4>${goods.goods_writer} ��| ${goods.goods_publisher }</H4>
				</HGROUP>
				<DIV id="goods_image">
					<FIGURE>
						<IMG alt="HTML5 &amp; CSS3" src="<%=request.getContextPath()%>/download.do?fileName=${goods.goods_fileName}">
					</FIGURE>
				</DIV>
				<DIV id="detail_table">
					<TABLE>
						<TBODY>
							<TR>
								<TD class="fixed">����</TD>
								<TD><SPAN>${goods.goods_price}��</SPAN></TD>
							</TR>
							<TR class="dot_line">
								<TD class="fixed">�ǸŰ�</TD>
								<TD><SPAN class="active">${goods.goods_price*0.9}�� (10% ����)</SPAN></TD>
							</TR>
							<TR>
								<TD class="fixed">����Ʈ����</TD>
								<TD class="active">${goods.goods_point}P(10%����)</TD>
							</TR>
							<TR class="dot_line">
								<TD class="fixed">����Ʈ �߰�����</TD>
								<TD>�����̻� ���Ž� 1,000P, 5�����̻� ���Ž� 2,000P�߰����� ������ ��� �̿�� 300P
									�߰�����</TD>
							</TR>
							<TR>
								<TD class="fixed">������</TD>
								<TD>${goods.goods_published_date}</TD>
							</TR>
							<TR>
								<TD class="fixed">������ ��</TD>
								<TD>${goods.goods_page_total}��</TD>
							</TR>
							<TR class="dot_line">
								<TD class="fixed">ISBN</TD>
								<TD>${goods.goods_isbn}</TD>
							</TR>
							<TR>
								<TD class="fixed">��۷�</TD>
								<TD><STRONG>����</STRONG></TD>
							</TR>
							<TR>
								<TD class="fixed">��۾ȳ�</TD>
								<TD><STRONG>[���Ϲ��]</STRONG> ���Ϲ�� ���� ����!<BR>
								<STRONG>[���Ϲ��]</STRONG> ���Ͽ��� ��۹޴� Senop</TD>
							</TR>
							<TR>
								<TD class="fixed">����������</TD>
								<TD>���� �ֹ� �� ���� ���� ����</TD>
							</TR>
							<TR>
								<TD class="fixed">����</TD>
								<TD><SELECT style="width: 60px;"><OPTION>1</OPTION>
										<OPTION>2</OPTION>
										<OPTION>3</OPTION>
										<OPTION>4</OPTION>
										<OPTION>5</OPTION>
								</SELECT></TD>
							</TR>
						</TBODY>
					</TABLE>
					<UL>
						<LI><A class="buy"
							href="#">�����ϱ� </A></LI>
						<LI><A class="cart"
							href="#">��ٱ���</A></LI>
						<LI><A class="wish"
							href="#">���ø���Ʈ</A></LI>
					</UL>
				</DIV>
				<DIV class="clear"></DIV>
				<!-- ���� ��� ���� �� -->
				<DIV id="container">
					<UL class="tabs">
						<LI><A
							href="#tab1">å�Ұ�</A></LI>
						<LI><A
							href="#tab2">���ڼҰ�</A></LI>
						<LI><A
							href="#tab3">å����</A></LI>
						<LI><A
							href="#tab4">���ǻ缭��</A></LI>
						<LI><A
							href="#tab5">��õ��</A></LI>
						<LI><A
							href="#tab6">����</A></LI>
					</UL>
					<DIV class="tab_container">
						<DIV class="tab_content" id="tab1">
							<H4>å�Ұ�</H4>
							<P>
							  ${goods.goods_intro}
							</P>
								<c:forEach var="image" items="${goods.list_detail_Image }" >
									<IMG width="600" height="771" 
										src="<%=request.getContextPath()%>/download.do?fileName=${image.fileName}">
								</c:forEach>
						</DIV>
						<DIV class="tab_content" id="tab2">
							<H4>���ڼҰ�</H4>
							<P>
							<DIV class="writer">���� : ${goods.goods_writer}</DIV>
							${goods.goods_writer_intro }
							<P></P>
						</DIV>
						<DIV class="tab_content" id="tab3">
							<H4>å����</H4>
							<P>
								${goods.goods_contents_order }							
							</P>
						</DIV>
						<DIV class="tab_content" id="tab4">
							<H4>���ǻ缭��</H4>
						</DIV>
						<DIV class="tab_content" id="tab5">
							<H4>��õ��</H4>
						</DIV>
						<DIV class="tab_content" id="tab6">
							<H4>����</H4>
						</DIV>
					</DIV>
				</DIV>
			</ARTICLE>
			<DIV class="clear"></DIV>

	<%@ include file="../common/footer.jsp"%>
</BODY>
</HTML>
