<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

</script>
</head>
<BODY>
	<H1>1.�ֹ� ��ǰ ����</H1>
	<TABLE class="list_view">
		<TBODY align=center>
			<tr style="background: #33ff00">
			     <td>��ۻ���</td>
				<td >��ǰ��</td>
				<td>����</td>
				<td>�ֹ��ݾ�</td>
				<td>����������</td>
				<td>�ֹ��ݾ��հ�</td>
			</tr>
			<TR>
				    <td><h2> ${order_goods_detail.delivery_state }</h2></td>
					<TD>
					  <h2>
					     <A href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${order_goods_detail.goods_id }">${order_goods_detail.goods_title }</A>
					  </h2>
					</TD>
					<td>
					  <h2>${order_goods_detail.order_goods_qty }��</h2>
					</td>
					<td><h2>${order_goods_detail.order_goods_qty *order_goods_detail.goods_sales_price}�� (10% ����)</h2></td>
					<td><h2>${1500 *item.order_goods_qty }��</h2></td>
					<td>
					  <h2>${order_goods_detail.order_goods_qty *order_goods_detail.goods_sales_price}��</h2>
					</td>
			</TR>
		</TBODY>
	</TABLE>
	<DIV class="clear"></DIV>
	<br>
	<br>
	<H1>2.�ֹ�,��� ����</H1>
	<DIV class="detail_table">
		<TABLE>
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">�ֹ���ȣ</TD>
					<TD>
					   ${order_goods_detail.order_id }
				    </TD>
				</TR>
				
				<TR class="dot_line">
					<TD class="fixed_join">��۹��</TD>
					<TD>
					   ${order_goods_detail.delivery_method }
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">������ ��</TD>
					<TD>
					${order_goods_detail.receiver_name }
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">�޴�����ȣ</TD>
					<TD>
					  ${order_goods_detail.receiver_hp1}-${order_goods_detail.receiver_hp2}-${order_goods_detail.receiver_hp3}</TD>
				  </TR>
				<TR class="dot_line">
					<TD class="fixed_join">������ȭ(����)</TD>
					<TD>
					   ${order_goods_detail.receiver_tel1}-${order_goods_detail.receiver_tel2}-${order_goods_detail.receiver_tel3}
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">�ּ�</TD>
					<td>
					   ${order_goods_detail.delivery_address}
					</td>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">��� �޽���</TD>
					<TD>
					${order_goods_detail.delivery_message}
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">���� ����</TD>
					<td>
					${order_goods_detail.gift_wrapping}
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
					   ${order_goods_detail.pay_method }
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">����ī��</TD>
					<TD>
					   ${order_goods_detail.card_com_name}
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">�ҺαⰣ</TD>
					<TD>
					   ${order_goods_detail.card_pay_month }
				    </TD>
				</TR>
			</TBODY>
		</table>
	</DIV>
    <DIV class="clear"></DIV>
	<br>
	<br>
	<br>
	<center>
		<br>
		<br> 
		<a href="<%=request.getContextPath()%>/mine/mine.do?command=my_page_list"> 
		   <IMG width="75" alt="" src="<%=request.getContextPath()%>/image/btn_return_to_list.jpg">
		</a>
<DIV class="clear"></DIV>		
	
			
			
			