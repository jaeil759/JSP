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

import ch18.com.model.NoticeDAO;
import ch18.com.model.NoticeVO;


/**
 * Servlet implementation class NoticeBoardController
 */
@WebServlet("/NoticeBoardController")
public class NoticeBoardController extends HttpServlet {
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
	      if(command.equals("/ch18/test/notice/form.do")) {
	          RequestDispatcher rd = request.getRequestDispatcher("/ch18/test/notice/writeForm.jsp");
	          rd.forward(request, response);
	       }else if(command.equals("/ch18/test/notice/insert.do")) {
	    	   requestNoticeWrite(request);
	          response.sendRedirect(contextPath + "/ch18/test/notice/list.do");
	       }else if(command.equals("/ch18/test/notice/list.do")){
	          requestNoticeList(request);
	          RequestDispatcher rd = request.getRequestDispatcher("/ch18/test/notice/list.jsp");
	          rd.forward(request, response);
	       }
	}
	
	//게시글 등록 처리
	public void requestNoticeWrite(HttpServletRequest request) {
		NoticeDAO dao = NoticeDAO.getInstance();
		NoticeVO notice = new NoticeVO();
		notice.setBo_title(request.getParameter("title"));
		notice.setBo_content(request.getParameter("content"));
		notice.setBo_writer(request.getParameter("writer"));
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss");
		String rDay = formatter.format(new Date());
		notice.setBo_date(rDay);
		notice.setBo_hit(0);
		dao.insertBoard(notice);
		System.out.println(notice);
	}
	
	// 게시글 목록 처리
	public void requestNoticeList(HttpServletRequest request) {
		NoticeDAO dao = NoticeDAO.getInstance();
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		noticeList = dao.getNoticeList();
		request.setAttribute("noticeList", noticeList);
		
	}
	

}
