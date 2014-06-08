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
		
		// 문자 인코딩
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		// servlet으로 id 값을 받아옴
		String id = req.getParameter("id");
		PrintWriter out = resp.getWriter();
		
		resp.setHeader("Cache-Control", "no-cache");
		/*// db connection
		RegistDao dao = new RegistDao();
		
		// Vector list로 데이터를 저장
		Vector list = dao.ReadId();*/
		
		Vector list = new Vector();
		
		// 임시로 저장을 해봤습니다.
		list.add("admin");
		list.add("cjswombc");
		
		
		// 임시 저장소
		String value = "";
		System.out.println("아이디 값:"+id);
		// 리스트에 담겨진 사이즈 만큼 반복 돌린 후 데이터 꺼내와서 value에 저장
		for(int i=0; i<list.size();i++){
			value = (String)list.get(i);
			// 전달 받은 값과 value 값이 같다면
		}
		// 아이디가 중복됨
		if(id.equals(value)||id==value){
			out.println("이미 있는 아이디입니다.");
		}
		// 아이디 사용이 가능함
		else if(id!=value){
			out.println("사용 가능한 아이디입니다.");
		}
	}	
}
