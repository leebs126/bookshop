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
					<H1>컴퓨터와 인터넷</H1>
					<H2>국내외 도서 &gt; 컴퓨터와 인터넷 &gt; 웹 개발</H2>
				</HGROUP>
				<SECTION id="new_book">
					<H3>새로나온 책</H3>
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
									<DIV class="sort">[컴퓨터 인터넷]</DIV>
									<DIV class="title">
										<A href="http://css3.zerois.net/senop/detail_page.php">처음부터
											다시 배우...</A>
									</DIV>
									<DIV class="writer">양용석 | 로드북</DIV>
									<DIV class="price">
										<SPAN>25,000원</SPAN> <BR>22,500원
									</DIV>
								</DIV>
							</LI>
							<LI>
								<DIV id="book">
									<IMG width="100" src="../image/jquery.jpg">

									<DIV class="sort">[컴퓨터 인터넷]</DIV>
									<DIV class="title">웹 디자이너를 ...</DIV>
									<DIV class="writer">Nishihata | 로드북</DIV>
									<DIV class="price">
										<SPAN>25,000원</SPAN><BR>22,500원
									</DIV>
								</DIV>
							</LI>
							<LI>
								<DIV id="book">
									<IMG width="100" src="../image/challenge.jpg">

									<DIV class="sort">[컴퓨터 인터넷]</DIV>
									<DIV class="title">프로그래밍...</DIV>
									<DIV class="writer">Takuya | 로드북</DIV>
									<DIV class="price">
										<SPAN>25,000원</SPAN><BR>22,500원
									</DIV>
								</DIV>
							</LI>
							<LI>
								<DIV class="no_back" id="book">
									<IMG width="100" src="../image/xcode.jpg">

									<DIV class="sort">[컴퓨터 인터넷]</DIV>
									<DIV class="title">Xcode4로 ...</DIV>
									<DIV class="writer">Yoshinao | 로드북</DIV>
									<DIV class="price">
										<SPAN>25,000원</SPAN><BR>22,500원
									</DIV>
								</DIV>
							</LI>
							<LI>
								<DIV class="no_back" id="book">
									<IMG width="100" src="../image/soft.jpg">

									<DIV class="sort">[컴퓨터 인터넷]</DIV>
									<DIV class="title">거꾸로 배우는 ....</DIV>
									<DIV class="writer">이호종 | 로드북</DIV>
									<DIV class="price">
										<SPAN>16,000원</SPAN><BR>14,400원
									</DIV>
								</DIV>
							</LI>
							<LI>
								<DIV id="book">
									<A href="http://css3.zerois.net/senop/detail_page.php"><IMG
										width="100" src="../image/html5.jpg"></A>
									<DIV class="sort">[컴퓨터 인터넷]</DIV>
									<DIV class="title">
										<A href="http://css3.zerois.net/senop/detail_page.php">처음부터
											다시 배우...</A>
									</DIV>
									<DIV class="writer">양용석 | 로드북</DIV>
									<DIV class="price">
										<SPAN>25,000원</SPAN> <BR>22,500원
									</DIV>
								</DIV>
							</LI>
							<LI>
								<DIV id="book">
									<IMG width="100" src="../image/jquery.jpg">

									<DIV class="sort">[컴퓨터 인터넷]</DIV>
									<DIV class="title">웹 디자이너를 ...</DIV>
									<DIV class="writer">Nishihata | 로드북</DIV>
									<DIV class="price">
										<SPAN>25,000원</SPAN><BR>22,500원
									</DIV>
								</DIV>
							</LI>
							<LI>
								<DIV id="book">
									<IMG width="100" src="../image/challenge.jpg">

									<DIV class="sort">[컴퓨터 인터넷]</DIV>
									<DIV class="title">프로그래밍...</DIV>
									<DIV class="writer">Takuya | 로드북</DIV>
									<DIV class="price">
										<SPAN>25,000원</SPAN><BR>22,500원
									</DIV>
								</DIV>
							</LI>
							<LI>
								<DIV class="no_back" id="book">
									<IMG width="100" src="../image/xcode.jpg">

									<DIV class="sort">[컴퓨터 인터넷]</DIV>
									<DIV class="title">Xcode4로 ...</DIV>
									<DIV class="writer">Yoshinao | 로드북</DIV>
									<DIV class="price">
										<SPAN>25,000원</SPAN><BR>22,500원
									</DIV>
								</DIV>
							</LI>
							<LI>
								<DIV class="no_back" id="book">
									<IMG width="100" src="../image/soft.jpg">

									<DIV class="sort">[컴퓨터 인터넷]</DIV>
									<DIV class="title">거꾸로 배우는 ....</DIV>
									<DIV class="writer">이호종 | 로드북</DIV>
									<DIV class="price">
										<SPAN>16,000원</SPAN><BR>14,400원
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
							href="http://css3.zerois.net/senop/list_page.php#">베스트 셀러</A></LI>
						<LI><A href="http://css3.zerois.net/senop/list_page.php#">최신
								출간</A></LI>
						<LI><A style="border: currentColor; border-image: none;"
							href="http://css3.zerois.net/senop/list_page.php#">최근 등록</A></LI>
					</UL>
				</DIV>
				<TABLE id="list_view">
					<TBODY>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="../image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="http://css3.zerois.net/senop/detail_page.php">처음부터
										다시 배우는 HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">양용석 저 | 로드북 | 2011.10</DIV>
								<P>HTML5와 CSS3의 새로운 점에 포커스를 맞추고 있지는 않다. 웹 표준의 핵심 철학인 "구조와
									디자인의 분리"라는 관점에 맞게 달라진 웹 개발 방식을 제대로 배울 수 있도록 하는 것이 이 책의 주목적. 이
									책으로 학습하는 독자가 HTML5로 구조를 제대로 설계할 수 있고 CSS3로 정밀하고 자유자재로 디자인을 컨트롤할
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000원</SPAN><BR>
							<STRONG>22,500원</STRONG><BR>(10% 할인)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">장바구니</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">구매하기</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">비교하기</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="../image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="http://css3.zerois.net/senop/list_page.php#">처음부터
										다시 배우는 HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">양용석 저 | 로드북 | 2011.10</DIV>
								<P>HTML5와 CSS3의 새로운 점에 포커스를 맞추고 있지는 않다. 웹 표준의 핵심 철학인 "구조와
									디자인의 분리"라는 관점에 맞게 달라진 웹 개발 방식을 제대로 배울 수 있도록 하는 것이 이 책의 주목적. 이
									책으로 학습하는 독자가 HTML5로 구조를 제대로 설계할 수 있고 CSS3로 정밀하고 자유자재로 디자인을 컨트롤할
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000원</SPAN><BR>
							<STRONG>22,500원</STRONG><BR>(10% 할인)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">장바구니</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">구매하기</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">비교하기</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="../image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="http://css3.zerois.net/senop/list_page.php#">처음부터
										다시 배우는 HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">양용석 저 | 로드북 | 2011.10</DIV>
								<P>HTML5와 CSS3의 새로운 점에 포커스를 맞추고 있지는 않다. 웹 표준의 핵심 철학인 "구조와
									디자인의 분리"라는 관점에 맞게 달라진 웹 개발 방식을 제대로 배울 수 있도록 하는 것이 이 책의 주목적. 이
									책으로 학습하는 독자가 HTML5로 구조를 제대로 설계할 수 있고 CSS3로 정밀하고 자유자재로 디자인을 컨트롤할
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000원</SPAN><BR>
							<STRONG>22,500원</STRONG><BR>(10% 할인)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">장바구니</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">구매하기</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">비교하기</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="../image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="http://css3.zerois.net/senop/list_page.php#">처음부터
										다시 배우는 HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">양용석 저 | 로드북 | 2011.10</DIV>
								<P>HTML5와 CSS3의 새로운 점에 포커스를 맞추고 있지는 않다. 웹 표준의 핵심 철학인 "구조와
									디자인의 분리"라는 관점에 맞게 달라진 웹 개발 방식을 제대로 배울 수 있도록 하는 것이 이 책의 주목적. 이
									책으로 학습하는 독자가 HTML5로 구조를 제대로 설계할 수 있고 CSS3로 정밀하고 자유자재로 디자인을 컨트롤할
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000원</SPAN><BR>
							<STRONG>22,500원</STRONG><BR>(10% 할인)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">장바구니</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">구매하기</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">비교하기</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="../image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="http://css3.zerois.net/senop/list_page.php#">처음부터
										다시 배우는 HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">양용석 저 | 로드북 | 2011.10</DIV>
								<P>HTML5와 CSS3의 새로운 점에 포커스를 맞추고 있지는 않다. 웹 표준의 핵심 철학인 "구조와
									디자인의 분리"라는 관점에 맞게 달라진 웹 개발 방식을 제대로 배울 수 있도록 하는 것이 이 책의 주목적. 이
									책으로 학습하는 독자가 HTML5로 구조를 제대로 설계할 수 있고 CSS3로 정밀하고 자유자재로 디자인을 컨트롤할
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000원</SPAN><BR>
							<STRONG>22,500원</STRONG><BR>(10% 할인)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">장바구니</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">구매하기</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">비교하기</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="../image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="http://css3.zerois.net/senop/list_page.php#">처음부터
										다시 배우는 HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">양용석 저 | 로드북 | 2011.10</DIV>
								<P>HTML5와 CSS3의 새로운 점에 포커스를 맞추고 있지는 않다. 웹 표준의 핵심 철학인 "구조와
									디자인의 분리"라는 관점에 맞게 달라진 웹 개발 방식을 제대로 배울 수 있도록 하는 것이 이 책의 주목적. 이
									책으로 학습하는 독자가 HTML5로 구조를 제대로 설계할 수 있고 CSS3로 정밀하고 자유자재로 디자인을 컨트롤할
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000원</SPAN><BR>
							<STRONG>22,500원</STRONG><BR>(10% 할인)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">장바구니</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">구매하기</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">비교하기</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="../image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="http://css3.zerois.net/senop/list_page.php#">처음부터
										다시 배우는 HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">양용석 저 | 로드북 | 2011.10</DIV>
								<P>HTML5와 CSS3의 새로운 점에 포커스를 맞추고 있지는 않다. 웹 표준의 핵심 철학인 "구조와
									디자인의 분리"라는 관점에 맞게 달라진 웹 개발 방식을 제대로 배울 수 있도록 하는 것이 이 책의 주목적. 이
									책으로 학습하는 독자가 HTML5로 구조를 제대로 설계할 수 있고 CSS3로 정밀하고 자유자재로 디자인을 컨트롤할
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000원</SPAN><BR>
							<STRONG>22,500원</STRONG><BR>(10% 할인)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">장바구니</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">구매하기</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">비교하기</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="../image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="http://css3.zerois.net/senop/list_page.php#">처음부터
										다시 배우는 HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">양용석 저 | 로드북 | 2011.10</DIV>
								<P>HTML5와 CSS3의 새로운 점에 포커스를 맞추고 있지는 않다. 웹 표준의 핵심 철학인 "구조와
									디자인의 분리"라는 관점에 맞게 달라진 웹 개발 방식을 제대로 배울 수 있도록 하는 것이 이 책의 주목적. 이
									책으로 학습하는 독자가 HTML5로 구조를 제대로 설계할 수 있고 CSS3로 정밀하고 자유자재로 디자인을 컨트롤할
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000원</SPAN><BR>
							<STRONG>22,500원</STRONG><BR>(10% 할인)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">장바구니</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">구매하기</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">비교하기</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="../image/html5.jpg"></TD>
							<TD class="goods_description">
								<H2>
									<A href="#">처음부터
										다시 배우는 HTML5 CSS3 </A>
								</H2>
								<DIV class="writer_press">양용석 저 | 로드북 | 2011.10</DIV>
								<P>HTML5와 CSS3의 새로운 점에 포커스를 맞추고 있지는 않다. 웹 표준의 핵심 철학인 "구조와
									디자인의 분리"라는 관점에 맞게 달라진 웹 개발 방식을 제대로 배울 수 있도록 하는 것이 이 책의 주목적. 이
									책으로 학습하는 독자가 HTML5로 구조를 제대로 설계할 수 있고 CSS3로 정밀하고 자유자재로 디자인을 컨트롤할
									...</P>
							</TD>
							<TD class="price"><SPAN>25,000원</SPAN><BR>
							<STRONG>22,500원</STRONG><BR>(10% 할인)</TD>
							<TD><INPUT type="checkbox" value=""></TD>
							<TD class="buy_btns">
								<UL>
									<LI><A href="#">장바구니</A></LI>
									<LI><A href="#">구매하기</A></LI>
									<LI><A href="#">비교하기</A></LI>
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