package Mybean;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		RegistDao dao = new RegistDao();
		Vector list = dao.getBoard();
		RegistDto dto;
		String id = req.getParameter("log_id");
		String pw = req.getParameter("log_pw");
		System.out.println(id);
		for(int i=0;i<list.size();i++){
		dto = (RegistDto)list.get(i);
		System.out.println(dto.getId());
			if(id.equals(dto.getId())&&pw.equals(dto.getPass())){
				RequestDispatcher view = req.getRequestDispatcher("Action.jsp");
				view.forward(req, resp);
			}else{
				out.println("<script>");
				out.println("alert('check.');");
				out.println("history.back();");
				out.println("</script>");
				return;
			}
		}
	}	
}
