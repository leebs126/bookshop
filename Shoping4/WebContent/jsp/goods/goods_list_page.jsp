<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "" "">
<head>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">

<META charset="utf-8">
<META name="viewport" content="width=device-width">
<LINK href="../css/main.css" rel="stylesheet" type="text/css"
	media="screen">
<LINK href="../css/basic-jquery-slider.css" rel="stylesheet"
	type="text/css" media="screen">
<LINK href="../css/mobile.css" rel="stylesheet" type="text/css">
<SCRIPT src="../jquery/jquery-1.6.2.min.js" type="text/javascript"></SCRIPT>
<SCRIPT src="../jquery/jquery.easing.1.3.js" type="text/javascript"></SCRIPT>
<SCRIPT src="../jquery/stickysidebar.jquery.js" type="text/javascript"></SCRIPT>
<SCRIPT src="../jquery/tabs.js" type="text/javascript"></SCRIPT>
<SCRIPT src="../jquery/carousel.js" type="text/javascript"></SCRIPT>
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
				</HGROUP>
				<SECTION id="new_book">
					<H3>���γ��� å</H3>
					<DIV id="left_scroll">
						<A href='javascript:slide("left");'><IMG
							src="../image/left.gif"></A>
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
								src="../image/html5.jpg"></TD>
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
						<LI><A class="page_contrl_active"
							href="#">1</A></LI>
						<LI><A href="#">2</A></LI>
						<LI><A href="#">3</A></LI>
						<LI><A href="#">4</A></LI>
						<LI><A href="#">5</A></LI>
						<LI><A href="#">6</A></LI>
						<LI><A href="#">7</A></LI>
						<LI><A href="#">8</A></LI>
						<LI><A href="#">9</A></LI>
						<LI><A href="#">10</A></LI>
						<LI><A class="no_border" href="#">Next</A></LI>
					</UL>
				</DIV>
			</ARTICLE>
			<DIV class="clear"></DIV>

			<%@ include file="../common/footer.jsp"%>