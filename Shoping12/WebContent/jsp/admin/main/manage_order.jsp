<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<c:choose>
<c:when test='${not empty order_goods_list}'>
<script>
window.onload=function()
{
  test();
}

function test(){
	init();
	
}
function init(){
	
	
	var frm_delivery_list=document.frm_delivery_list;
	var h_delivery_state=frm_delivery_list.h_delivery_state;
	//alert("init");
	var s_delivery_state=frm_delivery_list.s_delivery_state;
	
	
//	alert(h_delivery_state.length);	
	if(h_delivery_state.length==undefined){
	//	alert(h_delivery_state.length);	
		s_delivery_state.value=h_delivery_state.value; //��ȸ�� �ֹ� ������ 1���� ���
	}else{
		for(var i=0; s_delivery_state.length;i++){
			s_delivery_state[i].value=h_delivery_state[i].value;//��ȸ�� �ֹ� ������ �������� ���
		}
	}
}
</script>
</c:when>
</c:choose>
<script>
function search_order_history(search_period){
	var formObj=document.createElement("form");
	var i_command = document.createElement("input");
	var i_search_period = document.createElement("input"); 
    
    i_command.name="command";
    i_search_period.name="period";
    i_command.value="list_simple_order_goods";
    i_search_period.value=search_period;
	
    formObj.appendChild(i_command);
    formObj.appendChild(i_search_period);
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="/Shoping12/admin/admin.do";
    formObj.submit();
}

function fn_modify_order_state(mod_type,order_id,index){
	//alert("index:" +index);
	var frm_delivery_list=document.frm_delivery_list;
	var s_delivery_state=frm_delivery_list.s_delivery_state;
	
	alert(s_delivery_state.length);
	
	if(mod_type=='delivery_state'){
		var num = s_delivery_state[index].selectedIndex;
	//	alert("num:"+num);
		if(num==undefined){
			value=s_delivery_state.value;	//��ȸ�� �ֹ������� 1���� ���
		}else{
			value=s_delivery_state[index].value;  //��ȸ�� �ֹ������� ���� ���� ���
		}
		
	}
	//alert("value:"+value);
	
	$.ajax({
		type : "post",
		async : false, //false�� ��� ��������� ó���Ѵ�.
		url : "http://localhost:8090/Shoping12/admin/admin.do",
		data : {
			command:"modify_delivery_state",
			order_id:order_id,
			mod_type:mod_type,
			value:value
		},
		success : function(data, textStatus) {
			if(data.trim()=='mod_success'){
				alert("�ֹ� ������ �����߽��ϴ�.");
			}else if(data.trim()=='failed'){
				alert("�ٽ� �õ��� �ּ���.");	
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

function fn_change_search(r_search){
	var frm_delivery_list=document.frm_delivery_list;
	t_beginYear=frm_delivery_list.beginYear;
	t_beginMonth=frm_delivery_list.beginMonth;
	t_beginDay=frm_delivery_list.beginDay;
	t_endYear=frm_delivery_list.endYear;
	t_endMonth=frm_delivery_list.endMonth;
	t_endDay=frm_delivery_list.endDay;
	s_search_type=frm_delivery_list.s_search_type;
	t_search_word=frm_delivery_list.t_search_word;
	btn_search=frm_delivery_list.btn_search;
	
	if(r_search.value=='detail_search'){
		//alert(r_search.value);
		t_beginYear.disabled=false;
		t_beginMonth.disabled=false;
		t_beginDay.disabled=false;
		t_endYear.disabled=false;
		t_endMonth.disabled=false;
		t_endDay.disabled=false;
		
		s_search_type.disabled=false;
		t_search_word.disabled=false;
		btn_search.disabled=false;
	}else{
		t_beginYear.disabled=true;
		t_beginMonth.disabled=true;
		t_beginDay.disabled=true;
		t_endYear.disabled=true;
		t_endMonth.disabled=true;
		t_endDay.disabled=true;
		
		s_search_type.disabled=true;
		t_search_word.disabled=true;
		btn_search.disabled=true;
	}
		
}

function fn_detail_search(){
	var frm_delivery_list=document.frm_delivery_list;
	
	beginYear=frm_delivery_list.beginYear.value;
	beginMonth=frm_delivery_list.beginMonth.value;
	beginDay=frm_delivery_list.beginDay.value;
	endYear=frm_delivery_list.endYear.value;
	endMonth=frm_delivery_list.endMonth.value;
	endDay=frm_delivery_list.endDay.value;
	search_type=frm_delivery_list.s_search_type.value;
	search_word=frm_delivery_list.t_search_word.value;

	var formObj=document.createElement("form");
	var i_command = document.createElement("input");
	var i_beginDate = document.createElement("input"); 
	var i_endDate = document.createElement("input");
	var i_search_type = document.createElement("input");
	var i_search_word = document.createElement("input");
    
	//alert("beginYear:"+beginYear);
	//alert("endDay:"+endDay);
	//alert("search_type:"+search_type);
	//alert("search_word:"+search_word);
	
    i_command.name="command";
    i_beginDate.name="beginDate";
    i_endDate.name="endDate";
    i_search_type.name="search_type";
    i_search_word.name="search_word";
    
    i_command.value="list_detail_order_goods";
	i_beginDate.value=beginYear+"-"+beginMonth+"-"+beginDay;
    i_endDate.value=endYear+"-"+endMonth+"-"+endDay;
    i_search_type.value=search_type;
    i_search_word.value=search_word;
	
    formObj.appendChild(i_command);
    formObj.appendChild(i_beginDate);
    formObj.appendChild(i_endDate);
    formObj.appendChild(i_search_type);
    formObj.appendChild(i_search_word);
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="/Shoping12/admin/admin.do";
    formObj.submit();
    //alert("submit");
	
}
</script>
</head>
<body>
	<H3>�ֹ� ��ȸ</H3>
	<form name="frm_delivery_list" action="<%=request.getContextPath()%>/admin/admin.do" method="post">	
		<TABLE cellpadding="10" cellspacing="10"  >
			<TBODY>
				<TR >
					<TD>
						<input type="radio" name="r_search_option" value="simple_search" checked onClick="fn_change_search(this)"/> ������ȸ &nbsp;&nbsp;&nbsp;
						<input type="radio" name="r_search_option" value="detail_search"  onClick="fn_change_search(this)" /> ����ȸ &nbsp;&nbsp;&nbsp;
					</TD>
				</TR>
				<TR >
					<TD>
					  <select name="curYear">
					    <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${curYear==curYear-i }">
					          <option value="${2016-i }" selected>${2016-i  }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${2016-i }">${2016-i }</option>
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
					��ȸ �Ⱓ:
					<select name="beginYear" disabled>
					 <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${curYear==curYear-i }">
					          <option value="${2016-i }" selected>${2016-i  }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${2016-i }">${2016-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>�� 
					<select name="beginMonth" disabled >
						 <c:forEach   var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${curMonth==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10 }">
					              <option value="0${i }">0${i }</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i }">${i }</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>��
					 <select name="beginDay" disabled >
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${curDay==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10 }">
					              <option value="0${i }">0${i }</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i }">${i }</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>��  &nbsp; ~
					
					<select name="endYear" disabled >
					 <c:forEach   var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${curYear==curYear-i }">
					          <option value="${2016-i }" selected>${2016-i  }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${2016-i }">${2016-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>�� 
					<select name="endMonth" disabled >
						 <c:forEach   var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${curMonth==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10 }">
					              <option value="0${i }">0${i }</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i }">${i }</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>��
					 <select name="endDay" disabled >
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${curDay==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10 }">
					              <option value="0${i }">0${i }</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i }">${i }</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>
												 
				  </td>
				</tr>
				<tr>
				  <td>
				    <select name="s_search_type" disabled >
						<option value="all" checked>��ü</option>
						<option value="orderer_name">�ֹ����̸�</option>
						<option value="orderer_id">�ֹ��ھ��̵�</option>
						<option value="orderer_hp_num">�ֹ����޴�����ȣ</option>
						<option value="orderer_goods">�ֹ���ǰ��</option>
					</select>
					<input  type="text"  size="30" name="t_search_word" disabled />  
					<input   type="button"  value="��ȸ" name="btn_search" onClick="fn_detail_search()" disabled  />
				  </td>
				</tr>				
			</TBODY>
		</TABLE>
		<DIV class="clear">
	</DIV>
	
<DIV class="clear"></DIV>
<TABLE class="list_view">
		<TBODY align=center >
			<tr style="background:#33ff00" >
				<td class="fixed" >�ֹ���ȣ</td>
				<td class="fixed">�ֹ�����</td>
				<td>�ֹ�����</td>
				<td>�ֹ�����</td>
				<td>�ֹ����</td>
			</tr>
   <c:choose>
     <c:when test="${empty order_goods_list }">			
			<TR>
		       <TD colspan=5 class="fixed">
				  <STRONG>�ֹ��� ��ǰ�� �����ϴ�.</STRONG>
			   </TD>
		     </TR>
	 </c:when>
	 <c:otherwise>
     <c:forEach var="item" items="${order_goods_list }" varStatus="item_num">
			 <TR>       
				<TD width=10%>
				  <a href="#">
				     <STRONG>${item.order_id }</STRONG>
				  </a>
				</TD>
				<TD width=20%>
				 <STRONG>${item.pay_order_time }</STRONG> 
				</TD>
				<td width=50% align=left bgcolor="#ffcc00">
				  <STRONG>�ֹ���:${item.orderer_name}</STRONG><br>
				  <STRONG>�ֹ��� ��ȭ��ȣ:${item.pay_orderer_hp_num}</STRONG><br>
				  <STRONG>�ֹ���ǰ��:${item.goods_title}</STRONG><br>
				  <STRONG>�ֹ���ǰ����:${item.order_goods_qty}</STRONG><br>
				</td>
				<td width=10%>
				 <%-- STRONG>${item.delivery_state }</STRONG> --%>
				 <select name="s_delivery_state">
				   <option  value="prepare_delivery" selected>����غ���</option>
				   <option  value="delivering">�����</option>
				   <option  value="finished_delivering">��ۿϷ�</option>
				   <option  value="cancel_order">�ֹ����</option>
				   <option  value="returning_goods">��ǰ</option>
				 </select> 
				  <input  type="hidden" name="h_delivery_state" value="${item.delivery_state }" />
				</td>
				<td width=10%>
			     <input  type="button" value="�����ݿ�"  onClick="fn_modify_order_state('delivery_state','${item.order_id}','${item_num.count-1 }')"/>
			    </TD>
			</TR>
	</c:forEach>
	</c:otherwise>
  </c:choose>			   
		</TBODY>
	</TABLE>
  </form>   	
	<DIV class="clear"></DIV>
<c:choose>
 <c:when test="${not empty order_goods_list }">	
   <DIV id="page_wrap">
		 <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${chapter >1 && page==1 }">
		          <a href="<%=request.getContextPath()%>/admin/admin.do?command=manage_order&chapter=${chapter-1}&pageNum=${(chapter-1)*10 +1 }">&nbsp;pre &nbsp;</a>
		         </c:if>
		          <a href="<%=request.getContextPath()%>/admin/admin.do?command=manage_order&chapter=${chapter}&pageNum=${page}">${(chapter-1)*10 +page } </a>
		         <c:if test="${page ==10 }">
		          <a href="<%=request.getContextPath()%>/admin/admin.do?command=manage_order&chapter=${chapter+1}&pageNum=${chapter*10+1}">&nbsp; next</a>
		         </c:if> 
	      </c:forEach> 
	</DIV>	
 </c:when>
</c:choose>
</body>
</html>
