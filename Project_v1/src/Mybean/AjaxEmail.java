package Mybean;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxEmail extends HttpServlet{

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
		
		// ����ڷκ��� ���� ���� email
		String email = req.getParameter("email");
		
		// ����� ���� ����
		PrintWriter out = resp.getWriter();
		
/*		// db connection
		RegistDao dao = new RegistDao();
				
		// Vector list�� �����͸� ����
		Vector list = (Vector)dao.ReadEmail();
*/			
		resp.setHeader("Cache-Control", "no-cache");
		// ����--- ������ �˴ϴ�.
		Vector list = new Vector();
		list.add("cjswombc1@naver.com");
		list.add("1212@naver.com");
		
		// �ӽ� �����
		String value = "";
				
		// ����Ʈ�� ����� ������ ��ŭ �ݺ� ���� �� ������ �����ͼ� value�� ����
		for(int i=0; i<list.size();i++){
		value = (String)list.get(i);
		// ���� ���� ���� value ���� ���ٸ�
		}
		
		if(isEmail(email)){
				// Email�� �ߺ���
		if(email.equals(value)||email==value){
		out.println("�̹� ����ϰ� �ִ� �̸����Դϴ�.");
		}
		// ���̵� ����� ������
		else if(email!=value){
		out.println("��� ������ �̸����Դϴ�.");
		}
		}
	}
	
	// �̸��� ��ȿ�� �˻�
	public static boolean isEmail(String email) {
        if (email==null) return false;
        boolean b = Pattern.matches("[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+",email.trim());
        return b;
    } 
}
