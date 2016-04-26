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
			async : false, //false�� ��� ��������� ó���Ѵ�.
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
					alert("�̹� īƮ�� ��ϵ� ��ǰ�Դϴ�.");	
				}
				
			},
			error : function(data, textStatus) {
				alert("������ �߻��߽��ϴ�."+data);
			},
			complete : function(data, textStatus) {
				//alert("�۾����Ϸ� �߽��ϴ�");
				
			}
		}); //end ajax	
	
	}

	function imagePopup(type) {
		if (type == 'open') {
			// �˾�â�� ����.
			jQuery('#layer').attr('style', 'visibility:visible');

			// �������� ���������� ���̾� ������ ���̸� ������ ��ü�� ���̿� ���� �Ѵ�.
			jQuery('#layer').height(jQuery(document).height());
		}

		else if (type == 'close') {

			// �˾�â�� �ݴ´�.
			jQuery('#layer').attr('style', 'visibility:hidden');
		}
	}
</script>
</HEAD>
<BODY>

	<HGROUP>
		<H1>��ǻ�Ϳ� ���ͳ�</H1>
		<H2>������ ���� &gt; ��ǻ�Ϳ� ���ͳ� &gt; �� ����</H2>
		<H3>${goods.goods_title }</H3>
		<H4>${goods.goods_writer}��| ${goods.goods_publisher }</H4>
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
					<TD class="fixed">����</TD>
					<TD><SPAN>${goods.goods_price}��</SPAN></TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed">�ǸŰ�</TD>
					<TD><SPAN class="active">${goods.goods_price*0.9}�� (10%
							����)</SPAN></TD>
				</TR>
				<TR>
					<TD class="fixed">����Ʈ����</TD>
					<TD class="active">${goods.goods_point}P(10%����)</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed">����Ʈ �߰�����</TD>
					<TD>�����̻� ���Ž� 1,000P, 5�����̻� ���Ž� 2,000P�߰����� ������ ��� �̿�� 300P �߰�����</TD>
				</TR>
				<TR>
					<TD class="fixed">������</TD>
					<TD>${goods.goods_published_date}</TD>
				</TR>
				<TR>
					<TD class="fixed">������ ��</TD>
					<TD>${goods.goods_page_total}��</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed">ISBN</TD>
					<TD>${goods.goods_isbn}</TD>
				</TR>
				<TR>
					<TD class="fixed">��۷�</TD>
					<TD><STRONG>����</STRONG></TD>
				</TR>
				<TR>
					<TD class="fixed">��۾ȳ�</TD>
					<TD><STRONG>[���Ϲ��]</STRONG> ���Ϲ�� ���� ����!<BR> <STRONG>[���Ϲ��]</STRONG>
						���Ͽ��� ��۹޴� Senop</TD>
				</TR>
				<TR>
					<TD class="fixed">����������</TD>
					<TD>���� �ֹ� �� ���� ���� ����</TD>
				</TR>
				<TR>
					<TD class="fixed">����</TD>
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
			<LI><A class="buy" href="#">�����ϱ� </A></LI>
			<LI><A class="cart" href="javascript:add_cart('${goods.goods_id }')">��ٱ���</A></LI>
			<!-- <LI><A class="cart" href="javascript:imagePopup('close', '.layer01');">��ٱ���</A></LI> -->
			
			<LI><A class="wish" href="#">���ø���Ʈ</A></LI>
		</UL>
	</DIV>
	<DIV class="clear"></DIV>
	<!-- ���� ��� ���� �� -->
	<DIV id="container">
		<UL class="tabs">
			<LI><A href="#tab1">å�Ұ�</A></LI>
			<LI><A href="#tab2">���ڼҰ�</A></LI>
			<LI><A href="#tab3">å����</A></LI>
			<LI><A href="#tab4">���ǻ缭��</A></LI>
			<LI><A href="#tab5">��õ��</A></LI>
			<LI><A href="#tab6">����</A></LI>
		</UL>
		<DIV class="tab_container">
			<DIV class="tab_content" id="tab1">
				<H4>å�Ұ�</H4>
				<P>${goods.goods_intro}</P>
				<c:forEach var="image" items="${goods.list_detail_Image }">
					<IMG width="600" height="771"
						src="<%=request.getContextPath()%>/download.do?goods_id=${goods.goods_id}&fileName=${image.fileName}">
				</c:forEach>
			</DIV>
			<DIV class="tab_content" id="tab2">
				<H4>���ڼҰ�</H4>
				<P>
				<DIV class="writer">���� : ${goods.goods_writer}</DIV>
				${goods.goods_writer_intro }
				<P></P>
			</DIV>
			<DIV class="tab_content" id="tab3">
				<H4>å����</H4>
				<P>${goods.goods_contents_order }</P>
			</DIV>
			<DIV class="tab_content" id="tab4">
				<H4>���ǻ缭��</H4>
			</DIV>
			<DIV class="tab_content" id="tab5">
				<H4>��õ��</H4>
			</DIV>
			<DIV class="tab_content" id="tab6">
				<H4>����</H4>
			</DIV>
		</DIV>
	</DIV>
	<DIV class="clear"></DIV>
	<div id="layer" style="visibility: hidden">
		<!-- visibility:hidden ���� �����Ͽ� �ش� div���� ���͵��� �����д�. -->
		<div id="popup">
			<!-- �˾�â �ݱ� ��ư -->
			<a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');"> <img
				src="<%=request.getContextPath()%>/image/close.png" id="close" />
			</a> <br /> <font size="12" id="contents">��ٱ��Ͽ� ��ҽ��ϴ�.</font><br>
<form action='<%=request.getContextPath() %>/cart/cart.do?command=my_cart_list'>				
		<input  name="btn_cancel_member" type="submit" value="��ٱ��� ����">
		<input  type="hidden" name="command" value="my_cart_list"/>
</form>				
			<div></div>
</BODY>
</HTML>
