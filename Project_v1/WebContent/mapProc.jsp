<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="dao" class="Mybean.BoardDao" />
<jsp:useBean id="dto" class="Mybean.BoardDto" />
<jsp:setProperty property="*" name="dto" />
<%
	response.setCharacterEncoding("euc-kr");
	request.setCharacterEncoding("euc-kr");

/* 	System.out.println(dto.getTitle());
	System.out.println(dto.getContent());
	System.out.println(dto.getAddr()); */
	dao.WriteBoard(dto);
	response.sendRedirect("map.jsp");
%>