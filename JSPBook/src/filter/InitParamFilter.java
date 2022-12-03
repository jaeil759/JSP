package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class InitParamFilter implements Filter{
	
	private FilterConfig filterConfig = null;
	
	@Override
	public void destroy() {
		System.out.println("filter02 해제");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter02 수행...!");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String param1 = filterConfig.getInitParameter("param1");
		String param2 = filterConfig.getInitParameter("param2");
		
		// 내가 입력한 아이디 비밀번호가 admin/1234 이면 로그인을 성공했다는 메세지를 출력
		// 그렇지 않았을 때, 로그인 실패했습니다는 메세지를 출력
		
		String message;
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if(id.equals(param1) && pw.equals(param2)) {
			message = "로그인 성공했습니다";
		}else {
			message = "로그인 실패햇씁니다";
		}
		writer.println(message);
		
		chain.doFilter(request, response);	
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter02 초기화....!");
		this.filterConfig = filterConfig;
	}

}
