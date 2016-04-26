<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<DIV id="ad_main_banner">
					<UL class="bjqs">
						<LI><IMG width="775" height="145"
							src="../image/main_banner1.jpg"></LI>
						<LI><IMG width="775" height="145"
							src="../image/main_banner2.jpg"></LI>
						<LI><IMG width="775" height="145"
							src="../image/main_banner3.jpg"></LI>
					</UL>
				</DIV>
				<DIV id="bestseller">
					<H3>베스트셀러</H3>
					<c:forEach  var="item" items="${goods_list }" >
					<DIV class="book">
						<A href="./goods_detail2.jsp"><IMG class="link" src="../image/1px.gif">
						</A> 
						<IMG width="121" height="154"  src="<%=request.getContextPath()%>/download.do?fileName=${item.fileName}">

						<DIV class="sort">[${item.goods_sort }]</DIV>
						<DIV class="title">${item.goods_title }</DIV>
						<DIV class="writer">${item.goods_writer } | ${item.goods_publisher }</DIV>
						<DIV class="price">${item.goods_price}원</DIV>
					</DIV>
					
					</c:forEach>
				</DIV>
				<DIV class="clear"></DIV>
				<DIV id="dslr_lens">
					<H3>dslr/ lens</H3>
					<DIV class="goods">
						<DIV class="dslr_img">
							<IMG width="108" height="106" src="../image/lens1.jpg">
						</DIV>
						<DIV class="title">AF-S NIKKOR 50mm f/1.8G</DIV>
						<DIV class="price">298,000원</DIV>
					</DIV>
					<DIV class="goods">
						<DIV class="dslr_img">
							<IMG width="133" height="83" src="../image/lens2.jpg">
						</DIV>
						<DIV class="title">AF-S NIKKOR 70-200mm</DIV>
						<DIV class="price">3,283,000원</DIV>
					</DIV>
					<DIV class="goods">
						<DIV class="dslr_img">
							<IMG width="135" height="113" src="../image/d700.jpg">
						</DIV>
						<DIV class="title">Nikon D700</DIV>
						<DIV class="price">2,880,000원</DIV>
					</DIV>
					<DIV class="goods goods_right">
						<DIV class="dslr_img">
							<IMG width="135" height="113" src="../image/5dmk2.jpg">
						</DIV>
						<DIV class="title">Canon EOS 5D Mark II</DIV>
						<DIV class="price">3,350,000원</DIV>
					</DIV>
				</DIV>
				<DIV class="clear"></DIV>
				<DIV id="ad_sub_banner">
					<IMG width="770" height="117" src="../image/sub_banner1.jpg">
				</DIV>
				<DIV id="laptop">
					<H3>노트북 신상품</H3>
					<DIV class="goods">
						<DIV class="laptop_img">
							<IMG width="118" height="101" src="../image/img1.jpg">
						</DIV>
						<DIV class="title">[ASUS]K53SV-SX050V</DIV>
						<DIV class="price">958,640원</DIV>
					</DIV>
					<DIV class="goods">
						<DIV class="laptop_img">
							<IMG width="129" height="107" src="../image/img2.jpg">
						</DIV>
						<DIV class="title">삼성 센스 XQ700T1A-A51</DIV>
						<DIV class="price">1,649,000원</DIV>
					</DIV>
					<DIV class="goods">
						<DIV class="laptop_img">
							<IMG width="113" height="99" src="../image/img3.jpg">
						</DIV>
						<DIV class="title">LG 엑스노트 A515-KE5RK</DIV>
						<DIV class="price">1,026,000원</DIV>
					</DIV>
					<DIV class="goods goods_right">
						<DIV class="laptop_img">
							<IMG width="156" height="105" src="../image/img4.jpg">
						</DIV>
						<DIV class="title">[HP컴팩]G6-1207TX</DIV>
						<DIV class="price">818,000원</DIV>
					</DIV>
					<DIV class="goods">
						<DIV class="laptop_img">
							<IMG width="155" height="97" src="../image/img5.jpg">
						</DIV>
						<DIV class="title">[애플] MacBook Pro 15인치형</DIV>
						<DIV class="price">2,198,400원</DIV>
					</DIV>
					<DIV class="goods">
						<DIV class="laptop_img">
							<IMG width="134" height="82" src="../image/img6.jpg">
						</DIV>
						<DIV class="title">[애플] MacBook Pro 13인치형</DIV>
						<DIV class="price">1,489,000원</DIV>
					</DIV>
					<DIV class="goods">
						<DIV class="laptop_img">
							<IMG width="151" height="91" src="../image/img7.jpg">
						</DIV>
						<DIV class="title">[애플] MacBook Air 13인치</DIV>
						<DIV class="price">1,565,000원</DIV>
					</DIV>
					<DIV class="goods goods_right">
						<DIV class="laptop_img">
							<IMG width="157" height="98" src="../image/img8.jpg">
						</DIV>
						<DIV class="title">[애플] MacBook Air 11인치</DIV>
						<DIV class="price">1,219,000원</DIV>
					</DIV>
				</DIV>
				<DIV class="clear"></DIV>