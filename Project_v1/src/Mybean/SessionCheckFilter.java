package Mybean;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionCheckFilter implements Filter{
	//그냥 단순한 생성자
	public void SessionCheckFilter(){}
	
	private static int firstRequest = 0;
	 
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			 throws IOException, ServletException{
		 System.out.println("실행됨?");
		 HttpServletRequest hreq = (HttpServletRequest)req;
		 HttpServletResponse hresp = (HttpServletResponse)resp;
		 
		 HttpSession session = hreq.getSession();
		 
		 //session이 처음 생성 되었다면
		 if(session.isNew()){
			 if(firstRequest==0){
				 firstRequest++;
			 }
			 else{
				hresp.sendRedirect("Action.jsp");
				return;
			 }
		 }
		 chain.doFilter(req, resp);
	 }

	 public void init(FilterConfig filterConfig) throws ServletException {}


	 public void destroy() {}

}
