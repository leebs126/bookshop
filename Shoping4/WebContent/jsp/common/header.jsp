<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<head>
	<TITLE>도서 쇼핑몰_4</TITLE>
</head>
<body>
	<DIV id="logo">
	<A href="<%=request.getContextPath()%>/main/index.do">
		<IMG width="176" height="67" alt="Senop" src="<%=request.getContextPath()%>/image/senop_logo.png">
		</A>
	</DIV>
	<DIV id="head_link">
		<UL>
			<LI><A href="#">로그인</A></LI>
			<LI><A href="#">회원가입</A></LI>
			<LI><A href="#">장바구니</A></LI>
			<LI><A href="#">고객센터</A></LI>
			<LI><A href="#">주문배송</A></LI>
			<LI class="no_line"><A href="<%=request.getContextPath()%>/admin/admin.do">관리자</A></LI>
		</UL>
	</DIV>
	<BR>
	<DIV id="search">
		<FORM>
			<INPUT name="input" class="main_input" type="text"> <INPUT
				name="search" class="btn1" type="button" value="검 색">
		</FORM>
	</DIV>
</body>
</html>