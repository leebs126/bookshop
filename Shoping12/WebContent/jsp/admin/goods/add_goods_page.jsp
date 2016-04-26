<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	isELIgnored="false" %>

<!DOCTYPE html PUBLIC "" "">
<head>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">

<META charset="utf-8">
<META name="viewport" content="width=device-width">
<LINK href="<%=request.getContextPath()%>/css/main.css"
	rel="stylesheet" type="text/css" media="screen">
<LINK href="<%=request.getContextPath()%>/css/basic-jquery-slider.css"
	rel="stylesheet" type="text/css" media="screen">
<LINK href="<%=request.getContextPath()%>/css/mobile.css"
	rel="stylesheet" type="text/css">
<SCRIPT src="<%=request.getContextPath()%>/jquery/jquery-1.6.2.min.js"
	type="text/javascript"></SCRIPT>
<SCRIPT src="<%=request.getContextPath()%>/jquery/jquery.easing.1.3.js"
	type="text/javascript"></SCRIPT>
<SCRIPT
	src="<%=request.getContextPath()%>/jquery/stickysidebar.jquery.js"
	type="text/javascript"></SCRIPT>
<SCRIPT src="<%=request.getContextPath()%>/jquery/tabs.js"
	type="text/javascript"></SCRIPT>
<SCRIPT src="<%=request.getContextPath()%>/jquery/carousel.js"
	type="text/javascript"></SCRIPT>
</head>

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
<form action="<%=request.getContextPath() %>/admin/admin.do" method="post">
		<h1>����ǰ ���â</h1>
<DIV class="clear"></DIV>
	<!-- ���� ��� ���� �� -->
	<DIV id="container">
		<UL class="tabs">
			<LI><A href="#tab1">��ǰ����</A></LI>
			<LI><A href="#tab2">��ǰ����</A></LI>
			<LI><A href="#tab3">��ǰ���ڼҰ�</A></LI>
			<LI><A href="#tab4">��ǰ�Ұ�</A></LI>
			<LI><A href="#tab5">���ǻ� ��ǰ ��</A></LI>
			<LI><A href="#tab6">��õ��</A></LI>
		</UL>
		<DIV class="tab_container">
			<DIV class="tab_content" id="tab1">
				<table >
			<tr >
				<td width=200 >��ǰ�з�</td>
				<td width=500><select name="goods_sort">
						<option value="��ǻ�Ϳ� ���ͳ�" selected>��ǻ�Ϳ� ���ͳ�
						<option value="������ ���">������ ���
					</select>
				</td>
			</tr>
			<tr >
				<td >��ǰ�̸�</td>
				<td><input name="goods_title" type="text" size="40" /></td>
			</tr>
			
			<tr>
				<td >����</td>
				<td><input name="goods_writer" type="text" size="40" /></td>
			</tr>
			<tr>
				<td >���ǻ�</td>
				<td><input name="goods_publisher" type="text" size="40" /></td>
			</tr>
			<tr>
				<td >��ǰ����</td>
				<td><input name="goods_price" type="text" size="40" /></td>
			</tr>
			
			<tr>
				<td >��ǰ�ǸŰ���</td>
				<td><input name="goods_sales_price" type="text" size="40" /></td>
			</tr>
			
			
			<tr>
				<td >��ǰ ���� ����Ʈ</td>
				<td><input name="goods_point" type="text" size="40" /></td>
			</tr>
			
			<tr>
				<td >��ǰ������</td>
				<td><input  name="goods_published_date"  type="text" size="40" /></td>
			</tr>
			
			<tr>
				<td >��ǰ �� ��������</td>
				<td><input name="goods_page_total" type="text" size="40" /></td>
			</tr>
			
			<tr>
				<td >ISBN</td>
				<td><input name="goods_isbn" type="text" size="40" /></td>
			</tr>
			<tr>
				<td >��ǰ ��ۺ�</td>
				<td><input name="goods_delivery_price" type="text" size="40" /></td>
			</tr>
			<tr>
				<td >��ǰ ���� ������</td>
				<td><input name="goods_delivery_date" type="text" size="40" /></td>
			</tr>
			
			<tr>
				<td >��ǰ����</td>
				<td>
				<select name="goods_type">
				  <option value="bestseller"  >����Ʈ����</option>
				  <option value="steadyseller" >���׵𼿷�</option>
				  <option value="newbook" selected >�Ű�</option>
				  <option value="onSale" >�Ǹ���</option>
				  <option value="buyout" >ǰ��</option>
				  <option value="outOfPrint" >����</option>
				</select>
				</td>
			</tr>
			<tr>
			 <td>
			   <br>
			 </td>
			</tr>
				</table>	
			</DIV>
			<DIV class="tab_content" id="tab2">
				<H4>å����</H4>
				<table>	
				 <tr>
					<td >å����</td>
					<td><textarea  rows="100" cols="80" name="goods_contents_order"></textarea></td>
				</tr>
				</table>	
			</DIV>
			<DIV class="tab_content" id="tab3">
				<H4>��ǰ ���� �Ұ�</H4>
				<P>
				 <table>
  				 <tr>
					<td>��ǰ ���� �Ұ�</td>
					<td><textarea  rows="100" cols="80" name="goods_intro"></textarea></td>
			    </tr>
			   </table>
				</P>
			</DIV>
			<DIV class="tab_content" id="tab4">
				<H4>��ǰ�Ұ�</H4>
				<P>
				<table>
					<tr>
						<td >��ǰ�Ұ�</td>
						<td><textarea  rows="100" cols="80" name="goods_writer_intro"></textarea></td>
				    </tr>
			    </table>
				</P>
			</DIV>
			<DIV class="tab_content" id="tab5">
				<H4>���ǻ� ��ǰ ��</H4>
				<P>
				<table>
				 <tr>
					<td>���ǻ� ��ǰ ��</td>
					<td><textarea  rows="100" cols="80" name="publisher_comment"></textarea></td>
			    </tr>
			</table>
				</P>
			</DIV>
			<DIV class="tab_content" id="tab6">
				<H4>��õ��</H4>
				<p>
				 <table>
					 <tr>
					   <td>��õ��</td>
					    <td><textarea  rows="100" cols="80" name="recommendation"></textarea></td>
				    </tr>
			    </table>
				</p>
			</DIV>
		</DIV>
		
	</DIV>
	<DIV class="clear"></DIV>
<center>	
	 <table>
	 <tr>
			  <td align=center>
				  <input type="hidden" name="command" value="add_goods" />
				  <INPUT name="add_goods"  type="submit" value="��ǰ ����ϱ�"> 
			  </td>
			</tr>
	 </table>
</center>	 
</form>	 