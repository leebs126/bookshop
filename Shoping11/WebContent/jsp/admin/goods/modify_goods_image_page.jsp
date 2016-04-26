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
		async : false, //false인 경우 동기식으로 처리한다.
		url : "http://localhost:8090/Shoping11/uploadFile.do",
		data : {
			command:"deleteImage",
			image_id:image_id,
			fileName:fileName
		},
		success : function(data, textStatus) {
			if(data.trim()=='delete_success'){
				alert("파일을 삭제했습니다.");
				
			}
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
			
		}
	}); //end ajax	 
	 window.location.reload();
}
</script>
<META name="GENERATOR" content="MSHTML 11.00.9600.17801">
</HEAD>
<BODY>
<form action="<%=request.getContextPath() %>/uploadFile.do" method="post"	enctype="multipart/form-data">
		<h1>제품 이미지 수정창</h1>
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
			<td>상세 이미지1</td>
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
			<td>상세 이미지2</td>
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
			<td>상세 이미지3</td>
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
			<td>상세 이미지${itemNum.count }</td>
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
			 <input  type="button" value="이미지 삭제"  onClick="fn_delete_image('${item.image_id }','${item.fileName }')"/>
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
		      <INPUT   type="submit"  value="제품 이미지 수정하기">
		      <INPUT type="button" onClick="fn_return_list()" value="리스트로 돌아가기"> 
			</td>
		</tr> 
	</table>		
		</form>
