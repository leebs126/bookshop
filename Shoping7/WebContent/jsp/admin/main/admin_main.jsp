<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<DIV>
	<H3>제품 상세 검색</H3>
<!-- 	<DIV>
	 책 제목:  <input  type="text" name="book_title" size="20"  /><br><br>
	 책 가격:   <input  type="text" name="book_price" size="20"  /><br><br>
	 책 출판사:   <input  type="text" name="book_publisher" size="20"  /><br><br><br>
	 
	 
	 <input type="button" value="제품등록하기" name="btn_reg" />
	 
	
	</DIV>
	 -->
	<DIV id="search">
		<FORM action="<%=request.getContextPath() %>/admin/admin.do">
		<table>
		<tr>
		  <td>제품번호</Td>
		  <td><INPUT name="goods_id" class="main_input" type="text"></td>
		</tr>
		<tr>
		  <td>제품이름</Td>
		  <td><INPUT name="goods_title" class="main_input" type="text"></td>
		</tr>
		<tr>
		  <td>출판사</Td>
		  <td><INPUT name="goods_publisher" class="main_input" type="text"></td>
		</tr>
		<tr>
		  <td>출판일</Td>
		  <td><INPUT name="goods_published_date" class="main_input" type="text"></td>
		</tr>
		</table>	
			<input type="hidden" name="command" value="search_goods" />
			<INPUT name="search"  type="submit" value="상세검색">
		</FORM>
		
	</DIV>
	<br><br><br>
	<H3>새 제품 등록</H3>
	<DIV id="search">
		<form action="<%=request.getContextPath() %>/admin/admin.do">
			<input type="hidden" name="command" value="add_goods_page" />
			<INPUT name="add_goods"  type="submit" value="제품 등록하기">
		</form>
	</DIV>
</DIV>
<!-- DIV class="clear"></DIV>
<DIV id="dslr_lens">
	<H3>dslr/ lens</H3>
	
</DIV>

<DIV class="clear"></DIV>

<DIV id="laptop">
	<H3>노트북 신상품</H3>
	
</DIV>

<DIV class="clear"></DIV> -->