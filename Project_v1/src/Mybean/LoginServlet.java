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
		// ���� ���ڵ�
		req.setCharacterEncoding("EUC-KR");
		resp.setCharacterEncoding("EUC-KR");
		
		PrintWriter out = resp.getWriter();
		/*RegistDao dao = new RegistDao();
		Vector list = dao.getBoard();
		RegistDto dto;*/
		
		// id, pw�� Action���� ���� �Ѿ�� �� ����
		String id = req.getParameter("log_id");
		String pw = req.getParameter("log_pw");
		System.out.println(id);
		
		/*for(int i=0;i<list.size();i++){
		dto = (RegistDto)list.get(i);
		System.out.println(dto.getId());*/
		
		// ���̵�, �н����� ���
		String admin ="admin";
		String pass = "1111";
		
			// �α��� �Ǿ��� ���
			if(id.equals(admin)&&pw.equals(pass)){
				HttpSession session = req.getSession();
				session.setAttribute("s_id", admin);
				session.setAttribute("s_pw", pass);
				
				// Action_login���� �����ִ� ������
				RequestDispatcher view = req.getRequestDispatcher("Action_login.jsp");
				view.forward(req, resp);
				// Blog�� �����ִ� ������
				RequestDispatcher view1 = req.getRequestDispatcher("blog.jsp");
				view1.forward(req, resp);				
				// Map���� �����ִ� ������
				RequestDispatcher view2 = req.getRequestDispatcher("map.jsp");
				view2.forward(req, resp);
			}
			// �α��� �� ���̵� �Ǵ� ��й�ȣ�� Ʋ���� ��
			else if(id!=admin||pw!=pass){
				out.println("<script>");
				out.println("alert('���̵� �Ǵ� ��й�ȣ�� Ȯ���ϼ���.');");
				out.println("history.back();");
				out.println("</script>");
				return;
			}
		}
	}	

