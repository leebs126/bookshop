<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

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
	<DIV id="outer_wrap">
		<DIV id="wrap">
			<HEADER>
				<%@ include file="../common/a_header.jsp"%>
			</HEADER>
			<DIV class="clear"></DIV>
			<ASIDE>
				<%@ include file="../common/a_side.jsp"%>
			</ASIDE>
			<ARTICLE>
			<form action="<%=request.getContextPath() %>/admin/admin.do" method="post">
					<h1>새제품 등록창</h1>
					<br>
					<table   cellspacing="0" cellpadding="0">
						<tr >
							<td width=200 >제품분류</td>
							<td width=500><select name="goods_sort">
									<option value="컴퓨터와 인터넷" selected>컴퓨터와 인터넷
									<option value="디지털 기기">디지털 기기
								</select>
							</td>
						</tr>
						<tr >
							<td >제품이름</td>
							<td><input name="goods_title" type="text" size="40" /></td>
						</tr>
						
						<tr>
							<td >저자</td>
							<td><input name="goods_writer" type="text" size="40" /></td>
						</tr>
						<tr>
							<td >출판사</td>
							<td><input name="goods_publisher" type="text" size="40" /></td>
						</tr>
						<tr>
							<td >제품정가</td>
							<td><input name="goods_price" type="text" size="40" /></td>
						</tr>
						
						<tr>
							<td >제품판매가격</td>
							<td><input name="goods_sales_price" type="text" size="40" /></td>
						</tr>
						
						
						<tr>
							<td >제품 구매 포인트</td>
							<td><input name="goods_point" type="text" size="40" /></td>
						</tr>
						
						<tr>
							<td >제품출판일</td>
							<td><input  name="goods_published_date"  type="text" size="40" /></td>
						</tr>
						
						<tr>
							<td >제품 총 페이지수</td>
							<td><input name="goods_page_total" type="text" size="40" /></td>
						</tr>
						
						<tr>
							<td >ISBN</td>
							<td><input name="goods_isbn" type="text" size="40" /></td>
						</tr>
						<tr>
							<td >제품 도착 예정일</td>
							<td><input name="goods_delivery_date" type="text" size="40" /></td>
						</tr>
						
						<tr>
							<td >제품종류</td>
							<td><input name="goods_type" type="text" size="40" /></td>
						</tr>
						<tr>
						 <td>
						   <br>
						 </td>
						</tr>
						
						<tr>
							<td >제품목차</td>
							<td><textarea  rows="100" cols="80" name="goods_contents_order"></textarea></td>
						</tr>
						<tr>
						 <td>
						   <br>
						 </td>
						</tr>
						<tr>
							<td >제품 저자 소개</td>
							<td><textarea  rows="100" cols="80" name="goods_writer_intro"></textarea></td>
						</tr>
						<tr>
						 <td>
						   <br>
						 </td>
						</tr>
						<tr>
							<td>제품소개</td>
							<td><textarea  rows="100" cols="80" name="goods_intro"></textarea></td>
						</tr>
						<tr>
						 <td>
						   <br>
						 </td>
						</tr>
						<tr>
							<td>출판사 제품 평가</td>
							<td><textarea  rows="100" cols="80" name="publisher_comment"></textarea></td>
						</tr>
						<tr>
						 <td>
						   <br>
						 </td>
						</tr>
						<tr>
							<td>추천사</td>
							<td><textarea  rows="100" cols="80" name="recommendation"></textarea></td>
						</tr>
						<tr>
						 <td>
						   <br>
						 </td>
						</tr>
						<tr  colspan=2>
						  <td align=center>
							  <input type="hidden" name="command" value="add_goods" />
							  <INPUT name="add_goods"  type="submit" value="제품 등록하기"> 
						  </td>
						</tr> 
					</table>
					</form>
			</ARTICLE>
			<DIV class="clear"></DIV>

			<%@ include file="../common/a_footer.jsp"%>