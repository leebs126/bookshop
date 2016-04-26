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
    i_search_period.name="search_period";
    i_command.value="find_order_delivery_hist";
    i_search_period.value=search_period;
	
    formObj.appendChild(i_command);
    formObj.appendChild(i_search_period);
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="/Shoping11/mine/mine.do";
    formObj.submit();
}

</script>
</head>
<body>
	<H3>�ֹ� ��ȸ</H3>
	<form action="<%=request.getContextPath()%>/member/member.do" method="post">	
		<TABLE cellpadding="10" cellspacing="10"  >
			<TBODY>
				<TR >
					<TD>
						<input type="radio" name="simple"  checked/> ������ȸ &nbsp;&nbsp;&nbsp;
						<input type="radio" name="simple" /> �ϰ�  &nbsp;&nbsp;&nbsp;
						<input type="radio" name="simple" /> ����
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
					</select>�� <select name="curMonth" >
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
					</select>��
					
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
					</select>��  &nbsp;����&nbsp;&nbsp;&nbsp;&nbsp; 
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
					&nbsp;���� ��ȸ
					</TD>
				</TR>
				<tr>
				  <td>
				    <select name="search_condition">
						<option value="��ü" checked>��ü</option>
						<option value="�ֹ����̸�">�ֹ����̸�</option>
						<option value="�ֹ��ھ��̵�">�ֹ��ھ��̵�</option>
						<option value="��ǰ��">��ǰ��</option>
					</select>
					<input  type="text"  size="30" />  
					<input   type="button"  value="��ȸ"/>
				  </td>
				</tr>
				<tr>
				  <td>
					��ȸ�� �Ⱓ:<input  type="text"  size="4" value="${beginYear}" />��
							<input  type="text"  size="4" value="${beginMonth}"/>��	
							 <input  type="text"  size="4" value="${beginDay}"/>��	
							 &nbsp; ~
							<input  type="text"  size="4" value="${endYear }" />�� 
							<input  type="text"  size="4" value="${endMonth }"/>��	
							 <input  type="text"  size="4" value="${endDay }"/>��							 
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
				<td class="fixed" >�ֹ���ȣ</td>
				<td class="fixed">�ֹ�����</td>
				<td>�ֹ�����</td>
				<td>�ֹ��ݾ�/����</td>
				<td>�ֹ�����</td>
				<td>�ֹ���</td>
				<td>������</td>
				<td>�ֹ����</td>
			</tr>
   <c:choose>
     <c:when test="${empty my_order_hist_list }">			
			<TR>
		       <TD colspan=8 class="fixed">
				  <STRONG>�ֹ��� ��ǰ�� �����ϴ�.</STRONG>
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
				 <STRONG>${item.goods_title }</STRONG> 
				</TD>
				<TD>
				<H2>
					<A href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">${item.goods_title }</A>
				</H2>
				</TD>
				<TD >
				   <STRONG>${item.goods_sales_price*item.order_goods_qty }��/${item.order_goods_qty }</STRONG>
				</TD>
				<td>
				  <STRONG>${item.delivery_state }</STRONG>
				</td>
				<td>
				 <STRONG>${item.orderer_name }</STRONG> 
				</td>
				<td>
					<STRONG>${item.receiver_name }</STRONG>
				</TD>
				<td>
			     <input  type="button" value="�ֹ����" />
			    </TD>
			</TR>
	</c:forEach>
	</c:otherwise>
  </c:choose>			   
		</TBODY>
	</TABLE>
     	
	<DIV class="clear"></DIV>
</body>
</html>