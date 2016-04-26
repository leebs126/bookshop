<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>    
    <div id="sticky" >
	<UL>
		<LI><A href="#"><IMG
				width="24" height="24" src="<%=request.getContextPath() %>/image/facebook_icon.png">
				���̽���</A></LI>
		<LI><A href="#"><IMG
				width="24" height="24" src="<%=request.getContextPath() %>/image/twitter_icon.png">
				Ʈ����</A></LI>
		<LI><A href="#"><IMG
				width="24" height="24" src="<%=request.getContextPath() %>/image/rss_icon.png">
				RSS �ǵ�</A></LI>
	</UL>
	<DIV class="recent">
		<H3>�ֱ� �� ��ǰ</H3>
		  <UL>
		<!--   ��ǰ�� �����ϴ�. -->
		 <c:choose>
			<c:when test="${ empty sticky_goods_list }">
				     <STRONG>��ǰ�� �����ϴ�.</STRONG>
			</c:when>
			<c:otherwise>
		      <c:forEach var="item" items="${sticky_goods_list }">
		           <a href="<%=request.getContextPath()%>/goods/goods.do?command=goods_detail&goods_id=${item.goods_id }">
		  	         <IMG width="75" height="95" 
		                 src="<%=request.getContextPath()%>/download.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
		           </a>
		          <br>
		     </c:forEach>
		   </c:otherwise>
	      </c:choose>
		 </UL>
	</DIV>
</div>
</body>
</html>