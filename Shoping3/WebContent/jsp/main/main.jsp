<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<DIV id="ad_main_banner">
	<UL class="bjqs">
		<LI><IMG width="775" height="145" src="../image/main_banner1.jpg"></LI>
		<LI><IMG width="775" height="145" src="../image/main_banner2.jpg"></LI>
		<LI><IMG width="775" height="145" src="../image/main_banner3.jpg"></LI>
	</UL>
</DIV>
<c:set var="cnt" value="0"  />
<DIV id="bestseller">
	<H3>베스트셀러</H3>
	<c:forEach var="item" items="${goods_list }">
		<c:if test="${item.goods_type eq 'bestseller'}">
			<DIV class="book">
				<A href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }"><IMG class="link"
					src="../image/1px.gif"> </A> 
					<IMG width="121" height="154" 
					     src="<%=request.getContextPath()%>/download.do?fileName=${item.goods_fileName}">

				<DIV class="sort">[${item.goods_sort }]</DIV>
				<DIV class="title">${item.goods_title }</DIV>
				<DIV class="writer">${item.goods_writer }|
					${item.goods_publisher }</DIV>
				<DIV class="price">${item.goods_price}원</DIV>
			</DIV>
		</c:if>
	</c:forEach>

</DIV>
<DIV class="clear"></DIV>
<DIV id="dslr_lens">
	<H3>dslr/ lens</H3>
	<c:forEach var="item" items="${goods_list }" >
		<c:if test="${item.goods_type eq 'dslr_lens'}">
		   <c:set var="cnt" value="${cnt+1}"  />
		   <c:choose>
		     <c:when  test="${cnt%4==0}" >
		    	 <DIV class="goods goods_right">
		     </c:when> 
			 <c:otherwise>
			 <DIV class="goods">
			 </c:otherwise>
			</c:choose>
				<DIV class="dslr_img">
					<IMG width="100" height="100"
						src="<%=request.getContextPath()%>/download.do?fileName=${item.goods_fileName}">
 				</DIV>
				<DIV class="title">${item.goods_title }</DIV>
				<DIV class="price">${item.goods_price}원</DIV>
			</DIV>
		</c:if>
	</c:forEach>
</DIV>

<DIV class="clear"></DIV>
<DIV id="ad_sub_banner">
	<IMG width="770" height="117" src="../image/sub_banner1.jpg">
</DIV>
<DIV id="laptop">
	<H3>노트북 신상품</H3>
	<c:set var="cnt" value="0"  />
	<c:forEach var="item" items="${goods_list }">
		<c:if test="${item.goods_type eq 'laptop'}">
			<c:set var="cnt" value="${cnt+1 }"  />
		   <c:choose>
		     <c:when  test="${cnt%4==0}" >
		    	 <DIV class="goods goods_right">
		     </c:when> 
			 <c:otherwise>
			 <DIV class="goods">
			 </c:otherwise>
			</c:choose>
				<DIV class="laptop_img">
					<IMG width="100" height="100"
						src="<%=request.getContextPath()%>/download.do?fileName=${item.goods_fileName}">
				</DIV>
				<DIV class="title">${item.goods_title }</DIV>
				<DIV class="price">${item.goods_price}원</DIV>
			</DIV>
		</c:if>
	</c:forEach>
</DIV>

<DIV class="clear"></DIV>