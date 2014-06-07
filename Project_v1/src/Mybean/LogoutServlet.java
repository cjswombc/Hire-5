package Mybean;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession(false);
		
		String id = (String)session.getAttribute("s_id");
		System.out.println(id);
		session.invalidate();
		
		
		resp.setHeader("Pragma","no-cache");
		resp.setHeader("Cache-Control","no-cache");
		resp.addHeader("Cache-Control","no-store");
		resp.setDateHeader("Expires", 0);
		System.out.println(id);
		resp.sendRedirect("Action.jsp");
	}
}
