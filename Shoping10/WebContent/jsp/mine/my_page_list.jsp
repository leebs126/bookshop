<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<h1>�ֱ��ֹ�����
    <A href="#"> <IMG  src="<%=request.getContextPath()%>/image/btn_more_see.jpg">  </A> 
</h1>
<TABLE class="list_view">
		<TBODY align=center >
			<tr style="background:#33ff00" >
				<td>�ֹ�����</td>
				<td>�ֹ���ȣ</td>
				<td>�ֹ�����</td>
				<td>�ֹ�����</td>
				<td>���</td>
			</tr>
<c:choose>
<c:when test="${ empty my_order_list }">
		  <TR>
		    <TD colspan=5 class="fixed">
				  <STRONG>�ֹ��� ��ǰ�� �����ϴ�.</STRONG>
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
<h1>���³���
    <A href="#"> <IMG  src="<%=request.getContextPath()%>/image/btn_more_see.jpg" />  </A>
</h1>
<TABLE border=0 width=100%  cellpadding=10 cellspacing=10>
  <tr>
    <td>
	   ��ġ�� &nbsp;&nbsp;  <strong>10000��</strong>
   </td>
    <td>
	   ���θӴ� &nbsp;&nbsp; <strong>9000��</strong>
   </td>
   </tr>
   <tr>
    <td>
	   ���� &nbsp;&nbsp;  <strong>6000��</strong>
   </td>
    <td>
	   ����Ʈ &nbsp;&nbsp; <strong>2000��</strong>
   </td>
   </tr>
   <tr>
    <td>
	   ��ǰ�� &nbsp;&nbsp;  <strong>4000��</strong>
   </td>
    <td>
		�����иӴ� &nbsp;&nbsp; <strong>9000��</strong>
   </td>
   </tr>
</TABLE>

<br><br><br>	
<h1>���� ����
    <A href="#"> <IMG  src="<%=request.getContextPath()%>/image/btn_more_see.jpg" />  </A>
</h1>
<TABLE border=0 width=100% cellpadding=10 cellspacing=10>
  <tr>
    <td>
	   �̸���:
   </td>
    <td>
	   <strong>${member_info.email1 }@${member_info.email2 }</strong>
   </td>
   </tr>
   <tr>
    <td>
	   ��ȭ��ȣ 
   </td>
    <td>
	   <strong>${member_info.hp1 }-${member_info.hp2}-${member_info.hp3 }</strong>
   </td>
   </tr>
   <tr>
    <td>
	  �ּ� 
   </td>
    <td>
		���θ�:  &nbsp;&nbsp; <strong>${member_info.roadAddress }</strong>  <br>
		����:   &nbsp;&nbsp; <strong>${member_info.jibunAddress }</strong> 
   </td>
   </tr>
</TABLE>
</body>
</html>