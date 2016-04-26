<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<c:choose>
<c:when test='${modified_personal_info==true }'>
<script>
window.onload=function()
{
  test();
}

function test(){
	init();
	alert("ȸ�� ������ �����Ǿ����ϴ�.");
}
function init(){
	var frm_mod_member=document.frm_mod_member;
	var h_tel1=frm_mod_member.h_tel1;
	var h_hp1=frm_mod_member.h_hp1;
	var tel1=h_tel1.value;
	var hp1=h_hp1.value;
	
	var select_tel1=frm_mod_member.tel1;
	var select_hp1=frm_mod_member.hp1;
	select_tel1.value=tel1;
	select_hp1.value=hp1;
}

</script>
</c:when>
<c:otherwise>
<script>
window.onload=function()
{
  test();
}

function test(){
	init();
	//alert("ȸ�� ������ �����Ǿ����ϴ�.");
//	init();
}
function init(){
	var frm_mod_member=document.frm_mod_member;
	var h_tel1=frm_mod_member.h_tel1;
	var h_hp1=frm_mod_member.h_hp1;
	var tel1=h_tel1.value;
	var hp1=h_hp1.value;
	
	var select_tel1=frm_mod_member.tel1;
	var select_hp1=frm_mod_member.hp1;
	select_tel1.value=tel1;
	select_hp1.value=hp1;
}
</script>
</c:otherwise>
</c:choose>
 <script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
                var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('zipcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('roadAddress').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;

                // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
                if(data.autoRoadAddress) {
                    //����Ǵ� ���θ� �ּҿ� ������ �ּҸ� �߰��Ѵ�.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
</head>

<%-- <body onLoad="init('${member_info.tel1 }','${member_info.hp1 }')"> --%>
<body>
	<H3>�ʼ��Է»���</H3>
<form name="frm_mod_member" action="<%=request.getContextPath()%>/mine/mine.do" method="post">	
	<DIV id="detail_table">
		<TABLE>
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">���̵�</TD>
					<TD>
						<input name="member_id" type="text" size="20" value="${member_info.member_id }"  disabled/>
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">��й�ȣ</TD>
					<TD>
					  <input name="member_pw" type="password" size="20" value="${member_info.member_pw }" />
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">�̸�</TD>
					<TD>
					  <input name="member_name" type="text" size="40" value="${member_info.member_name }"  disabled />
					 </TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">����</TD>
					<TD>
					  <c:choose >
					    <c:when test="${member_info.member_gender =='101' }">
					      <input type="radio" name="member_gender" value="102" />
						  ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					   <input type="radio" name="member_gender" value="101" checked />����
					    </c:when>
					    <c:otherwise>
					      <input type="radio" name="member_gender" value="102"  checked />
						   ����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					      <input type="radio" name="member_gender" value="101"  />����
					   </c:otherwise>
					   </c:choose>
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">�����������</TD>
					<TD><select name="member_birth_y">
					     <c:forEach var="i" begin="1" end="100">
					       <c:choose>
					         <c:when test="${member_info.member_birth_y==1920+i }">
							   <option value="${ 1920+i}" selected>${ 1920+i} </option>
							</c:when>
							<c:otherwise>
							  <option value="${ 1920+i}" >${ 1920+i} </option>
							</c:otherwise>
							</c:choose>
					   	</c:forEach>
					</select>�� 
					<select name="member_birth_m" >
						<c:forEach var="i" begin="1" end="12">
					       <c:choose>
					         <c:when test="${member_info.member_birth_m==i }">
							   <option value="${i }" selected>${i }</option>
							</c:when>
							<c:otherwise>
							  <option value="${i }">${i }</option>
							</c:otherwise>
							</c:choose>
					   	</c:forEach>
					</select>�� 
					
					<select name="member_birth_d">
							<c:forEach var="i" begin="1" end="31">
					       <c:choose>
					         <c:when test="${member_info.member_birth_d==i }">
							   <option value="${i }" selected>${i }</option>
							</c:when>
							<c:otherwise>
							  <option value="${i }">${i }</option>
							</c:otherwise>
							</c:choose>
					   	</c:forEach>
					</select>�� 
					
					   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					   <c:choose>
					    <c:when test="${member_info.member_birth_gn=='2' }"> 
					  <input type="radio" name="member_birth_gn" value="2" checked />���
						&nbsp;&nbsp;&nbsp; 
						<input type="radio"  name="member_birth_gn" value="1" />����
						</c:when>
						<c:otherwise>
						  <input type="radio" name="member_birth_gn" value="2" />���
						   &nbsp;&nbsp;&nbsp; 
						<input type="radio"  name="member_birth_gn" value="1" checked  />����
						</c:otherwise>
						</c:choose>
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">��ȭ��ȣ</TD>
					 
					<TD><select  name="tel1" >
							<option>����</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="044">044</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
							<option value="0502">0502</option>
							<option value="0503">0503</option>
							<option value="0505">0505</option>
							<option value="0506">0506</option>
							<option value="0507">0507</option>
							<option value="0508">0508</option>
							<option value="070">070</option>
					</select> 
					    - <input type="text" name="tel2" value="${member_info.tel2 }"> 
					    - <input type="text" name="tel3" value="${member_info.tel3 }">
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">�޴�����ȣ</TD>
					<TD><select  name="hp1">
							<option>����</option>
							<option selected value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select> 
					 - <input type="text" name="hp2" value="${member_info.hp2 }"> 
					 - <input type="text"name="hp3" value="${member_info.hp3 }"><br> <br>
					 <c:choose> 
					   <c:when test="${member_info.smsSts_yn=='Y' }">
					     <input type="checkbox"  name="smssts_yn" value="Y" checked /> ���θ����� �߼��ϴ� SMS �ҽ��� �����մϴ�.
						</c:when>
						<c:otherwise>
						  <input type="checkbox"  name="smssts_yn" value="Y"  /> ���θ����� �߼��ϴ� SMS �ҽ��� �����մϴ�.
						</c:otherwise>
					 </c:choose>	
				    </TD>
						
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">�̸���(e-mail)</TD>
					<TD>
					   <input type="text" name="email1" value="${member_info.email1 }" /> @ <input type="text"  name="email2" value="${member_info.email2 }" /> 
					   <select name="email2" onChange=""  title="�����Է�">
							<option value="non">�����Է�</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="naver.com">naver.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="paran.com">paran.com</option>
							<option value="nate.com">nate.com</option>
							<option value="google.com">google.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="empal.com">empal.com</option>
							<option value="korea.com">korea.com</option>
							<option value="freechal.com">freechal.com</option>
					</select><Br><br> 
					<c:choose> 
					   <c:when test="${member_info.emailSts_yn=='Y' }">
					     <input type="checkbox" name="emailsts_yn"  value="Y" checked /> ���θ����� �߼��ϴ� e-mail�� �����մϴ�.
						</c:when>
						<c:otherwise>
						  <input type="checkbox" name="emailsts_yn"  value="Y"  /> ���θ����� �߼��ϴ� e-mail�� �����մϴ�.
						</c:otherwise>
					 </c:choose>
					</TD>
				</TR>
				<TR class="dot_line">
					<TD class="fixed_join">�ּ�</TD>
					<TD>
					   <input type="text" id="zipcode" name="zipcode" size="10" value="${member_info.zipcode }" > <a href="javascript:execDaumPostcode()">�����ȣ�˻�</a>
					  <br>
					  <p> 
					   ���� �ּ�:<br><input type="text" id="roadAddress"  name="roadAddress" size="50" value="${member_info.roadAddress }"><br><br>
					  ���θ� �ּ�: <input type="text" id="jibunAddress" name="jibunAddress" size="50" value="${member_info.jibunAddress }"><br><br>
					  ������ �ּ�: <input type="text"  name="namujiAddress" size="50" value="${member_info.namujiAddress }" />
					   <span id="guide" style="color:#999"></span>
					   </p>
					</TD>
				</TR>


			</TBODY>
		</TABLE>
		</DIV>
		<DIV class="clear">
		<br><br>
		<table align=center>
		<tr >
			<td >
				<input type="hidden" name="command"  value="modify_my_info" /> 
				<INPUT name="btn_mod_member" type="submit"  value="ȸ�� ���� ����">
				<INPUT name="btn_cancel_member" type="button"  value="���� ���">
			</td>
		</tr>
	</table>
	</DIV>
	<input  type="hidden" name="h_tel1" value="${member_info.tel1}" />
	<input  type="hidden" name="h_hp1" value="${member_info.hp1}" />		
</form>	

</body>
</html>
