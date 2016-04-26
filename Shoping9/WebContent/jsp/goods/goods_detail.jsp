<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html PUBLIC "" "">
<HTML>
<HEAD>
<style>
#layer {
	z-index: 2;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	/* background-color:rgba(0,0,0,0.8); */
}

#popup {
	z-index: 3;
	position: fixed;
	text-align: center;
	left: 50%;
	top: 45%;
	width: 300px;
	height: 200px;
	background-color: #ccffff;
	border: 3px solid #87cb42;
}

#close {
	z-index: 4;
	float: right;
}
</style>
<script type="text/javascript">
	function add_cart(goods_id) {
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "http://localhost:8090/Shoping9/cart/cart.do",
			data : {
				command:"add_cart",
				goods_id:goods_id
				
			},
			success : function(data, textStatus) {
				//alert(data);
			//	$('#message').append(data);
				if(data.trim()=='add_success'){
					imagePopup('open', '.layer01');	
				}else if(data.trim()=='already_existed'){
					alert("이미 카트에 등록된 제품입니다.");	
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	
	}

	function imagePopup(type) {
		if (type == 'open') {
			// 팝업창을 연다.
			jQuery('#layer').attr('style', 'visibility:visible');

			// 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
			jQuery('#layer').height(jQuery(document).height());
		}

		else if (type == 'close') {

			// 팝업창을 닫는다.
			jQuery('#layer').attr('style', 'visibility:hidden');
		}
	}
</script>
</HEAD>
<BODY>

	<HGROUP>
		<H1>컴퓨터와 인터넷</H1>
		<H2>국내외 도서 &gt; 컴퓨터와 인터넷 &gt; 웹 개발</H2>
		<H3>${goods.goods_title }</H3>
		<H4>${goods.goods_writer}저| ${goods.goods_publisher }</H4>
	</HGROUP>
	<DIV id="goods_image">
		<FIGURE>
			<IMG alt="HTML5 &amp; CSS3"
				src="<%=request.getContextPath()%>/download.do?goods_id=${goods.goods_id}&fileName=${goods.goods_fileName}">
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
					<TD><SPAN class="active">${goods.goods_price*0.9}원 (10%
							할인)</SPAN></TD>
				</TR>
				<TR>
					<TD class="fixed">포인트적립</TD>
					<TD class="active">${goods.goods_point}P(10%적립)</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed">포인트 추가적립</TD>
					<TD>만원이상 구매시 1,000P, 5만원이상 구매시 2,000P추가적립 편의점 배송 이용시 300P 추가적립</TD>
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
					<TD><STRONG>[당일배송]</STRONG> 당일배송 서비스 시작!<BR> <STRONG>[휴일배송]</STRONG>
						휴일에도 배송받는 Senop</TD>
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
			<LI><A class="buy" href="#">구매하기 </A></LI>
			<LI><A class="cart" href="javascript:add_cart('${goods.goods_id }')">장바구니</A></LI>
			<!-- <LI><A class="cart" href="javascript:imagePopup('close', '.layer01');">장바구니</A></LI> -->
			
			<LI><A class="wish" href="#">위시리스트</A></LI>
		</UL>
	</DIV>
	<DIV class="clear"></DIV>
	<!-- 내용 들어 가는 곳 -->
	<DIV id="container">
		<UL class="tabs">
			<LI><A href="#tab1">책소개</A></LI>
			<LI><A href="#tab2">저자소개</A></LI>
			<LI><A href="#tab3">책목차</A></LI>
			<LI><A href="#tab4">출판사서평</A></LI>
			<LI><A href="#tab5">추천사</A></LI>
			<LI><A href="#tab6">리뷰</A></LI>
		</UL>
		<DIV class="tab_container">
			<DIV class="tab_content" id="tab1">
				<H4>책소개</H4>
				<P>${goods.goods_intro}</P>
				<c:forEach var="image" items="${goods.list_detail_Image }">
					<IMG width="600" height="771"
						src="<%=request.getContextPath()%>/download.do?goods_id=${goods.goods_id}&fileName=${image.fileName}">
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
				<P>${goods.goods_contents_order }</P>
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
	<DIV class="clear"></DIV>
	<div id="layer" style="visibility: hidden">
		<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
		<div id="popup">
			<!-- 팝업창 닫기 버튼 -->
			<a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');"> <img
				src="<%=request.getContextPath()%>/image/close.png" id="close" />
			</a> <br /> <font size="12" id="contents">장바구니에 담았습니다.</font><br>
<form action='<%=request.getContextPath() %>/cart/cart.do?command=my_cart_list'>				
		<input  name="btn_cancel_member" type="submit" value="장바구니 보기">
		<input  type="hidden" name="command" value="my_cart_list"/>
</form>				
			<div></div>
</BODY>
</HTML>
