<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<head>
	<TITLE>���� ���θ�_4</TITLE>
</head>
<body>
	<DIV id="logo">
	<A href="<%=request.getContextPath()%>/main/index.do">
		<IMG width="176" height="67" alt="Senop" src="<%=request.getContextPath()%>/image/senop_logo.png">
		</A>
	</DIV>
	<DIV id="head_link">
		<UL>
			<LI><A href="#">�α���</A></LI>
			<LI><A href="#">ȸ������</A></LI>
			<LI><A href="#">��ٱ���</A></LI>
			<LI><A href="#">������</A></LI>
			<LI><A href="#">�ֹ����</A></LI>
			<LI class="no_line"><A href="<%=request.getContextPath()%>/admin/admin.do">������</A></LI>
		</UL>
	</DIV>
	<BR>
	<DIV id="search">
		<FORM>
			<INPUT name="input" class="main_input" type="text"> <INPUT
				name="search" class="btn1" type="button" value="�� ��">
		</FORM>
	</DIV>
</body>
</html>