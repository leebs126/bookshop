<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<h1>최근주문내역
    <A href="#"> <IMG  src="<%=request.getContextPath()%>/image/btn_more_see.jpg">  </A> 
</h1>
<TABLE class="list_view">
		<TBODY align=center >
			<tr style="background:#33ff00" >
				<td>주문일자</td>
				<td>주문번호</td>
				<td>주문내역</td>
				<td>주문상태</td>
				<td>배송</td>
			</tr>
<c:choose>
<c:when test="${ empty my_order_list }">
		  <TR>
		    <TD colspan=5 class="fixed">
				  <STRONG>주문한 상품이 없습니다.</STRONG>
		    </TD>
		  </TR>
</c:when>
<c:otherwise>
	<c:forEach var="item" items="${my_order_list }">
		<TR>
		  <TD>${item.pay_order_time }</TD>
		   <TD >
		     <a href="<%=request.getContextPath()%>/mine/mine.do?command=my_order_detail&order_id=${item.order_id }">${item.order_id }  </a>
		   </TD>
			<td><SPAN>${item.goods_title }</SPAN></td>
			<td>${item.delivery_state }</td>
			<td>
				<A href="#"> <IMG  src="<%=request.getContextPath()%>/image/btn_search_delivery.jpg">
				</A><Br> 
			</TD>
			</TR>
	</c:forEach>
</c:otherwise>
</c:choose> 	    
</TBODY>
</TABLE>

<br><br><br>	
<h1>계좌내역
    <A href="#"> <IMG  src="<%=request.getContextPath()%>/image/btn_more_see.jpg" />  </A>
</h1>
<TABLE border=0 width=100%  cellpadding=10 cellspacing=10>
  <tr>
    <td>
	   예치금 &nbsp;&nbsp;  <strong>10000원</strong>
   </td>
    <td>
	   쇼핑머니 &nbsp;&nbsp; <strong>9000원</strong>
   </td>
   </tr>
   <tr>
    <td>
	   쿠폰 &nbsp;&nbsp;  <strong>6000원</strong>
   </td>
    <td>
	   포인트 &nbsp;&nbsp; <strong>2000원</strong>
   </td>
   </tr>
   <tr>
    <td>
	   상품권 &nbsp;&nbsp;  <strong>4000원</strong>
   </td>
    <td>
		디지털머니 &nbsp;&nbsp; <strong>9000원</strong>
   </td>
   </tr>
</TABLE>

<br><br><br>	
<h1>나의 정보
    <A href="#"> <IMG  src="<%=request.getContextPath()%>/image/btn_more_see.jpg" />  </A>
</h1>
<TABLE border=0 width=100% cellpadding=10 cellspacing=10>
  <tr>
    <td>
	   이메일:
   </td>
    <td>
	   <strong>${member_info.email1 }@${member_info.email2 }</strong>
   </td>
   </tr>
   <tr>
    <td>
	   전화번호 
   </td>
    <td>
	   <strong>${member_info.hp1 }-${member_info.hp2}-${member_info.hp3 }</strong>
   </td>
   </tr>
   <tr>
    <td>
	  주소 
   </td>
    <td>
		도로명:  &nbsp;&nbsp; <strong>${member_info.roadAddress }</strong>  <br>
		지번:   &nbsp;&nbsp; <strong>${member_info.jibunAddress }</strong> 
   </td>
   </tr>
</TABLE>
</body>
</html>