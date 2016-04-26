<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	isELIgnored="false" %>

<!DOCTYPE html PUBLIC "" "">
<head>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">

<META charset="utf-8">
<META name="viewport" content="width=device-width">
<LINK href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"
	type="text/css" media="screen">
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
	<h1>새제품 이미지 등록창</h1>
	<br>
	<form action="<%=request.getContextPath() %>/file/uploadFile.do" method="post"	enctype="multipart/form-data">
	<table  cellspacing="0" cellpadding="0">
		<tr>
			<td>메인 이미지</td>
			<td>
				<input type="file" name="main_image"><br>
			</td>
		</tr>
		<tr>
		 <td>
		   <br>
		 </td>
		</tr>
		<tr>
			<td>상세 이미지1</td>
			<td>
				<input type="file" name="detail_image1"><br>
			</td>
		</tr>
		<tr>
		 <td>
		   <br>
		 </td>
		</tr>
		<tr>
			<td>상세 이미지2:</td>
			<td>
				<input type="file" name="detail_image2"><br>
			</td>
		</tr>
		<tr>
		 <td>
		   <br>
		 </td>
		</tr>
		<tr>
			<td>상세 이미지3:</td>
			<td>
				<input type="file" name="detail_image3"><br>
			</td>
		</tr>
		<tr>
		 <td>
		   <br>
		 </td>
		</tr>
		
		<tr colspan=2 >
			<td >
			
			   <input	type="submit" value="제품 이미지 등록하기">
			</td>
		</tr>
	</table>
</form>

