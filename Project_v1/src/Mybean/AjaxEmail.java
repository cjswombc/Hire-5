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
		
		// 사용자로부터 전해 받은 email
		String email = req.getParameter("email");
		
		// 출력을 위한 도구
		PrintWriter out = resp.getWriter();
		
/*		// db connection
		RegistDao dao = new RegistDao();
				
		// Vector list로 데이터를 저장
		Vector list = (Vector)dao.ReadEmail();
*/			
		resp.setHeader("Cache-Control", "no-cache");
		// 예시--- 지워도 됩니다.
		Vector list = new Vector();
		list.add("cjswombc1@naver.com");
		list.add("1212@naver.com");
		
		// 임시 저장소
		String value = "";
				
		// 리스트에 담겨진 사이즈 만큼 반복 돌린 후 데이터 꺼내와서 value에 저장
		for(int i=0; i<list.size();i++){
		value = (String)list.get(i);
		// 전달 받은 값과 value 값이 같다면
		}
		
		if(isEmail(email)){
				// Email이 중복됨
		if(email.equals(value)||email==value){
		out.println("이미 사용하고 있는 이메일입니다.");
		}
		// 아이디 사용이 가능함
		else if(email!=value){
		out.println("사용 가능한 이메일입니다.");
		}
		}
	}
	
	// 이메일 유효성 검사
	public static boolean isEmail(String email) {
        if (email==null) return false;
        boolean b = Pattern.matches("[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+",email.trim());
        return b;
    } 
}
