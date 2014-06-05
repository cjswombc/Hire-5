package Mybean;

import java.io.IOException;

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
		
		RegistDto dto = new RegistDto();
		
		dto.getId();
		dto.getPass();
		
		req.getParameter("log_id");
		req.getParameter("log_pw");
		
		
		
		
		RequestDispatcher view = req.getRequestDispatcher("Action.jsp");		
		view.forward(req, resp);	
	}	
}
