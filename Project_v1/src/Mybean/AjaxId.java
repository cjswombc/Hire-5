package Mybean;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxId extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		// ���� ���ڵ�
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		// servlet���� id ���� �޾ƿ�
		String id = req.getParameter("id");
		PrintWriter out = resp.getWriter();
		
		resp.setHeader("Cache-Control", "no-cache");
		/*// db connection
		RegistDao dao = new RegistDao();
		
		// Vector list�� �����͸� ����
		Vector list = dao.ReadId();*/
		
		Vector list = new Vector();
		
		// �ӽ÷� ������ �غý��ϴ�.
		list.add("admin");
		list.add("cjswombc");
		
		
		// �ӽ� �����
		String value = "";
		System.out.println("���̵� ��:"+id);
		// ����Ʈ�� ����� ������ ��ŭ �ݺ� ���� �� ������ �����ͼ� value�� ����
		for(int i=0; i<list.size();i++){
			value = (String)list.get(i);
			// ���� ���� ���� value ���� ���ٸ�
		}
		// ���̵� �ߺ���
		if(id.equals(value)||id==value){
			out.println("�̹� �ִ� ���̵��Դϴ�.");
		}
		// ���̵� ����� ������
		else if(id!=value){
			out.println("��� ������ ���̵��Դϴ�.");
		}
	}	
}
