<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="dao" class="Mybean.RegistDao"/>
<jsp:useBean id="dto" class="Mybean.RegistDto"/>
<jsp:setProperty property="*" name="dto"/>

<%
	//setter�޼��� 12���� ȣ���ؼ� �Ѿ�
	dao.insertBoard(dto);
	response.sendRedirect("Action.jsp");
%>