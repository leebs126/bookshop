<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<c:if test='${not empty errMessage }'>
<script>
window.onload=function()
{
  test();
}

function test(){
	
	alert("���̵�  ��й�ȣ�� Ʋ���ϴ�. �ٽ� �α������ּ���");
}
</script>
</c:if>
</head>
<body>
	<H3>ȸ�� �α��� â</H3>
	<DIV id="detail_table">
	<form action="<%=request.getContextPath() %>/member/member.do" method="post">
		<TABLE>
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">���̵�</TD>
					<TD><input name="member_id" type="text" size="20" /></TD>
				</TR>
				<TR class="solid_line">
					<TD class="fixed_join">��й�ȣ</TD>
					<TD><input name="member_pw" type="password" size="20" /></TD>
				</TR>
			</TBODY>
		</TABLE>
		<br><br>
		<input type="hidden" name="command" value="action_login" /> 
		<INPUT	type="submit" value="�α���"> 
		<INPUT type="button" value="�ʱ�ȭ">
		
		<Br><br>
		
		   <a href="#">���̵� ã��</a>  | 
					   <a href="#">��й�ȣ ã��</a> | 
					   <a href="<%=request.getContextPath() %>/member/member.do?command=member_join_page">ȸ������</a>    | 
					   <a href="#">�� ����</a>
					   
	</form>		
</body>
</html>