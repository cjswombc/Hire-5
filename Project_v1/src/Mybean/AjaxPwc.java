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
		
		// ����ڰ� ������ �� ��
		String pass = req.getParameter("pass");
		String pwc = req.getParameter("pwc");
		
		// ����� ���� ����
		PrintWriter out = resp.getWriter();
		// ĳ�ô� ������ �ʽ��ϴ�.
		resp.setHeader("Cache-Control", "no-cache");
		// ��
		if(pass.equals(pwc)||pass==pwc){
			out.println("�н����尡 �����ϴ�.");
		}
		else{
			out.println("�н����尡 �ٸ��ϴ�.");
		}
	}
}
