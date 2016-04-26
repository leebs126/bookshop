<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

</script>
</head>
<BODY>
	<H1>1.���� �ֹ� ������</H1>
	<TABLE class="list_view">
		<TBODY align=center>
			<tr style="background: #33ff00">
			     <td>�ֹ���ȣ </td>
				<td colspan=2 class="fixed">�ֹ���ǰ��</td>
				<td>����</td>
				<td>�ֹ��ݾ�</td>
				<td>��ۺ�</td>
				<td>����������</td>
				<td>�ֹ��ݾ��հ�</td>
			</tr>
			<TR>
				<c:forEach var="item" items="${my_order_goods_list }">
				    <td> ${item.order_id }</td>
					<TD class="goods_image">
					  <a href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">
					    <IMG width="75" alt=""  src="<%=request.getContextPath() %>/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"">
					  </a>
					</TD>
					<TD>
					  <h2>
					     <A href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">${item.goods_title }</A>
					  </h2>
					</TD>
					<td>
					  <h2>${item.order_goods_qty }��<h2>
					</td>
					<td><h2>${item.order_goods_qty *item.goods_sales_price}�� (10% ����)</h2></td>
					<td><h2>0��</h2></td>
					<td><h2>${1500 *item.order_goods_qty }��</h2></td>
					<td>
					  <h2>${item.order_goods_qty *item.goods_sales_price}��</h2>
					</td>
			</TR>
			</c:forEach>
		</TBODY>
	</TABLE>
	<DIV class="clear"></DIV>
<form  name="form_order">
	<br>
	<br>
	<H1>2.����� ����</H1>
	<DIV class="detail_table">
	
		<TABLE>
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">��۹��</TD>
					<TD>
					   ${my_order_info.delivery_method }
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">������ ��</TD>
					<TD>
					${my_order_info.receiver_name }
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">�޴�����ȣ</TD>
					<TD>
					  ${my_order_info.receiver_hp1}-${my_order_info.receiver_hp2}-${my_order_info.receiver_hp3}</TD>
				  </TR>
				<TR class="dot_line">
					<TD class="fixed_join">������ȭ(����)</TD>
					<TD>
					   ${my_order_info.receiver_tel1}-${my_order_info.receiver_tel2}-${my_order_info.receiver_tel3}</TD>
					</TD>
				</TR>


				<TR class="dot_line">
					<TD class="fixed_join">�ּ�</TD>
					<td>
					   ${my_order_info.delivery_address}
					</td>>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">��� �޽���</TD>
					<TD>
					${my_order_info.delivery_message}
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">���� ����</TD>
					<td>
					${my_order_info.gift_wrapping}
					</td>
				</TR>
			</TBODY>
		</TABLE>
		
	</DIV>
	<div >
	  <br><br>
	   <h2>�ֹ���</h2>
		 <table >
		   <TBODY>
			 <tr class="dot_line">
				<td ><h2>�̸�</h2></td>
				<td>
				 <input  type="text" value="${orderer.member_name}" size="15" disabled />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td ><h2>�ڵ���</h2></td>
				<td>
				 <input  type="text" value="${orderer.hp1}-${orderer.hp2}-${orderer.hp3}" size="15" disabled />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td ><h2>�̸���</h2></td>
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
	<H1>3.��������</H1>
	<DIV class="detail_table">
		<table>
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">�������</TD>
					<TD>
					   ${my_order_info.pay_method }
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">����ī��</TD>
					<TD>
					   ${my_order_info.card_com_name}
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">�ҺαⰣ</TD>
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
	
			
			
			