package Mybean;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 문자 인코딩
		req.setCharacterEncoding("EUC-KR");
		resp.setCharacterEncoding("EUC-KR");
		
		PrintWriter out = resp.getWriter();
		/*RegistDao dao = new RegistDao();
		Vector list = dao.getBoard();
		RegistDto dto;*/
		
		// id, pw에 Action으로 부터 넘어온 값 저장
		String id = req.getParameter("log_id");
		String pw = req.getParameter("log_pw");
		System.out.println(id);
		
		/*for(int i=0;i<list.size();i++){
		dto = (RegistDto)list.get(i);
		System.out.println(dto.getId());*/
		
		// 아이디, 패스워드 대용
		String admin ="admin";
		String pass = "1111";
		
			// 로그인 되었을 경우
			if(id.equals(admin)&&pw.equals(pass)){
				HttpSession session = req.getSession();
				session.setAttribute("s_id", admin);
				session.setAttribute("s_pw", pass);
				
				// Action_login으로 보내주는 데이터
				RequestDispatcher view = req.getRequestDispatcher("Action_login.jsp");
				view.forward(req, resp);
				// Blog로 보내주는 데이터
				RequestDispatcher view1 = req.getRequestDispatcher("blog.jsp");
				view1.forward(req, resp);				
				// Map으로 보내주는 데이터
				RequestDispatcher view2 = req.getRequestDispatcher("map.jsp");
				view2.forward(req, resp);
			}
			// 로그인 시 아이디 또는 비밀번호가 틀렸을 시
			else if(id!=admin||pw!=pass){
				out.println("<script>");
				out.println("alert('아이디 또는 비밀번호를 확인하세요.');");
				out.println("history.back();");
				out.println("</script>");
				return;
			}
		}
	}	

