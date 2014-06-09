<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="dao" class="Mybean.RegistDao"/>
<jsp:useBean id="dto" class="Mybean.RegistDto"/>
<%

request.setCharacterEncoding("EUC-KR");
response.setCharacterEncoding("EUC-KR");

String id = request.getParameter("log_id");
String pw = request.getParameter("log_pw");

System.out.println("서블릿");

dto = dao.logIn(id, pw);

// 아이디, 패스워드 대용
String admin ="admin";
String pass = "1111";

// 로그인 되었을 경우
if(id.equals(dto.getId())&&pw.equals(dto.getPass())){
	session = request.getSession();
	session.setAttribute("s_id", dto.getId());
	session.setAttribute("s_pw", dto.getPass());
	session.setAttribute("s_name", dto.getName());
	
	// Action_login으로 보내주는 데이터
	response.sendRedirect("Action.jsp");
}
// 로그인 시 아이디 또는 비밀번호가 틀렸을 시
else if(id!=dto.getId()||pw!=dto.getPass()){
	out.println("<script>");
	out.println("alert('아이디 또는 비밀번호를 확인하세요.');");
	out.println("history.back();");
	out.println("</script>");
	return;
}
%>