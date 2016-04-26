<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
      isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>    
<!DOCTYPE html PUBLIC "" "">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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

	  <title><tiles:getAsString name="title"/></title>
</head>
<BODY>

	<DIV id="outer_wrap">
		<DIV id="wrap">
			<HEADER>
				  <%--  <tiles:insert attribute="header" /> --%>
				  <tiles:insert attribute="header" />
			</HEADER>
			<DIV class="clear"></DIV>
			<ASIDE>
				 <tiles:insert attribute="side" />
			</ASIDE>
			<ARTICLE>
			 	<tiles:insert attribute="body" />
			</ARTICLE>
			<DIV class="clear"></DIV>
			<FOOTER>
        		<tiles:insert attribute="footer" />
        		
        	</FOOTER>
		</DIV>
		 <tiles:insert attribute="sticky_menu" />
    </DIV>        	
      
        
        