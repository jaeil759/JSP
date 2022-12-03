package ch18.com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch18.com.model.LoginBean;

/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("/ControllerServlet")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		LoginBean loginBean = new LoginBean();
		loginBean.setId(id);
		loginBean.setPassword(pw);
		request.setAttribute("bean", loginBean);
		
		// 비밀번호가 admin  일경우 인증이 완료되고,
		// true 라는 상태값을 리턴받는다
		boolean status = loginBean.validation();
		
		if(status) {
			RequestDispatcher rd = request.getRequestDispatcher("mvc_success.jsp");
			rd.forward(request, response);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("mvc_error.jsp");
			rd.forward(request, response);
		}
		
		
	}

}
