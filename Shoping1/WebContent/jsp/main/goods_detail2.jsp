<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "" "">
<HTML>
<HEAD>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">

<META charset="utf-8">
<META name="viewport" content="width=device-width">
<TITLE>도서 쇼핑몰</TITLE>
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
				<%@ include file="./header.jsp"%>
			</HEADER>
			<DIV class="clear"></DIV>
			<ASIDE>
				<%@ include file="./side.jsp"%>
			</ASIDE>
			
			<ARTICLE>
				<HGROUP>
					<H1>컴퓨터와 인터넷</H1>
					<H2>국내외 도서 &gt; 컴퓨터와 인터넷 &gt; 웹 개발</H2>
					<H3>처음부터 다시 배우는 HTML5&amp;CSS3 : 실전 웹 표준 사이트 구축까지</H3>
					<H4>양용석 저| 로드북</H4>
				</HGROUP>
				<DIV id="goods_image">
					<FIGURE>
						<IMG alt="HTML5 &amp; CSS3" src="../image/HTML5CSS3.jpg">
					</FIGURE>
				</DIV>
				<DIV id="detail_table">
					<TABLE>
						<TBODY>
							<TR>
								<TD class="fixed">정가</TD>
								<TD><SPAN>25,000원</SPAN></TD>
							</TR>
							<TR class="dot_line">
								<TD class="fixed">판매가</TD>
								<TD><SPAN class="active">22,500원 (10% 할인)</SPAN></TD>
							</TR>
							<TR>
								<TD class="fixed">포인트적립</TD>
								<TD class="active">2250P(10%적립)</TD>
							</TR>
							<TR class="dot_line">
								<TD class="fixed">포인트 추가적립</TD>
								<TD>만원이상 구매시 1,000P, 5만원이상 구매시 2,000P추가적립 편의점 배송 이용시 300P
									추가적립</TD>
							</TR>
							<TR>
								<TD class="fixed">발행일</TD>
								<TD>2011년 10월 04일</TD>
							</TR>
							<TR>
								<TD class="fixed">페이지 수</TD>
								<TD>448쪽</TD>
							</TR>
							<TR class="dot_line">
								<TD class="fixed">ISBN</TD>
								<TD>9788996659839</TD>
							</TR>
							<TR>
								<TD class="fixed">배송료</TD>
								<TD><STRONG>무료</STRONG></TD>
							</TR>
							<TR>
								<TD class="fixed">배송안내</TD>
								<TD><STRONG>[당일배송]</STRONG> 당일배송 서비스 시작!<BR>
								<STRONG>[휴일배송]</STRONG> 휴일에도 배송받는 Senop</TD>
							</TR>
							<TR>
								<TD class="fixed">도착예정일</TD>
								<TD>지금 주문 시 내일 도착 예정</TD>
							</TR>
							<TR>
								<TD class="fixed">수량</TD>
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
							href="http://css3.zerois.net/senop/detail_page.php#">구매하기 </A></LI>
						<LI><A class="cart"
							href="http://css3.zerois.net/senop/detail_page.php#">장바구니</A></LI>
						<LI><A class="wish"
							href="http://css3.zerois.net/senop/detail_page.php#">위시리스트</A></LI>
					</UL>
				</DIV>
				<DIV class="clear"></DIV>
				<!-- 내용 들어 가는 곳 -->
				<DIV id="container">
					<UL class="tabs">
						<LI><A
							href="http://css3.zerois.net/senop/detail_page.php#tab1">책소개</A></LI>
						<LI><A
							href="http://css3.zerois.net/senop/detail_page.php#tab2">저자소개</A></LI>
						<LI><A
							href="http://css3.zerois.net/senop/detail_page.php#tab3">책목차</A></LI>
						<LI><A
							href="http://css3.zerois.net/senop/detail_page.php#tab4">출판사서평</A></LI>
						<LI><A
							href="http://css3.zerois.net/senop/detail_page.php#tab5">추천사</A></LI>
						<LI><A
							href="http://css3.zerois.net/senop/detail_page.php#tab6">리뷰</A></LI>
					</UL>
					<DIV class="tab_container">
						<DIV class="tab_content" id="tab1">
							<H4>책소개</H4>
							<P>HTML5와 CSS3의 새로운 점에 포커스를 맞추고 있지는 않다. 웹 표준의 핵심 철학인 "구조와
								디자인의 분리"라는 관점에 맞게 달라진 웹 개발 방식을 제대로 배울 수 있도록 하는 것이 이 책의 주목적. 이
								책으로 학습하는 독자가 HTML5로 구조를 제대로 설계할 수 있고 CSS3로 정밀하고 자유자재로 디자인을 컨트롤할
								수 있는 정도의 수준까지 될 수 있도록 구성하였다. 특히, 3부에서는 최신의 브라우저를 기준으로 HTML5와
								CSS3를 이용하여 가상이지만 대표할 만한 기업의 웹 표준 사이트를 구축해본다.</P>
							<IMG width="600" height="771" src="../image/14462107.jpg">
						</DIV>
						<DIV class="tab_content" id="tab2">
							<H4>저자소개</H4>
							<P>
							<DIV class="writer">저자 : 양용석</DIV>
							두산정보통신 인터넷 사업팀에서 첫 직장생활을 시작으로, 두산 그룹, 국제 유도연맹, 두산 베어스 등의 웹사이트를
							개발했다. 그 후 다양한 인터넷 회사에서 웹사이트를 개발하였고 지금은 프리랜서로 활동하고 있다. 최근 두바이 아시아나
							호텔 사이트를 개발했다. 제주대학교에서 정보공학(현 컴퓨터공학)을 전공했으며, 현재 제주도에서 아내와 두 딸 그리고
							아들과 함께 살고 있다.
							<P></P>
						</DIV>
						<DIV class="tab_content" id="tab3">
							<H4>책목차</H4>
							<P>
								1부 웹 표준과 HTML &amp; CSS의 기초<BR>
								<BR>01장 웹 표준이란 <BR>Section 1 웹 표준의 등장 배경 <BR>Section
								2 웹 접근성을 높여주는 웹 표준 <BR>Section 3 환경을 보호하는 웹 표준 <BR>Section
								4 사이트 개발 기간의 단축과 유지 보수의 용이성 <BR>Section 5 정밀하게 제어할 수 있는 사이트
								디자인 <BR>
								<BR>02장 HTML5 소개 <BR>Section 1 DOCTYPE 정의하기 <BR>Section
								2 HTML 문서의 기본 구조 <BR>Section 3 HTML5와 XHTML1.0의 차이점 <BR>Section
								4 HTML5에서 추가된 태그 <BR>Section 5 HTML5에서 사라진 태그 <BR>
								<BR>03장 웹사이트 구조 설계를 통해 살펴 본 HTML5의 장점<BR>Section 1
								HTML 문서의 구조 설계 <BR>Section 2 HTML5를 이용한 HTML 문서 구조 잡기 <BR>
								<BR>
							</P>
						</DIV>
						<DIV class="tab_content" id="tab4">
							<H4>출판사서평</H4>
						</DIV>
						<DIV class="tab_content" id="tab5">
							<H4>추천사</H4>
						</DIV>
						<DIV class="tab_content" id="tab6">
							<H4>리뷰</H4>
						</DIV>
					</DIV>
				</DIV>
			</ARTICLE>
			<DIV class="clear"></DIV>

	<%@ include file="./footer.jsp"%>
</BODY>
</HTML>
