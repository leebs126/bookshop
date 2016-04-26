<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>    
    <div id="sticky" >
	<UL>
		<LI><A href="#"><IMG
				width="24" height="24" src="<%=request.getContextPath() %>/image/facebook_icon.png">
				페이스북</A></LI>
		<LI><A href="#"><IMG
				width="24" height="24" src="<%=request.getContextPath() %>/image/twitter_icon.png">
				트위터</A></LI>
		<LI><A href="#"><IMG
				width="24" height="24" src="<%=request.getContextPath() %>/image/rss_icon.png">
				RSS 피드</A></LI>
	</UL>
	<DIV class="recent">
		<H3>최근 본 상품</H3>
		<UL>
			<LI><IMG width="75" height="95" src="<%=request.getContextPath() %>/image/html5_icon.jpg"></LI>
			<LI><IMG width="75" height="95" src="<%=request.getContextPath() %>/image/jquery_icon.jpg"></LI>
		</UL>
	</DIV>
</div>
</body>
</html>