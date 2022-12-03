package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class AuthenFilter implements Filter{

	@Override
	public void destroy() {
		System.out.println("Filter01 해제!!");
	}
	//필터를 리소스에 적용하도록 dofilter() 메소드를 작성한다.
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Filter01.jsp 수행...!");
		// 요청 jsp페이지에서 한글 처리하지 않고, Filter에서 미리 한글 처리 진행
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		
		// 폼페이지에서 전송된 요청 파라미터가 없으면 응답 웹 페이지에 메세지를 출력하도록
		// 응답 웹 페이지에 대한 문자 인코딩, 컨텐츠유형, 메세지 등을 작성한다
		if(name == null || name.equals("")) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			String message = "입력된 name값은 null입니다";
			writer.print(message);
			return; // 요청 url로 넘어가지 않고 해당 필터에서 응답 페에지가 결과로 나간다.
		}
		// 연속적으로 필터가 있으면 다음 필터로 제어를 넘기ㄹ도록 FilterChain객체 타입의 doFilter()메소드를 작성한다.-+
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("Filter 01 초기화...");
		
	}

}
