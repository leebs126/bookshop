<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<H3>${goods.goods_title }</H3>
					<H4>${goods.goods_writer} 저| ${goods.goods_publisher }</H4>
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
								<TD class="fixed">정가</TD>
								<TD><SPAN>${goods.goods_price}원</SPAN></TD>
							</TR>
							<TR class="dot_line">
								<TD class="fixed">판매가</TD>
								<TD><SPAN class="active">${goods.goods_price*0.9}원 (10% 할인)</SPAN></TD>
							</TR>
							<TR>
								<TD class="fixed">포인트적립</TD>
								<TD class="active">${goods.goods_point}P(10%적립)</TD>
							</TR>
							<TR class="dot_line">
								<TD class="fixed">포인트 추가적립</TD>
								<TD>만원이상 구매시 1,000P, 5만원이상 구매시 2,000P추가적립 편의점 배송 이용시 300P
									추가적립</TD>
							</TR>
							<TR>
								<TD class="fixed">발행일</TD>
								<TD>${goods.goods_published_date}</TD>
							</TR>
							<TR>
								<TD class="fixed">페이지 수</TD>
								<TD>${goods.goods_page_total}쪽</TD>
							</TR>
							<TR class="dot_line">
								<TD class="fixed">ISBN</TD>
								<TD>${goods.goods_isbn}</TD>
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
							href="#">구매하기 </A></LI>
						<LI><A class="cart"
							href="#">장바구니</A></LI>
						<LI><A class="wish"
							href="#">위시리스트</A></LI>
					</UL>
				</DIV>
				<DIV class="clear"></DIV>
				<!-- 내용 들어 가는 곳 -->
				<DIV id="container">
					<UL class="tabs">
						<LI><A
							href="#tab1">책소개</A></LI>
						<LI><A
							href="#tab2">저자소개</A></LI>
						<LI><A
							href="#tab3">책목차</A></LI>
						<LI><A
							href="#tab4">출판사서평</A></LI>
						<LI><A
							href="#tab5">추천사</A></LI>
						<LI><A
							href="#tab6">리뷰</A></LI>
					</UL>
					<DIV class="tab_container">
						<DIV class="tab_content" id="tab1">
							<H4>책소개</H4>
							<P>
							  ${goods.goods_intro}
							</P>
								<c:forEach var="image" items="${goods.list_detail_Image }" >
									<IMG width="600" height="771" 
										src="<%=request.getContextPath()%>/download.do?fileName=${image.fileName}">
								</c:forEach>
						</DIV>
						<DIV class="tab_content" id="tab2">
							<H4>저자소개</H4>
							<P>
							<DIV class="writer">저자 : ${goods.goods_writer}</DIV>
							${goods.goods_writer_intro }
							<P></P>
						</DIV>
						<DIV class="tab_content" id="tab3">
							<H4>책목차</H4>
							<P>
								${goods.goods_contents_order }							
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

	<%@ include file="../common/footer.jsp"%>
</BODY>
</HTML>
