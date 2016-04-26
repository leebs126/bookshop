<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
function search_order_history(search_period){
	var formObj=document.createElement("form");
	var i_command = document.createElement("input");
	var i_search_period = document.createElement("input"); 
    
    i_command.name="command";
    i_search_period.name="period";
    i_command.value="search_goods";
    i_search_period.value=search_period;
	
    formObj.appendChild(i_command);
    formObj.appendChild(i_search_period);
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="/Shoping11/admin/admin.do";
    formObj.submit();
}

</script>
</head>
<body>
	<H3>제품 조회</H3>
	<form action="<%=request.getContextPath()%>/admin/admin.do" method="post">	
		<TABLE cellpadding="10" cellspacing="10"  >
			<TBODY>
				<TR >
					<TD>
						<input type="checkbox" name="simple"  checked/> 등록일로조회 &nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="simple" />상세조회 &nbsp;&nbsp;&nbsp;
					</TD>
				</TR>
				<TR >
					<TD>
					  <select name="curYear">
					    <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${curYear==curYear-i }">
					          <option value="${2015-i }" selected>${2015-i  }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${2015-i }">${2015-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년 <select name="curMonth" >
						 <c:forEach   var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${curMonth==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>월
					
					 <select name="curDay">
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${curDay==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${i }">${i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>일  &nbsp;이전&nbsp;&nbsp;&nbsp;&nbsp; 
					<a href="javascript:search_order_history('today')">
					   <img   src="<%=request.getContextPath()%>/image/btn_search_one_day.jpg">
					</a>
					<a href="javascript:search_order_history('one_week')">
					   <img   src="<%=request.getContextPath()%>/image/btn_search_1_week.jpg">
					</a>
					<a href="javascript:search_order_history('two_week')">
					   <img   src="<%=request.getContextPath()%>/image/btn_search_2_week.jpg">
					</a>
					<a href="javascript:search_order_history('one_month')">
					   <img   src="<%=request.getContextPath()%>/image/btn_search_1_month.jpg">
					</a>
					<a href="javascript:search_order_history('two_month')">
					   <img   src="<%=request.getContextPath()%>/image/btn_search_2_month.jpg">
					</a>
					<a href="javascript:search_order_history('three_month')">
					   <img   src="<%=request.getContextPath()%>/image/btn_search_3_month.jpg">
					</a>
					<a href="javascript:search_order_history('four_month')">
					   <img   src="<%=request.getContextPath()%>/image/btn_search_4_month.jpg">
					</a>
					&nbsp;까지 조회
					</TD>
				</TR>
				<tr>
				  <td>
				    <select name="search_condition" disabled >
						<option value="전체" checked>전체</option>
						<option value="제품번호">제품번호</option>
						<option value="제품이름">제품이름</option>
						<option value="제조사">제조사</option>
					</select>
					<input  type="text"  size="30"  disabled/>  
					<input   type="button"  value="조회" disabled/>
				  </td>
				</tr>
				<tr>
				  <td>
					조회한 기간:<input  type="text"  size="4" value="${beginYear}" />년
							<input  type="text"  size="4" value="${beginMonth}"/>월	
							 <input  type="text"  size="4" value="${beginDay}"/>일	
							 &nbsp; ~
							<input  type="text"  size="4" value="${endYear }" />년 
							<input  type="text"  size="4" value="${endMonth }"/>월	
							 <input  type="text"  size="4" value="${endDay }"/>일							 
				  </td>
				</tr>
			</TBODY>
		</TABLE>
		<DIV class="clear">
	</DIV>
</form>	
<DIV class="clear"></DIV>
<TABLE class="list_view">
		<TBODY align=center >
			<tr style="background:#33ff00" >
				<td width=10>제품번호</td>
				<td>제품이름</td>
				<td>저자</td>
				<td>출판사</td>
				<td>제품가격</td>
				<td>입고일자</td>
				<td>출판일</td>
			</tr>
   <c:choose>
     <c:when test="${empty new_goods_list }">			
			<TR>
		       <TD colspan=8 class="fixed">
				  <STRONG>조회된 상품이 없습니다.</STRONG>
			   </TD>
		     </TR>
	 </c:when>
	 <c:otherwise>
     <c:forEach var="item" items="${new_goods_list }">
			 <TR>       
				<TD>
				  <STRONG>${item.goods_id }</STRONG>
				</TD>
				<TD >
				 <a href="<%=request.getContextPath()%>/admin/admin.do?command=modify_goods_page&goods_id=${item.goods_id}">
				    <STRONG>${item.goods_title } </STRONG>
				 </a> 
				</TD>
				<TD>
				<STRONG>${item.goods_writer }</STRONG> 
				</TD>
				<TD >
				   <STRONG>${item.goods_publisher }</STRONG> 
				</TD>
				<td>
				  <STRONG>${item.goods_sales_price }</STRONG>
				</td>
				<td>
				 <STRONG>${item.creDate }</STRONG> 
				</td>
				<td>
					<STRONG>${item.goods_published_date }</STRONG>
				</TD>
				
			</TR>
	</c:forEach>
	</c:otherwise>
  </c:choose>
  
           <tr>
             <td colspan=8 class="fixed">
                 <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${chapter >1 && page==1 }">
		          <a href="<%=request.getContextPath()%>/admin/admin.do?command=manage_goods&chapter=${chapter-1}&pageNum=${(chapter-1)*10 +1 }">&nbsp;pre &nbsp;</a>
		         </c:if>
		          <a href="<%=request.getContextPath()%>/admin/admin.do?command=manage_goods&chapter=${chapter}&pageNum=${page}">${(chapter-1)*10 +page } </a>
		         <c:if test="${page ==10 }">
		          <a href="<%=request.getContextPath()%>/admin/admin.do?command=manage_goods&chapter=${chapter+1}&pageNum=${chapter*10+1}">&nbsp; next</a>
		         </c:if> 
	      		</c:forEach>
     
<%--              <c:choose>
        <c:when test="${totWrite >100 }">  <!-- 글 개수가 100 초과인경우 -->
	      <c:forEach   var="page" begin="1" end="10" step="1" >
	         <c:if test="${chapter >1 && page==1 }">
	          <a href="<%=request.getContextPath()%>/board.do?command=boardList&chapter=${chapter-1}&pageNum=${(chapter-1)*10 +1 }">&nbsp; -- </a>
	         </c:if>
	          <a href="<%=request.getContextPath()%>/board.do?command=boardList&chapter=${chapter}&pageNum=${page}">${(chapter-1)*10 +page } </a>
	         <c:if test="${page ==10 }">
	          <a href="<%=request.getContextPath()%>/board.do?command=boardList&chapter=${chapter+1}&pageNum=${chapter*10+1}">&nbsp; >></a>
	         </c:if>
	      </c:forEach>
        </c:when>
        <c:when test="${totWrite ==100 }" >  <!--등록된 글 개수가 100개인경우  -->
	      <c:forEach   var="x" begin="1" end="10" step="1" >
	        <a href="#">${x } </a>
	      </c:forEach>
        </c:when>
        
        <c:when test="${totWrite< 100 }" >   <!--등록된 글 개수가 100개 미만인 경우  -->
	      <c:forEach   var="page" begin="1" end="${totWrite/10 +1}" step="1" >
	        <a href="<%=request.getContextPath()%>/board.do?command=boardList&chapter=${chapter}&pageNum=${page}">${page } </a>
	      </c:forEach>
        </c:when>
        <c:otherwise>
          </c:otherwise>
 --%>             </td>
           </tr>
  				<%-- <td>
					<STRONG><a href="#"> 이전</a>  </STRONG>
					<c:forEach var=1 begin=1 end=10>
							
					</c:forEach>
				</TD>	 --%>		   
		</TBODY>
		
	</TABLE>
	<DIV class="clear"></DIV>
	<br><br><br>
	
<H3>제품 등록</H3>
<DIV id="search">
	<form action="<%=request.getContextPath() %>/admin/admin.do">
		<input type="hidden" name="command" value="add_goods_page" />
		<INPUT name="add_goods"  type="submit" value="제품 등록하기">
	</form>
</DIV>
</body>
</html>