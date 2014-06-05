<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="Mybean.RegistDao"/>
<jsp:useBean id="dto" class="Mybean.RegistDto"/>
<jsp:setProperty property="*" name="dto"/>

<%
	//setter메서드 12개를 호출해서 넘어
	dao.insertBoard(dto);
	response.sendRedirect("Action.jsp");
%>