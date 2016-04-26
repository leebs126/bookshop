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
					<H1>검색 결과</H1>
				</HGROUP>

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
								src="<%=request.getContextPath() %>/image/html5.jpg"></TD>
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
									<LI><A href="#">삭제하기</A></LI>
									<LI><A href="#">수정하기</A></LI>
								</UL>
							</TD>
						</TR>
						<TR>
							<TD class="goods_image"><IMG width="75" alt=""
								src="<%=request.getContextPath() %>/image/html5.jpg"></TD>
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
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">삭제하기</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">수정하기</A></LI>
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
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">삭제하기</A></LI>
									<LI><A href="http://css3.zerois.net/senop/list_page.php#">수정하기</A></LI>
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
									<LI><A href="#">삭제하기</A></LI>
									<LI><A href="#">수정하기</A></LI>
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