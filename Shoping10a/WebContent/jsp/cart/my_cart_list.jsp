<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:set  var="totalPrice" value="0" />  <!-- 총 주문 가격 -->
<c:set  var="totalNum" value="0" />  <!--주문 개수 -->
<c:set  var="totalDelivery" value="0" /> <!-- 총 배송비 --> 
<c:set  var="totalSalesPrice" value="0" /> <!-- 총 할인금액 -->
<head>
<script>
function calcBookPrice(bookPrice,obj){
	
	var totalPrice,final_total_price,totalNum;
	
	var goods_qty=document.getElementById("select_goods_qty");
	//alert("총 상품금액"+goods_qty.value);
	var p_totalNum=document.getElementById("p_totalNum");
	var p_totalPrice=document.getElementById("p_totalPrice");
	var p_final_totalPrice=document.getElementById("p_final_totalPrice");
	var h_totalNum=document.getElementById("h_totalNum");
	var h_totalPrice=document.getElementById("h_totalPrice");
	var h_totalDelivery=document.getElementById("h_totalDelivery");
	var h_final_total_price=document.getElementById("h_final_totalPrice");
	if(obj.checked==true){
	//	alert("체크 했음")
		
		totalNum=Number(h_totalNum.value)+Number(goods_qty.value);
		//alert("totalNum:"+totalNum);
		totalPrice=Number(h_totalPrice.value)+Number(goods_qty.value*bookPrice);
		//alert("totalPrice:"+totalPrice);
		final_total_price=totalPrice+Number(h_totalDelivery.value);
		//alert("final_total_price:"+final_total_price);

	}else{
	//	alert("h_totalNum.value:"+h_totalNum.value);
		totalNum=Number(h_totalNum.value)-Number(goods_qty.value);
	//	alert("totalNum:"+ totalNum);
		totalPrice=Number(h_totalPrice.value)-Number(goods_qty.value)*bookPrice;
	//	alert("totalPrice="+totalPrice);
		final_total_price=totalPrice-Number(h_totalDelivery.value);
	//	alert("final_total_price:"+final_total_price);
	}
	
	h_totalNum.value=totalNum;
	
	h_totalPrice.value=totalPrice;
	h_final_total_price.value=final_total_price;
	
	p_totalNum.innerHTML=totalNum;
	p_totalPrice.innerHTML=totalPrice;
	p_final_totalPrice.innerHTML=final_total_price;
}

function modify_cart_qty(goods_id,bookPrice){
	alert("goods_id:"+goods_id);
	
	var e_goods_qty=document.getElementById("goods_qty");
	var goods_qty=Number(e_goods_qty.value);
	alert("goods_qty:"+goods_qty);
	
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "http://localhost:8090/Shoping7/cart/cart.do",
		data : {
			command:"modify_cart_qty",
			goods_id:goods_id,
			goods_qty:goods_qty
		},
		success : function(data, textStatus) {
			//alert(data);
		//	$('#message').append(data);
			if(data.trim()=='modify_success'){
				alert("수량을 변경했습니다!!");	
			}else{
				alert("다시 시도해 주세요!!");	
			}
			
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
			
		}
	}); //end ajax	
}

function order_each_goods(goods_id,goods_title,goods_sales_price,goods_fileName){
	var total_price,final_total_price,_goods_qty;
	
	var select_goods_qty=document.getElementById("select_goods_qty");
	//var h_total_price=document.getElementById("h_totalPrice");
//	var h_final_total_price=document.getElementById("h_final_totalPrice");
	
	_select_goods_qty=select_goods_qty.value;
///	total_price=h_total_price.value;
//	final_total_price=h_final_total_price.value;
	
//	alert("_goods_qty"+_goods_qty);	
//	alert("goods_sales_price:" + goods_sales_price)
//	alert("total_price: "+total_price);
//	alert("final_total_price: "+final_total_price);	
	
	var formObj=document.createElement("form");
	var i_command = document.createElement("input");
	var i_goods_id = document.createElement("input"); 
    var i_goods_title = document.createElement("input");
    var i_goods_sales_price=document.createElement("input");
    var i_goods_fileName=document.createElement("input");
    
    var i_select_goods_qty=document.createElement("input");
  //  var i_total_price=document.createElement("input");
  //  var i_final_total_price=document.createElement("input");
   
    
    i_command.name="command";
    i_goods_id.name="goods_id";
    i_goods_title.name="goods_title";
    i_goods_sales_price.name="goods_sales_price";
    i_goods_fileName.name="goods_fileName";
    i_select_goods_qty.name="select_goods_qty";
  //  i_total_price.name="total_price";
  //  i_final_total_price.name="final_total_price";
    
    
    i_command.value="order_goods";
    i_goods_id.value=goods_id;
    i_select_goods_qty.value=_select_goods_qty;
    i_goods_title.value=goods_title;
    i_goods_sales_price.value=goods_sales_price;
    i_goods_fileName.value=goods_fileName;
    
  
    //i_select_goods_qty.value=_select_goods_qty;
  //  i_total_price.value=total_price;
 //   i_final_total_price.value=final_total_price;
   
    
    formObj.appendChild(i_command);
    formObj.appendChild(i_goods_id);
    formObj.appendChild(i_goods_title);
    formObj.appendChild(i_goods_sales_price);
    formObj.appendChild(i_goods_fileName);
    formObj.appendChild(i_select_goods_qty);
 //   formObj.appendChild(i_total_price);
 //   formObj.appendChild(i_final_total_price);

    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="/Shoping9/order/order.do";
    formObj.submit();
//    alert("aaa");
}

function fn_order_all_cart_goods(){
	//alert("모두 주문하기");
	var order_goods_qty;
	var order_goods_id;
	var objForm=document.frm_order_all_cart;
	var select_goods_qty=objForm.select_goods_qty;
	var h_order_each_goods_qty=objForm.h_order_each_goods_qty;
	var select_goods=objForm.select_goods;
	var length=select_goods.length;
	var i_command=document.createElement("input");
	i_command.name="command";
	i_command.value="order_all_cart_goods";
	
	
	//alert(length);
	if(length>1){
		for(var i=0; i<length;i++){
			if(select_goods[i].checked==true){
				order_goods_id=select_goods[i].value;
				order_goods_qty=select_goods_qty[i].value;
				select_goods_qty[i].value="";
				select_goods_qty[i].value=order_goods_id+":"+order_goods_qty;
				//alert(select_goods_qty[i].value);
			}
		}	
	}else{
		order_goods_id=select_goods.value;
		order_goods_qty=select_goods_qty.value;
		select_goods_qty.value=order_goods_id+":"+order_goods_qty;
		//alert(select_goods_qty.value);
	}
		
	
 	 

 	objForm.appendChild(i_command);
 	objForm.method="post";
	objForm.action="/Shoping9/order/order.do";
	objForm.submit();
}

</script>
</head>
<BODY>
	<TABLE class="list_view">
		<TBODY align=center >
			<tr style="background:#33ff00" >
				<td class="fixed" >구분</td>
				<td colspan=2 class="fixed">상품명</td>
				<td>정가</td>
				<td>판매가</td>
				<td>수량</td>
				<td>합계</td>
				<td>주문</td>
			</tr>
			
			 <c:choose>
				    <c:when test="${ empty my_cart_list }">
				    <TR>
				       <TD colspan=8 class="fixed">
				         <STRONG>장바구니에 상품이 없습니다.</STRONG>
				       </TD>
				     </TR>
				    </c:when>
			        <c:otherwise>
			 <TR>       
<form name="frm_order_all_cart">
				      <c:forEach var="item" items="${my_cart_list }">
					<TD><INPUT type="checkbox" name="select_goods"  checked  value="${item.goods_id }"  onClick="calcBookPrice(${item.goods_sales_price },this)"></TD>
					<TD class="goods_image">
					<a href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">
							<IMG width="75" alt=""
							src="<%=request.getContextPath() %>/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"">
					</a>
					</TD>
					<TD>
						<H2>
							<A
								href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">${item.goods_title }</A>
						</H2>
					</TD>
					<TD class="price"><SPAN>${item.goods_price }원</SPAN></TD>
					<td><STRONG>${item.goods_sales_price }원</STRONG>(10% 할인)</td>
					<td>
					   <%-- <input type="text" id="goods_qty" name="goods_qty" size=3 value='${item.goods_qty }'><br> --%>
					   <input type="text" id="select_goods_qty" name="select_goods_qty" size=3 value='1'><br>
						<A href="javascript:modify_cart_qty(${item.goods_id },${item.goods_sales_price });" >
						    <IMG width=25 alt=""
							    src="<%=request.getContextPath()%>/image/btn_modify_qty.jpg">
						</A>
					</td>
					<td><STRONG>${item.goods_sales_price }원</STRONG> </td>
					<td>
					      <a href="javascript:order_each_goods('${item.goods_id }','${item.goods_title }','${item.goods_sales_price}','${item.goods_fileName}');">
					       	<IMG width="75" alt=""  src="<%=request.getContextPath()%>/image/btn_order.jpg">
							</a><Br>
					 	<A href="#"> <IMG width="75" alt=""
							src="<%=request.getContextPath()%>/image/btn_order_later.jpg">
						</A><Br> 
						<A href="#"> <IMG width="75" alt=""
							src="<%=request.getContextPath()%>/image/btn_add_list.jpg">
						</A><br> 
						<A href="#"> <IMG width="75" alt=""
							src="<%=request.getContextPath()%>/image/btn_delete.jpg">
					</A></TD>
			</TR>
				<c:set  var="totalPrice" value="${totalPrice+item.goods_sales_price }" />
				<c:set  var="totalNum" value="${totalNum+1 }" />
			   </c:forEach>
		    
		</TBODY>
	</TABLE>
     	
	<DIV class="clear"></DIV>
	<br>
	<br>
	<table>
		<tr>
			<td><STRONG>선택한 상품 </STRONG> 
				 <A href="#"> <IMG width="75" alt=""
						src="<%=request.getContextPath()%>/image/btn_order_later.jpg">
				</A>
				<A href="#"> <IMG width="75" alt=""
						src="<%=request.getContextPath()%>/image/btn_add_list.jpg">
				</A> 
				<A href="#"> <IMG width="75" alt=""
						src="<%=request.getContextPath()%>/image/btn_delete.jpg">
				</A>
			</td>
		</tr>
	</table>
	 </c:otherwise>
	</c:choose> 
	<br>
	<br>
	
	<table  width=80%   class="list_view" style="background:#cacaff">
	<TBODY>
	     <tr  align=center  class="fixed" >
	       <td class="fixed">총 상품수 </td>
	       <td>총 상품금액</td>
	       <td>  </td>
	       <td>총 배송비</td>
	       <td>  </td>
	       <td>총 할인 금액 </td>
	       <td>  </td>
	       <td>최종 결제금액</td>
	     </tr>
		<tr cellpadding=40  align=center >
			<td id="">
			  <p id="p_totalNum">${totalNum}개 </p>
			  <input id="h_totalNum"type="hidden" value="${totalNum}"  />
			</td>
	       <td>
	          <p id="p_totalPrice">${totalPrice}원</p>
	          <input id="h_totalPrice"type="hidden" value="${totalPrice}" />
	       </td>
	       <td> 
	          <IMG width="25" alt="" src="<%=request.getContextPath()%>/image/plus.jpg">  
	       </td>
	       <td>
	         <p id="p_totalDelivery">${totalDelivery }원  </p>
	         <input id="h_totalDelivery"type="hidden" value="${totalDelivery}" />
	       </td>
	       <td> 
	         <IMG width="25" alt="" src="<%=request.getContextPath()%>/image/minus.jpg"> 
	       </td>
	       <td>  
	         <p id="p_totalSalesPrice">${totalSalesPrice }원  </p>
	         <input id="h_totalSalesPrice"type="hidden" value="${totalSalesPrice}" />
	       </td>
	       <td>  
	         <IMG width="25" alt="" src="<%=request.getContextPath()%>/image/equal.jpg">
	       </td>
	       <td>
	          <p id="p_final_totalPrice">${totalPrice+totalDelivery-totalSalesPrice  }원</p>
	          <input id="h_final_totalPrice" type="hidden" value="${totalPrice+totalDelivery-totalSalesPrice  }" />
	       </td>
		</tr>
		</TBODY>
	</table>
	<center>
    <br><br>	
		 <a href="javascript:fn_order_all_cart_goods()">
		 	<IMG width="75" alt="" src="<%=request.getContextPath()%>/image/btn_order_final.jpg">
		 </a>
		 <a href="#">
		 	<IMG width="75" alt="" src="<%=request.getContextPath()%>/image/btn_shoping_continue.jpg">
		 </a>
	<center>
</form>	
