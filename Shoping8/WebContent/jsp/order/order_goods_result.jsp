<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

</script>
</head>
<BODY>
	<H1>1.최종 주문 내역서</H1>
	<TABLE class="list_view">
		<TBODY align=center>
			<tr style="background: #33ff00">
			     <td>주문번호 </td>
				<td colspan=2 class="fixed">주문상품명</td>
				<td>수량</td>
				<td>주문금액</td>
				<td>배송비</td>
				<td>예상적립금</td>
				<td>주문금액합계</td>
			</tr>
			<TR>
				<c:forEach var="item" items="${my_order_goods_list }">
				    <td> ${item.order_id }</td>
					<TD class="goods_image">
					  <a href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">
					    <IMG width="75" alt=""  src="<%=request.getContextPath() %>/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"">
					    <input   type="hidden" id="h_goods_id" name="h_goods_id" value="${item.goods_id }" />
					  </a>
					</TD>
					<TD>
					  <h2>
					     <A href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">${item.goods_title }</A>
					      <input   type="hidden" id="h_goods_title" name="h_goods_title" value="${item.goods_title }" />
					  </h2>
					</TD>
					<td>
					  <h2>${item.order_goods_qty }개<h2>
					    <input   type="hidden" id="h_order_goods_qty" name="h_order_goods_qty" value="${item.order_goods_qty}" />
					</td>
					<td><h2>${item.order_total_price}원 (10% 할인)</h2></td>
					<td><h2>0원</h2></td>
					<td><h2>${1500 *item.order_goods_qty }원</h2></td>
					<td>
					  <h2>${item.order_total_price}원</h2>
					  <input  type="hidden" id="h_order_total_price"  name="h_order_total_price" value="${item.order_total_price}" />
					</td>
			</TR>
			</c:forEach>
		</TBODY>
	</TABLE>
	<DIV class="clear"></DIV>
<form  name="form_order">
	<br>
	<br>
	<H1>2.배송지 정보</H1>
	<DIV class="detail_table">
	
		<TABLE>
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">배송방법</TD>
					<TD>
					   ${my_order_info.delivery_method }
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">받으실 분</TD>
					<TD>
					${my_order_info.receiver_name }
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">휴대폰번호</TD>
					<TD>
					  ${my_order_info.receiver_hp1}-${my_order_info.receiver_hp2}-${my_order_info.receiver_hp3}</TD>
				  </TR>
				<TR class="dot_line">
					<TD class="fixed_join">유선전화(선택)</TD>
					<TD>
					   ${my_order_info.receiver_tel1}-${my_order_info.receiver_tel2}-${my_order_info.receiver_tel3}</TD>
					</TD>
				</TR>


				<TR class="dot_line">
					<TD class="fixed_join">주소</TD>
					<td>
					   ${my_order_info.delivery_address}
					</td>>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">배송 메시지</TD>
					<TD>
					${my_order_info.delivery_message}
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">선물 포장</TD>
					<td>
					${my_order_info.gift_wrapping}
					</td>
				</TR>
			</TBODY>
		</TABLE>
		
	</DIV>
	<div >
	  <br><br>
	   <h2>주문고객</h2>
		 <table >
		   <TBODY>
			 <tr class="dot_line">
				<td ><h2>이름</h2></td>
				<td>
				 <input  type="text" value="${my_order_info.orderer_name}" size="15" disabled />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td ><h2>핸드폰</h2></td>
				<td>
				 <input  type="text" value="${orderer.hp1}-${orderer.hp2}-${orderer.hp3}" size="15" disabled />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td ><h2>이메일</h2></td>
				<td>
				   <input  type="text" value="${orderer.email1}@${orderer.email2}" size="15" disabled />
				</td>
			  </tr>
		   </TBODY>
		</table>
	</div>
	<DIV class="clear"></DIV>
	<br>
	<br>
	<br>
	<H1>3.결제정보</H1>
	<DIV class="detail_table">
		<table>
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">결제방법</TD>
					<TD>
					   ${my_order_info.pay_method }
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">결제카드</TD>
					<TD>
					   ${my_order_info.card_com_name}
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">할부기간</TD>
					<TD>
					   ${my_order_info.card_pay_month }
				    </TD>
				</TR>
			</TBODY>
		</table>
	</DIV>
</form>
    <DIV class="clear"></DIV>
	<br>
	<br>
	<br>
	<center>
		<br>
		<br> 
		<a href="<%=request.getContextPath()%>/main/index.do"> 
		   <IMG width="75" alt="" src="<%=request.getContextPath()%>/image/btn_shoping_continue.jpg">
		</a>
<DIV class="clear"></DIV>		
	
			
			
			