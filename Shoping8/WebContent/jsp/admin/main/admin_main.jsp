<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<DIV>
	<H3>��ǰ �� �˻�</H3>
<!-- 	<DIV>
	 å ����:  <input  type="text" name="book_title" size="20"  /><br><br>
	 å ����:   <input  type="text" name="book_price" size="20"  /><br><br>
	 å ���ǻ�:   <input  type="text" name="book_publisher" size="20"  /><br><br><br>
	 
	 
	 <input type="button" value="��ǰ����ϱ�" name="btn_reg" />
	 
	
	</DIV>
	 -->
	<DIV id="search">
		<FORM action="<%=request.getContextPath() %>/admin/admin.do">
		<table>
		<tr>
		  <td>��ǰ��ȣ</Td>
		  <td><INPUT name="goods_id" class="main_input" type="text"></td>
		</tr>
		<tr>
		  <td>��ǰ�̸�</Td>
		  <td><INPUT name="goods_title" class="main_input" type="text"></td>
		</tr>
		<tr>
		  <td>���ǻ�</Td>
		  <td><INPUT name="goods_publisher" class="main_input" type="text"></td>
		</tr>
		<tr>
		  <td>������</Td>
		  <td><INPUT name="goods_published_date" class="main_input" type="text"></td>
		</tr>
		</table>	
			<input type="hidden" name="command" value="search_goods" />
			<INPUT name="search"  type="submit" value="�󼼰˻�">
		</FORM>
		
	</DIV>
	<br><br><br>
	<H3>�� ��ǰ ���</H3>
	<DIV id="search">
		<form action="<%=request.getContextPath() %>/admin/admin.do">
			<input type="hidden" name="command" value="add_goods_page" />
			<INPUT name="add_goods"  type="submit" value="��ǰ ����ϱ�">
		</form>
	</DIV>
</DIV>
<!-- DIV class="clear"></DIV>
<DIV id="dslr_lens">
	<H3>dslr/ lens</H3>
	
</DIV>

<DIV class="clear"></DIV>

<DIV id="laptop">
	<H3>��Ʈ�� �Ż�ǰ</H3>
	
</DIV>

<DIV class="clear"></DIV> -->