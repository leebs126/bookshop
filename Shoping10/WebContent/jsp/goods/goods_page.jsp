<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "" "">
<head>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">
<META charset="utf-8">
<META name="viewport" content="width=device-width">

<LINK href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css" media="screen">
<LINK href="<%=request.getContextPath()%>/css/basic-jquery-slider.css" rel="stylesheet" type="text/css" media="screen">
<LINK href="<%=request.getContextPath()%>/css/mobile.css" rel="stylesheet" type="text/css">
<SCRIPT src="<%=request.getContextPath()%>/jquery/jquery-1.6.2.min.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=request.getContextPath()%>/jquery/jquery.easing.1.3.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=request.getContextPath()%>/jquery/stickysidebar.jquery.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=request.getContextPath()%>/jquery/basic-jquery-slider.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=request.getContextPath() %>/jquery/tabs.js" type="text/javascript"></SCRIPT>
<SCRIPT src="<%=request.getContextPath() %>/jquery/carousel.js" type="text/javascript"></SCRIPT>

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

<c:choose>
     <c:when test="${empty command  }">
     	<tiles:insertDefinition name="mainLayout" />
     </c:when>
	<c:when test="${command=='goods_search' }">
		<tiles:insertDefinition name="goods.goods_search_list" />
	</c:when>
	<c:when test="${command=='goods_detail' }">
		<tiles:insertDefinition name="goods.goods_detail" />
	</c:when>
	<c:otherwise>
		<tiles:insertDefinition name="mainLayout" />
	</c:otherwise>
</c:choose>
