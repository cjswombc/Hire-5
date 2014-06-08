package Mybean;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxPwc extends HttpServlet{

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
		
		// 사용자가 전달한 값 비교
		String pass = req.getParameter("pass");
		String pwc = req.getParameter("pwc");
		
		// 출력을 위한 도구
		PrintWriter out = resp.getWriter();
		// 캐시는 남기지 않습니다.
		resp.setHeader("Cache-Control", "no-cache");
		// 비교
		if(pass.equals(pwc)||pass==pwc){
			out.println("패스워드가 같습니다.");
		}
		else{
			out.println("패스워드가 다릅니다.");
		}
	}
}
