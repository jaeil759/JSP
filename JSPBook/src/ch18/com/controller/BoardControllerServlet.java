package ch18.com.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch18.com.model.BoardDAO;
import ch18.com.model.BoardVO;

/**
 * Servlet implementation class BoardControllerServlet
 */
@WebServlet("/BoardControllerServlet")
public class BoardControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestUri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestUri.substring(contextPath.length());
		
		System.out.println(requestUri);
		System.out.println(contextPath);
		System.out.println(command);
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
	      if(command.equals("/ch18/form.do")) {
	          RequestDispatcher rd = request.getRequestDispatcher("/ch18/form01.jsp");
	          rd.forward(request, response);
	       }else if(command.equals("/ch18/insert.do")) {
	          requestBoardWrite(request);
	          response.sendRedirect(contextPath + "/ch18/list.do");
	       }else if(command.equals("/ch18/list.do")){
	          requestBoardList(request);
	          RequestDispatcher rd = request.getRequestDispatcher("/ch18/list01.jsp");
	          rd.forward(request, response);
	       }
	}
	
	//게시글 등록 처리
	public void requestBoardWrite(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO board = new BoardVO();
		board.setB_title(request.getParameter("title"));
		board.setB_content(request.getParameter("content"));
		board.setB_writer(request.getParameter("writer"));
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss");
		String rDay = formatter.format(new Date());
		board.setB_date(rDay);
		board.setB_hit(0);
		dao.insertBoard(board);
	}
	
	// 게시글 목록 처리
	public void requestBoardList(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		boardList = dao.getBoardList();
		request.setAttribute("boardList", boardList);
		
	}

}
