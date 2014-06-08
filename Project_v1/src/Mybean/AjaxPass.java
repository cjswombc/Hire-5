package Mybean;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxPass extends HttpServlet{

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
		// 사용자가 입력한 패스워드를 가져옴
		String Pass=req.getParameter("pass");
		//출력을 위해서 설정
		PrintWriter out = resp.getWriter();
		resp.setHeader("Cache-Control", "no-cache");
		if(Pass.length()>4){
			out.println("사용가능");
		}
		else if(Pass.length()<=4){
			out.println("사용 불가");
		}	
	}
}
