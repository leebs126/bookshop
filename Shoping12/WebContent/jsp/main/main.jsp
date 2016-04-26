<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	isELIgnored="false"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<DIV id="ad_main_banner">
	<UL class="bjqs">
		<LI><IMG width="775" height="145" src="<%=request.getContextPath()%>/image/main_banner1.jpg"></LI>
		<LI><IMG width="775" height="145" src="<%=request.getContextPath()%>/image/main_banner2.jpg"></LI>
		<LI><IMG width="775" height="145" src="<%=request.getContextPath()%>/image/main_banner3.jpg"></LI>
	</UL>
</DIV>
<c:set var="cnt" value="0"  />
<DIV class="main_book">
	<H3>베스트셀러</H3>   
	<c:forEach var="item" items="${bestseller_list }">
		<DIV class="book">
			<A href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">
			<IMG class="link"  src="../image/1px.gif"> 
			</A> 
				<IMG width="121" height="154" 
				     src="<%=request.getContextPath()%>/download.do?goods_id=${item.goods_id}&fileName=${item.fileName}">

			<DIV class="title">${item.goods_title }</DIV>
			<DIV class="price">${item.goods_price}원</DIV>
		</DIV>
	</c:forEach>
         <DIV class="book">
           <font size=20> <a href="#">more</a></font>
         </div>
</DIV>
<DIV class="clear"></DIV>
<DIV id="ad_sub_banner">
	<IMG width="770" height="117" src="<%=request.getContextPath()%>/image/sub_banner2.jpg">
</DIV>
<DIV class="main_book" >
	<H3>새로 출판된 책</H3>
	<c:forEach var="item" items="${newbook_list }" >
		<DIV class="book">
		  <A href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">
	       <IMG class="link"  src="../image/1px.gif"> 
	      </A>
		 <IMG width="121" height="154" 
				src="<%=request.getContextPath()%>/download.do?goods_id=${item.goods_id}&fileName=${item.fileName}">
			<!-- </DIV> -->
		<DIV class="title">${item.goods_title }</DIV>
		<DIV class="price">${item.goods_price}원</DIV>
	</DIV>
	</c:forEach>
	 <DIV class="book">
           <font size=20> <a href="#">more</a></font>
     </div>
</DIV>

<DIV class="clear"></DIV>
<DIV id="ad_sub_banner">
	<IMG width="770" height="117" src="<%=request.getContextPath()%>/image/sub_banner1.jpg">
</DIV>

<DIV  class="main_book">
	<H3>스테디셀러</H3>
	<c:forEach var="item" items="${steadyseller_list }" >
		<DIV class="book">
		  <A href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">
	       <IMG class="link"  src="../image/1px.gif"> 
	      </A>
		 <IMG width="121" height="154" 
				src="<%=request.getContextPath()%>/download.do?goods_id=${item.goods_id}&fileName=${item.fileName}">
			<!-- </DIV> -->
		<DIV class="title">${item.goods_title }</DIV>
		<DIV class="price">${item.goods_price}원</DIV>
	</DIV>
	</c:forEach>
</DIV>	
   <DIV class="book">
           <font size=20> <a href="#">more</a></font>
     </div>
   <DIV class="clear"></DIV>