<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "" "">
<head>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">

<META charset="utf-8">
<META name="viewport" content="width=device-width">
<TITLE>도서 쇼핑몰111</TITLE>
<LINK href="../css/main.css" rel="stylesheet" type="text/css" media="screen">
<LINK href="../css/basic-jquery-slider.css" rel="stylesheet" type="text/css" media="screen">
<LINK href="../css/mobile.css" rel="stylesheet" type="text/css">
<SCRIPT src="../jquery/jquery-1.6.2.min.js" type="text/javascript"></SCRIPT>
<SCRIPT src="../jquery/jquery.easing.1.3.js" type="text/javascript"></SCRIPT>
<SCRIPT src="../jquery/stickysidebar.jquery.js" type="text/javascript"></SCRIPT>
<SCRIPT src="../jquery/basic-jquery-slider.js" type="text/javascript"></SCRIPT>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>

<SCRIPT>
	// 슬라이드 
	$(document).ready(function() {
		$('#ad_main_banner').bjqs({
			'width' : 775,
			'height' : 145,
			'showMarkers' : true,
			'showControls' : false,
			'centerMarkers' : false
		});
	});
	// 스티키 		
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
				<%@ include file="../common/header.jsp"%>
			</HEADER>
			<DIV class="clear"></DIV>
			<ASIDE>
				<%@ include file="../common/side.jsp"%>
			</ASIDE>
			<ARTICLE>
			   <%@ include file="./main.jsp"%>
			</ARTICLE>
			<DIV class="clear"></DIV>

<%@ include file="../common/footer.jsp"%>