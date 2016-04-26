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
	
	alert("아이디나  비밀번호가 틀립니다. 다시 로그인해주세요");
}
</script>
</c:if>
</head>
<body>
	<H3>회원 로그인 창</H3>
	<DIV id="detail_table">
	<form action="<%=request.getContextPath() %>/member/member.do" method="post">
		<TABLE>
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">아이디</TD>
					<TD><input name="member_id" type="text" size="20" /></TD>
				</TR>
				<TR class="solid_line">
					<TD class="fixed_join">비밀번호</TD>
					<TD><input name="member_pw" type="password" size="20" /></TD>
				</TR>
			</TBODY>
		</TABLE>
		<br><br>
		<input type="hidden" name="command" value="action_login" /> 
		<INPUT	type="submit" value="로그인"> 
		<INPUT type="button" value="초기화">
		
		<Br><br>
		
		   <a href="#">아이디 찾기</a>  | 
					   <a href="#">비밀번호 찾기</a> | 
					   <a href="<%=request.getContextPath() %>/member/member.do?command=member_join_page">회원가입</a>    | 
					   <a href="#">고객 센터</a>
					   
	</form>		
</body>
</html>