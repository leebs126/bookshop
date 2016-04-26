<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:set  var="orderer_hp" value=""/>
<c:set var="final_total_order_price" value="0" />
<!-- ���� ���� �ݾ� -->
<c:set var="total_order_price" value="0" />
<!-- �ֹ� �ݾ� -->
<c:set var="total_order_goods_qty" value="0" />
<!-- �� ��ǰ�� -->
<head>
<style>
#layer {
	z-index: 2;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	/* background-color:rgba(0,0,0,0.8); */
}

#popup_order_detail {
	z-index: 3;
	position: fixed;
	text-align: center;
	left: 10%;
	top: 0%;
	width: 60%;
	height: 100%;
	background-color:#ccff99;
	border: 2px solid  #0000ff;
}

#close {
	z-index: 4;
	float: right;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
                var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('zipcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('roadAddress').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;

                // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
                if(data.autoRoadAddress) {
                    //����Ǵ� ���θ� �ּҿ� ������ �ּҸ� �߰��Ѵ�.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
    
	function reset_all() {
		//alert("aaaa");
		var e_receiver_name = document.getElementById("receiver_name");
		var e_hp1 = document.getElementById("hp1");
		var e_hp2 = document.getElementById("hp2");
		var e_hp3 = document.getElementById("hp3");

		var e_tel1 = document.getElementById("tel1");
		var e_tel2 = document.getElementById("tel2");
		var e_tel3 = document.getElementById("tel3");

		var e_zipcode = document.getElementById("zipcode");
		var e_roadAddress = document.getElementById("roadAddress");
		var e_jibunAddress = document.getElementById("jibunAddress");
		var e_namujiAddress = document.getElementById("namujiAddress");

		e_receiver_name.value = "";
		e_hp1.value = 0;
		e_hp2.value = "";
		e_hp3.value = "";
		e_tel1.value = "";
		e_tel2.value = "";
		e_tel3.value = "";
		e_zipcode.value = "";
		e_roadAddress.value = "";
		e_jibunAddress.value = "";
		e_namujiAddress.value = "";
	}

	function restore_all() {
		var e_receiver_name = document.getElementById("receiver_name");
		var e_hp1 = document.getElementById("hp1");
		var e_hp2 = document.getElementById("hp2");
		var e_hp3 = document.getElementById("hp3");

		var e_tel1 = document.getElementById("tel1");
		var e_tel2 = document.getElementById("tel2");
		var e_tel3 = document.getElementById("tel3");

		var e_zipcode = document.getElementById("zipcode");
		var e_roadAddress = document.getElementById("roadAddress");
		var e_jibunAddress = document.getElementById("jibunAddress");
		var e_namujiAddress = document.getElementById("namujiAddress");

		var h_receiver_name = document.getElementById("h_receiver_name");
		var h_hp1 = document.getElementById("h_hp1");
		var h_hp2 = document.getElementById("h_hp2");
		var h_hp3 = document.getElementById("h_hp3");

		var h_tel1 = document.getElementById("h_tel1");
		var h_tel2 = document.getElementById("h_tel2");
		var h_tel3 = document.getElementById("h_tel3");

		var h_zipcode = document.getElementById("h_zipcode");
		var h_roadAddress = document.getElementById("h_roadAddress");
		var h_jibunAddress = document.getElementById("h_jibunAddress");
		var h_namujiAddress = document.getElementById("h_namujiAddress");
		//alert(e_receiver_name.value);
		e_receiver_name.value = h_receiver_name.value;
		e_hp1.value = h_hp1.value;
		e_hp2.value = h_hp2.value;
		e_hp3.value = h_hp3.value;

		e_tel1.value = h_tel1.value;
		e_tel2.value = h_tel2.value;
		e_tel3.value = h_tel3.value;
		e_zipcode.value = h_zipcode.value;
		e_roadAddress.value = h_roadAddress.value;
		e_jibunAddress.value = h_jibunAddress.value;
		e_namujiAddress.value = h_namujiAddress.value;

	}
	
function fn_pay_phone(){
	
	
	var e_card=document.getElementById("tr_pay_card");
	var e_phone=document.getElementById("tr_pay_phone");
	e_card.style.visibility="hidden";
	e_phone.style.visibility="visible";
}

function fn_pay_card(){
	var e_card=document.getElementById("tr_pay_card");
	var e_phone=document.getElementById("tr_pay_phone");
	e_card.style.visibility="visible";
	e_phone.style.visibility="hidden";
}

function imagePopup(type) {
	if (type == 'open') {
		// �˾�â�� ����.
		jQuery('#layer').attr('style', 'visibility:visible');

		// �������� ���������� ���̾� ������ ���̸� ������ ��ü�� ���̿� ���� �Ѵ�.
		jQuery('#layer').height(jQuery(document).height());
	}

	else if (type == 'close') {

		// �˾�â�� �ݴ´�.
		jQuery('#layer').attr('style', 'visibility:hidden');
	}
}

var goods_id="";
var goods_title="";
var goods_fileName="";

var order_goods_qty
var each_goods_price;
var total_order_goods_price;
var total_order_goods_qty;
var orderer_name
var receiver_name
var hp1;
var hp2;
var hp3;

var tel1;
var tel2;
var tel3;

var receiver_hp_num;
var receiver_tel_num;
var delivery_address;
var delivery_message;
var delivery_method;
var gift_wrapping;
var pay_method;
var card_com_name;
var card_pay_month;
var pay_orderer_hp_num;

function fn_show_order_detail(){
	
	var frm=document.form_order;
	var h_goods_id=frm.h_goods_id;
	var h_goods_title=frm.h_goods_title;
	var h_goods_fileName=frm.h_goods_fileName;
	var r_delivery_method  =  frm.delivery_method;
	var h_order_goods_qty=document.getElementById("h_order_goods_qty");
	var h_total_order_goods_qty=document.getElementById("h_total_order_goods_qty");
	var h_total_sales_price=document.getElementById("h_total_sales_price");
	var h_final_total_Price=document.getElementById("h_final_total_Price");
	var h_orderer_name=document.getElementById("h_orderer_name");
	var i_receiver_name=document.getElementById("receiver_name");
	
	
	for(var i=0; i<h_goods_id.length;i++){
	//	alert(h_goods_id[i].value);
		goods_id+=h_goods_id[i].value+"<br>";
		
	}
	
	for(var i=0; i<h_goods_title.length;i++){
	//	alert(h_goods_title[i].value);
		goods_title+=h_goods_title[i].value+"<br>";
		
	}
	
	for(var i=0; i<h_goods_fileName.length;i++){
		//alert(h_goods_fileName[i].value);
		goods_fileName+=h_goods_fileName[i].value+"<br>";
		
	}
	
	total_order_goods_price=h_final_total_Price.value;
	total_order_goods_qty=h_total_order_goods_qty.value;
//	alert("total_order_goods_qty:"+total_order_goods_qty);
//	goods_id=h_goods_id.value;
//	goods_title=h_goods_title.value;
//	goods_fileName=h_goods_fileName.value;
	
	
	for(var i=0; i<r_delivery_method.length;i++){
	  if(r_delivery_method[i].checked==true){
		 delivery_method=r_delivery_method[i].value
		 break;
	  }
	} 
		
	var r_gift_wrapping  =  frm.gift_wrapping;
	
	
	for(var i=0; i<r_gift_wrapping.length;i++){
	  if(r_gift_wrapping[i].checked==true){
		  gift_wrapping=r_gift_wrapping[i].value
		 break;
	  }
	} 
	
	var r_pay_method  =  frm.pay_method;
	
	for(var i=0; i<r_pay_method.length;i++){
	  if(r_pay_method[i].checked==true){
		  pay_method=r_pay_method[i].value
		  if(pay_method=="�ſ�ī��"){
			var i_card_com_name=document.getElementById("card_com_name");
			var i_card_pay_month=document.getElementById("card_pay_month");
			card_com_name=i_card_com_name.value;
			card_pay_month=i_card_pay_month.value;
			pay_method+="<Br>"+
				 		"ī���:"+card_com_name+"<br>"+
				 		"�Һΰ�����:"+card_pay_month;
			pay_orderer_hp_num="�ش����";
			
		  }else if(pay_method=="�޴�������"){
			var i_pay_order_tel1=document.getElementById("pay_order_tel1");
			var i_pay_order_tel2=document.getElementById("pay_order_tel2");
			var i_pay_order_tel3=document.getElementById("pay_order_tel3");
			pay_orderer_hp_num=i_pay_order_tel1.value+"-"+
						   	    i_pay_order_tel2.value+"-"+
							    i_pay_order_tel3.value;
			pay_method+="<Br>"+"�����޴�����ȣ:"+pay_orderer_hp_num;
			card_com_name="�ش����";
			card_pay_month="�ش����";
		  } //end if
		 break;
	  }// end for
	}
	
	var i_hp1=document.getElementById("hp1");
	var i_hp2=document.getElementById("hp2");
	var i_hp3=document.getElementById("hp3");
	
	var i_tel1=document.getElementById("tel1");
	var i_tel2=document.getElementById("tel2");
	var i_tel3=document.getElementById("tel3");
	
	var i_zipcode=document.getElementById("zipcode");
	var i_roadAddress=document.getElementById("roadAddress");
	var i_jibunAddress=document.getElementById("jibunAddress");
	var i_namujiAddress=document.getElementById("namujiAddress");
	var i_delivery_message=document.getElementById("delivery_message");
	var i_pay_method=document.getElementById("pay_method");

//	alert("���ֹ� �ݾ�:"+total_order_goods_price);
	order_goods_qty=h_order_goods_qty.value;
	//order_total_price=h_order_total_price.value;
	
	orderer_name=h_orderer_name.value;
	receiver_name=i_receiver_name.value;
	hp1=i_hp1.value;
	hp2=i_hp2.value;
	hp3=i_hp3.value;
	
	tel1=i_tel1.value;
	tel2=i_tel2.value;
	tel3=i_tel3.value;
	
	receiver_hp_num=hp1+"-"+hp2+"-"+hp3;
	receiver_tel_num=tel1+"-"+tel2+"-"+tel3;
	
	delivery_address="�����ȣ:"+i_zipcode.value+"<br>"+
						"���θ� �ּ�:"+i_roadAddress.value+"<br>"+
						"[���� �ּ�:"+i_jibunAddress.value+"]<br>"+
								  i_namujiAddress.value;
	
	delivery_message=i_delivery_message.value;

	
	
	
	var p_order_goods_id=document.getElementById("p_order_goods_id");
	var p_order_goods_title=document.getElementById("p_order_goods_title");
	var p_order_goods_qty=document.getElementById("p_order_goods_qty");
	var p_total_order_goods_qty=document.getElementById("p_total_order_goods_qty");
	var p_total_order_goods_price=document.getElementById("p_total_order_goods_price");
	var p_orderer_name=document.getElementById("p_orderer_name");
	var p_receiver_name=document.getElementById("p_receiver_name");
	var p_delivery_method=document.getElementById("p_delivery_method");
	var p_receiver_hp_num=document.getElementById("p_receiver_hp_num");
	var p_receiver_tel_num=document.getElementById("p_receiver_tel_num");
	var p_delivery_address=document.getElementById("p_delivery_address");
	var p_delivery_message=document.getElementById("p_delivery_message");
	var p_gift_wrapping=document.getElementById("p_gift_wrapping");	
	var p_pay_method=document.getElementById("p_pay_method");
	
	p_order_goods_id.innerHTML=goods_id;
	p_order_goods_title.innerHTML=goods_title;
	p_total_order_goods_qty.innerHTML=total_order_goods_qty+"��";
	p_total_order_goods_price.innerHTML=total_order_goods_price+"��";
	p_orderer_name.innerHTML=orderer_name;
	p_receiver_name.innerHTML=receiver_name;
	p_delivery_method.innerHTML=delivery_method;
	p_receiver_hp_num.innerHTML=receiver_hp_num;
	p_receiver_tel_num.innerHTML=receiver_tel_num;
	p_delivery_address.innerHTML=delivery_address;
	p_delivery_message.innerHTML=delivery_message;
	p_gift_wrapping.innerHTML=gift_wrapping;
	p_pay_method.innerHTML=pay_method;
	imagePopup('open');
}

function fn_process_pay_order(){
	
	alert("���� �����ϱ�");
	var formObj=document.createElement("form");
	var i_command = document.createElement("input");
	/*
	var i_goods_id = document.createElement("input");
	var i_goods_title = document.createElement("input");
	var i_order_goods_qty=document.createElement("input");
	var i_goods_fileName=document.createElement("input")
	var i_order_total_price=document.createElement("input");
	
    var i_orderer_name=document.createElement("input");
    */
    var i_receiver_name=document.createElement("input");
    
    var i_receiver_hp1=document.createElement("input");
    var i_receiver_hp2=document.createElement("input");
    var i_receiver_hp3=document.createElement("input");
   
    var i_receiver_tel1=document.createElement("input");
    var i_receiver_tel2=document.createElement("input");
    var i_receiver_tel3=document.createElement("input");
    
    var i_delivery_address=document.createElement("input");
    var i_delivery_message=document.createElement("input");
    var i_delivery_method=document.createElement("input");
    var i_gift_wrapping=document.createElement("input");
    var i_pay_method=document.createElement("input");
    var i_card_com_name=document.createElement("input");
    var i_card_pay_month=document.createElement("input");
    var i_pay_orderer_hp_num=document.createElement("input");
   
    i_command.name="command";
    /*
    i_goods_id.name="goods_id";
    i_goods_title.name="goods_title";
    i_goods_fileName.name="goods_fileName";
    
    i_order_goods_qty.name="order_goods_qty";
    i_order_total_price.name="order_total_price";
    i_orderer_name.name="orderer_name";
    */
    i_receiver_name.name="receiver_name";
    i_receiver_hp1.name="receiver_hp1";
    i_receiver_hp2.name="receiver_hp2";
    i_receiver_hp3.name="receiver_hp3";
   
    i_receiver_tel1.name="receiver_tel1";
    i_receiver_tel2.name="receiver_tel2";
    i_receiver_tel3.name="receiver_tel3";
   
    i_delivery_address.name="delivery_address";
    i_delivery_message.name="delivery_message";
    i_delivery_method.name="delivery_method";
    i_gift_wrapping.name="gift_wrapping";
    i_pay_method.name="pay_method";
    i_card_com_name.name="card_com_name";
    i_card_pay_month.name="card_pay_month";
    i_pay_orderer_hp_num.name="pay_orderer_hp_num";
  
    i_command.value="pay_order_goods";
    /*
    i_goods_id.value=goods_id;
    i_goods_title.value=goods_title;
    i_goods_fileName.value=goods_fileName;
    i_order_goods_qty.value=order_goods_qty;
    i_order_total_price.value=order_total_price;
    i_orderer_name.value=orderer_name;
    */
    i_receiver_name.value=receiver_name;
    i_receiver_hp1.value=hp1;
    i_receiver_hp2.value=hp2;
    i_receiver_hp3.value=hp3;
    
    i_receiver_tel1.value=tel1;
    i_receiver_tel2.value=tel2;
    i_receiver_tel3.value=tel3;
    ;
    i_delivery_address.value=delivery_address;
    i_delivery_message.value=delivery_message;
    i_delivery_method.value=delivery_method;
    i_gift_wrapping.value=gift_wrapping;
    i_pay_method.value=pay_method;
    i_card_com_name.value=card_com_name;
    i_card_pay_month.value=card_pay_month;
    i_pay_orderer_hp_num.value=pay_orderer_hp_num;
    
    /*
    
    formObj.appendChild(i_goods_id);
    formObj.appendChild(i_goods_title);
    formObj.appendChild(i_goods_fileName);
    formObj.appendChild(i_order_goods_qty);
    formObj.appendChild(i_order_total_price);
    formObj.appendChild(i_orderer_name);
    */
    formObj.appendChild(i_command);
    formObj.appendChild(i_receiver_name);
    formObj.appendChild(i_receiver_hp1);
    formObj.appendChild(i_receiver_hp2);
    formObj.appendChild(i_receiver_hp3);
    formObj.appendChild(i_receiver_tel1);
    formObj.appendChild(i_receiver_tel2);
    formObj.appendChild(i_receiver_tel3);

    formObj.appendChild(i_delivery_address);
    formObj.appendChild(i_delivery_message);
    formObj.appendChild(i_delivery_method);
    formObj.appendChild(i_gift_wrapping);
    
    formObj.appendChild(i_pay_method);
    formObj.appendChild(i_card_com_name);
    formObj.appendChild(i_card_pay_month);
    formObj.appendChild(i_pay_orderer_hp_num);
    

    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="/Shoping9/order/order.do";
    formObj.submit();
/* 	
	alert("hp: "+hp);
	alert("delivery_method:"+delivery_method); */
	imagePopup('close');
}
</script>
</head>
<BODY>
	<H1>1.�ֹ�Ȯ��</H1>
<form  name="form_order">	
	<TABLE class="list_view">
		<TBODY align=center>
			<tr style="background: #33ff00">
				<td colspan=2 class="fixed">�ֹ���ǰ��</td>
				<td>����</td>
				<td>�ֹ��ݾ�</td>
				<td>��ۺ�</td>
				<td>����������</td>
				<td>�ֹ��ݾ��հ�</td>
			</tr>
			<TR>
				<c:forEach var="item" items="${my_order_list }">
					<TD class="goods_image">
					  <a href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">
					    <IMG width="75" alt=""  src="<%=request.getContextPath() %>/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"">
					    <input   type="hidden" id="h_goods_id" name="h_goods_id" value="${item.goods_id }" />
					    <input   type="hidden" id="h_goods_fileName" name="h_goods_fileName" value="${item.goods_fileName }" />
					  </a>
					</TD>
					<TD>
					  <h2>
					     <A href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">${item.goods_title }</A>
					      <input   type="hidden" id="h_goods_title" name="h_goods_title" value="${item.goods_title }" />
					  </h2>
					</TD>
					<td>
					  <h2>${item.order_goods_qty }��<h2>
					    <input   type="hidden" id="h_order_goods_qty" name="h_order_goods_qty" value="${item.order_goods_qty}" />
					</td>
					<td><h2>${item.goods_sales_price * item.order_goods_qty}�� (10% ����)</h2></td>
					<td><h2>0��</h2></td>
					<td><h2>${1500 *item.order_goods_qty }��</h2></td>
					<td>
					  <h2>${item.goods_sales_price * item.order_goods_qty}��</h2>
					  <input  type="hidden" id="h_each_goods_price"  name="h_each_goods_price" value="${item.goods_sales_price * item.order_goods_qty}" />
					</td>
			</TR>
			<c:set var="final_total_order_price"
				value="${final_total_order_price+ item.goods_sales_price* item.order_goods_qty}" />
			<c:set var="total_order_price"
				value="${total_order_price+ item.goods_sales_price* item.order_goods_qty}" />
			<c:set var="total_order_goods_qty"
				value="${total_order_goods_qty+item.order_goods_qty }" />
			</c:forEach>
		</TBODY>
	</TABLE>
	<DIV class="clear"></DIV>

	<br>
	<br>
	<H1>2.����� ����</H1>
	<DIV class="detail_table">
	
		<TABLE>
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">��۹��</TD>
					<TD>
					    <input type="radio" id="delivery_method" name="delivery_method" value="�Ϲ��ù�" checked>�Ϲ��ù� &nbsp;&nbsp;&nbsp; 
						<input type="radio" id="delivery_method" name="delivery_method" value="�������ù�">�������ù� &nbsp;&nbsp;&nbsp; 
						<input type="radio" id="delivery_method" name="delivery_method" value="�ؿܹ��">�ؿܹ�� &nbsp;&nbsp;&nbsp;
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">����� ����</TD>
					<TD><input type="radio" name="delivery_place"
						onClick="restore_all()" value="�⺻�����" checked>�⺻����� &nbsp;&nbsp;&nbsp; 
						<input type="radio" name="delivery_place" value="�����Է�" onClick="reset_all()">�����Է� &nbsp;&nbsp;&nbsp;
						<input type="radio" name="delivery_place" value="�ֱٹ����">�ֱٹ���� &nbsp;&nbsp;&nbsp;
				    </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">������ ��</TD>
					<TD><input id="receiver_name" name="receiver_name" type="text" size="40" value="${orderer.member_name }" />
					   <input type="hidden" id="h_orderer_name" name="h_orderer_name"  value="${orderer.member_name }" /> 
					   <input type="hidden" id="h_receiver_name" name="h_receiver_name"  value="${orderer.member_name }" />
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">�޴�����ȣ</TD>
					<TD><select id="hp1" name="hp1">
							<option>����</option>
							<c:choose>
								<c:when test="${orderer.hp1=='010' }">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</c:when>
								<c:when test="${orderer.hp1=='011' }">
									<option value="010">010</option>
									<option value="011" selected>011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</c:when>
							</c:choose>
					</select> 
					 - <input type="text" id="hp2" name="hp2" value="${orderer.hp2 }"> 
					 - <input type="text" id="hp3" name="hp3" value="${orderer.hp3 }"><br><br> 
					  <input type="hidden" id="h_hp1" name="h_hp1" value="${orderer.hp1 }" /> 
					  <input type="hidden" id="h_hp2" name="h_hp2" value="${orderer.hp2 }" /> 
					  <input type="hidden" id="h_hp3" name="h_hp3"  value="${orderer.hp3 }" />
					  <c:set  var="orderer_hp" value="${orderer.hp1}-${orderer.hp2}-${orderer.hp3 }"/>
					   									
					         
				  </TR>
				<TR class="dot_line">
					<TD class="fixed_join">������ȭ(����)</TD>
					<TD><select id="tel1" name="tel1">
							<option>02</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="044">044</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
							<option value="0502">0502</option>
							<option value="0503">0503</option>
							<option value="0505">0505</option>
							<option value="0506">0506</option>
							<option value="0507">0507</option>
							<option value="0508">0508</option>
							<option value="070">070</option>
					</select> - <input type="text" id="tel2" name="tel2"
						value="${orderer.tel2 }"> - <input type="text" id="tel3" name="tel3" value="${orderer.tel3 }">
					</TD>
					<input type="hidden" id="h_tel1" name="h_tel1"
						value="${orderer.tel1 }" />
					<input type="hidden" id="h_tel2" name="h_tel2"
						value="${orderer.tel2 }" />
					<input type="hidden" id="h_tel3" name="h_tel3"
						value="${orderer.tel3 }" />
				</TR>


				<TR class="dot_line">
					<TD class="fixed_join">�ּ�</TD>
					<TD><input type="text" id="zipcode" name="zipcode" size="5"
						value="${orderer.zipcode }"> <a
						href="javascript:execDaumPostcode()">�����ȣ�˻�</a> <br>
						<p>
							���� �ּ�:<br>
							<input type="text" id="roadAddress" name="roadAddress" size="50" value="${orderer.roadAddress }" /><br>
							<br> ���θ� �ּ�: 
							   <input type="text" id="jibunAddress" name="jibunAddress" size="50"
								              value="${orderer.jibunAddress }" /><br>
							<br> ������ �ּ�: 
							   <input type="text" id="namujiAddress"  name="namujiAddress" size="50"
								     value="${orderer.namujiAddress }" /> 
								     <span id="guide"  style="color: #999"></span>
						</p> 
						 <input type="hidden" id="h_zipcode" name="h_zipcode" value="${orderer.zipcode }" /> 
						 <input type="hidden"  id="h_roadAddress" name="h_roadAddress"  value="${orderer.roadAddress }" /> 
						 <input type="hidden"  id="h_jibunAddress" name="h_jibunAddress" value="${orderer.jibunAddress }" /> 
						 <input type="hidden"  id="h_namujiAddress" name="h_namujiAddress" value="${orderer.namujiAddress }" />
						 <span id="guide" style="color:#999"></span>
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">��� �޽���</TD>
					<TD><input id="delivery_message" name="delivery_message" type="text" size="50"
						value="�ù� ���Բ� ������ �޽����� �����ּ���." /></TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">���� ����</TD>
					<td><input type="radio" id="gift_wrapping" name="gift_wrapping" value="yes">��
						&nbsp;&nbsp;&nbsp; <input type="radio"  id="gift_wrapping" name="gift_wrapping" checked value="no">�ƴϿ�</td>
				</TR>
			</TBODY>
		</TABLE>
		
	</DIV>
	<div >
	  <br><br>
	   <h2>�ֹ���</h2>
		 <table >
		   <TBODY>
			 <tr class="dot_line">
				<td ><h2>�̸�</h2></td>
				<td>
				 <input  type="text" value="${orderer.member_name}" size="15" />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td ><h2>�ڵ���</h2></td>
				<td>
				 <input  type="text" value="${orderer.hp1}-${orderer.hp2}-${orderer.hp3}" size="15" />
				</td>
			  </tr>
			  <tr class="dot_line">
				<td ><h2>�̸���</h2></td>
				<td>
				 <input  type="text" value="${orderer.email1}@${orderer.email2}" size="15" />
				</td>
			  </tr>
		   </TBODY>
		</table>
	</div>
	<DIV class="clear"></DIV>
	<br>
	<br>
	<br>


	<H1>3.���� ����</H1>
	<DIV class="detail_table">
		<table>
			<TBODY>
				<tr class="dot_line">
					<td width=100>������</td>
					<td><input name="discount_juklip" type="text" size="10" />��/1000��
						&nbsp;&nbsp;&nbsp; <input type="checkbox" /> ��� ����ϱ�</td>
				</tr>
				<tr class="dot_line">
					<td>��ġ��</td>
					<td><input name="discount_yechi" type="text" size="10" />��/1000��
						&nbsp;&nbsp;&nbsp; <input type="checkbox" /> ��� ����ϱ�</td>
				</tr>
				<tr class="dot_line">
					<td>��ǰ�� ��ȯ��</td>
					<td cellpadding="5"><input name="discount_sangpum" type="text"
						size="10" />��/0�� &nbsp;&nbsp;&nbsp; <input type="checkbox" /> ���
						����ϱ�</td>
				</tr>
				<tr class="dot_line">
					<td>OK ĳ���� ����Ʈ</td>
					<td cellpadding="5"><input name="discount_okcashbag" type="text"
						size="10" />��/0�� &nbsp;&nbsp;&nbsp; <input type="checkbox" /> ���
						����ϱ�</td>
				</tr>
				<tr class="dot_line">
					<td>��������</td>
					<td cellpadding="5"><input name="discount_coupon" type="text"
						size="10" />��/0�� &nbsp;&nbsp;&nbsp; <input type="checkbox" /> ���
						����ϱ�</td>
				</tr>
			</TBODY>
		</table>
	</DIV>
	<DIV class="clear"></DIV>

	<br>

	<table width=80% class="list_view" style="background: #ccffff">
		<TBODY>
			<tr align=center class="fixed">
				<td class="fixed">�� ��ǰ��</td>
				<td>�� ��ǰ�ݾ�</td>
				<td></td>
				<td>�� ��ۺ�</td>
				<td></td>
				<td>�� ���� �ݾ�</td>
				<td></td>
				<td>���� �����ݾ�</td>
			</tr>
			<tr cellpadding=40 align=center>
				<td id="">
					<p id="p_totalNum">${total_order_goods_qty}��</p> 
					<input id="h_total_order_goods_qty" type="hidden" value="${total_order_goods_qty}" />
				</td>
				<td>
					<p id="p_totalPrice">${total_order_price}��</p> <input
					id="h_totalPrice" type="hidden" value="${total_order_price}" />
				</td>
				<td><IMG width="25" alt=""
					src="<%=request.getContextPath()%>/image/plus.jpg"></td>
				<td>
					<p id="p_totalDelivery">${total_delivery_price }��</p> <input
					id="h_totalDelivery" type="hidden" value="${total_delivery_price}" />
				</td>
				<td><IMG width="25" alt=""
					src="<%=request.getContextPath()%>/image/minus.jpg"></td>
				<td>
					<p id="p_totalSalesPrice">${total_sales_price }��</p> 
					<input id="h_total_sales_price" type="hidden" value="${total_sales_price}" />
				</td>
				<td><IMG width="25" alt="" src="<%=request.getContextPath()%>/image/equal.jpg"></td>
				<td>
					<p id="p_final_totalPrice">
						<font size="15">${final_total_order_price }�� </font>
					</p> <input id="h_final_total_Price" type="hidden" value="${final_total_order_price}" />
				</td>
			</tr>
		</TBODY>
	</table>
   <DIV class="clear"></DIV>
	<br>
	<br>
	<br>
	<H1>4.��������</H1>
	<DIV class="detail_table">
		<table>
			<TBODY>
				<tr >
					<td>
					   <input type="radio" id="pay_method" name="pay_method" value="�ſ�ī��"   onClick="fn_pay_card()" checked>�ſ�ī�� &nbsp;&nbsp;&nbsp; 
					   <input type="radio" id="pay_method" name="pay_method" value="���� �ſ�ī��"  >���� �ſ�ī�� &nbsp;&nbsp;&nbsp; 
					   <input type="radio" id="pay_method" name="pay_method" value="�ǽð� ������ü">�ǽð� ������ü &nbsp;&nbsp;&nbsp;
					   <input type="radio" id="pay_method" name="pay_method" value="������ �Ա�">������ �Ա� &nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr >
					<td>
					   <input type="radio" id="pay_method" name="pay_method" value="�޴�������" onClick="fn_pay_phone()">�޴��� ���� &nbsp;&nbsp;&nbsp;
					   <input type="radio" id="pay_method" name="pay_method" value="īī������(�������)">īī������(�������) &nbsp;&nbsp;&nbsp; 
					   <input type="radio" id="pay_method" name="pay_method" value="���̳���(�������)">���̳���(�������) &nbsp;&nbsp;&nbsp; 
					   <input type="radio" id="pay_method" name="pay_method" value="������(�������)">������(�������) &nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr >
					<td>
					   <input type="radio"  id="pay_method" name="pay_method" value="�����Ա�">�����Ա�&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr id="tr_pay_card">
					<td>
					  <strong>ī�� ����<strong>:&nbsp;&nbsp;&nbsp;
					  <select id="card_com_name" name="card_com_name">
							<option value="�Ｚ" selected>�Ｚ</option>
							<option value="�ϳ�SK">�ϳ�SK</option>
							<option value="����">����</option>
							<option value="KB">KB</option>
							<option value="����">����</option>
							<option value="�Ե�">�Ե�</option>
							<option value="BC">BC</option>
							<option value="��Ƽ">��Ƽ</option>
							<option value="NH����">NH����</option>
					</select>
					<Br><Br>
					<strong>�Һ� �Ⱓ:<strong>  &nbsp;&nbsp;&nbsp;
					<select id="card_pay_month" name="card_pay_month">
							<option value="�Ͻú�" selected>�Ͻú�</option>
							<option value="2����">2����</option>
							<option value="3����">3����</option>
							<option value="4����">4����</option>
							<option value="5����">5����</option>
							<option value="6����">6����</option>
					</select>
					
					</td>
				</tr>
				<tr id="tr_pay_phone" style="visibility:hidden">
				  <td>
				  <strong>�޴��� ��ȣ �Է�: <strong>
				  	       <input  type="text" size="5" value=""  id="pay_order_tel1" name="pay_order_tel1" />-
				           <input  type="text" size="5" value="" id="pay_order_tel2" name="pay_order_tel2" />-
				           <input  type="text" size="5" value="" id="pay_order_tel3" name="pay_order_tel3" />
				  </td>
				</tr>
			</TBODY>
		</table>
	</DIV>
</form>
    <DIV class="clear"></DIV>
	<br>
	<br>
	<br>
	<center>
		<br>
		<br> <a href="javascript:fn_show_order_detail();"> 
		<IMG width="125" alt="" src="<%=request.getContextPath()%>/image/btn_gulje.jpg">
		</a> <a href="<%=request.getContextPath()%>/main/index.do"> 
		   <IMG width="75" alt="" src="<%=request.getContextPath()%>/image/btn_shoping_continue.jpg">
		</a>
	
<DIV class="clear"></DIV>		
	<div id="layer" style="visibility:hidden">
		<!-- visibility:hidden ���� �����Ͽ� �ش� div���� ���͵��� �����д�. -->
		<div id="popup_order_detail">
			<!-- �˾�â �ݱ� ��ư -->
			<a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');">
			 <img  src="<%=request.getContextPath()%>/image/close.png" id="close" />
			</a> 
			<br/> 
			  <DIV class="detail_table">
			  <h1_TITLE>���� �ֹ� ����</h1_TITLE>
			<table >
				<TBODY align=left>
				 	<tr >
					  <td width=200px>
					      �ֹ���ǰ��ȣ:
					 </td>
					 <td >
						  <p id="p_order_goods_id"> �ֹ���ȣ </p>    
					 </td>
				   </tr>
				   <tr  >
					  <td width=200px>
					      �ֹ���ǰ��:
					 </td>
					 <td >
						  <p id="p_order_goods_title"> �ֹ� ��ǰ�� </p>    
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					      �ֹ���ǰ����:
					 </td>
					 <td>
						  <p id="p_total_order_goods_qty"> �ֹ� ��ǰ���� </p>    
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					     �ֹ��ݾ��հ�:
					 </td>
					 <td >
					      <p id="p_total_order_goods_price">�ֹ��ݾ��հ�</p>
					 </td>
				   </tr>
					<tr>
					  <td width=200px>
					     �ֹ���:
					 </td>
					 <td>
					      <p id="p_orderer_name"> �ֹ��� �̸�</p>
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					     �޴»��:
					 </td>
					 <td>
					      <p id="p_receiver_name">�޴»���̸�</p>
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					     ��۹��:
					 </td>
					 <td>
					      <p id="p_delivery_method">��۹��</p>
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					     �޴»�� �޴�����ȣ:
					 </td>
					 <td>
					      <p id="p_receiver_hp_num"></p>
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					     �޴»�� ������ȭ��ȣ:
					 </td>
					 <td>
					      <p id="p_receiver_tel_num">��۹��</p>
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					     ����ּ�:
					 </td>
					 <td align=left>
					      <p id="p_delivery_address">����ּ�</p>
					 </td>
				   </tr>
				    <tr>
					  <td width=200px>
					     ��۸޽���:
					 </td>
					 <td align=left>
					      <p id="p_delivery_message">��۸޽���</p>
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					     �������� ����:
					 </td>
					 <td align=left>
					      <p id="p_gift_wrapping">��������</p>
					 </td>
				   </tr>
				   <tr>
					  <td width=200px>
					     �������:
					 </td>
					 <td align=left>
					      <p id="p_pay_method">�������</p>
					 </td>
				   </tr>
				   <tr>
				    <td colspan=2 align=center>
				    <INPUT  name="btn_process_pay_order" type="button" onClick="fn_process_pay_order()" value="���������ϱ�">
				    </td>
				   </tr>
				   
				</TBODY>
				</table>
			</DIV>
			<DIV class="clear"></DIV>	
			<br> 
			
			
			
			