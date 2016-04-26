<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script>
 function fn_delete_image(image_id,fileName){
	// alert("fn_delete_image");
	 $.ajax({
		type : "post",
		async : false, //false�� ��� ��������� ó���Ѵ�.
		url : "http://localhost:8090/Shoping11/uploadFile.do",
		data : {
			command:"deleteImage",
			image_id:image_id,
			fileName:fileName
		},
		success : function(data, textStatus) {
			if(data.trim()=='delete_success'){
				alert("������ �����߽��ϴ�.");
				
			}
		},
		error : function(data, textStatus) {
			alert("������ �߻��߽��ϴ�."+data);
		},
		complete : function(data, textStatus) {
			//alert("�۾����Ϸ� �߽��ϴ�");
			
		}
	}); //end ajax	 
	 window.location.reload();
}
</script>
<META name="GENERATOR" content="MSHTML 11.00.9600.17801">
</HEAD>
<BODY>
<form action="<%=request.getContextPath() %>/uploadFile.do" method="post"	enctype="multipart/form-data">
		<h1>��ǰ �̹��� ����â</h1>
		<br>
<table  cellspacing="0" cellpadding="0">
		<tr>
		 <td>
		   <br> 
		 </td>
		</tr>
 <c:choose>
   <c:when test="${empty imageFileList }">
      <tr>
			<td>�� �̹���1</td>
			<td>
			   <input type="hidden" name="command" value="add_goods_imageFile" />
				<input type="file" name="detail_image1" >
				<input type="text" disabled  />
				<br>
			</td>
		</tr>
		<tr>
		 <td>
		   <br>
		 </td>
		</tr>
		<tr>
			<td>�� �̹���2</td>
			<td>
				<input type="file" name="detail_image2" >
				<input type="text" disabled  />
				<br>
			</td>
		</tr>
		<tr>
		 <td>
		   <br>
		 </td>
		</tr>
		<tr>
			<td>�� �̹���3</td>
			<td>
				<input type="file" name="detail_image3"> 
				<input type="text" disabled  />
				<br>
			</td>
		</tr>
		<tr>
		 <td>
		   <br>
		 </td>
		</tr>
   </c:when>		
   <c:otherwise>
      <input type="hidden" name="command" value="mofify_goods_imageFile" />
     <c:forEach var="item" items="${imageFileList }"  varStatus="itemNum">		
		<tr>
			<td>�� �̹���${itemNum.count }</td>
			<td>
				<input type="file" name="detail_image${itemNum.count }" >
				<input type="text" value="${item.fileName }" disabled  />
				<input type="hidden"  name="image_id" value="${item.image_id }"  />
				<br>
			</td>
			<td>
			  &nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<td>
			 <input  type="button" value="�̹��� ����"  onClick="fn_delete_image('${item.image_id }','${item.fileName }')"/>
			</td>
		</tr>
		<tr>
		 <td>
		   <br>
		 </td>
		</tr>
    </c:forEach>
 </c:otherwise>
</c:choose>		
		<tr>
			<td align=center colspan=2>
		      <INPUT   type="submit"  value="��ǰ �̹��� �����ϱ�">
		      <INPUT type="button" onClick="fn_return_list()" value="����Ʈ�� ���ư���"> 
			</td>
		</tr> 
	</table>		
		</form>
