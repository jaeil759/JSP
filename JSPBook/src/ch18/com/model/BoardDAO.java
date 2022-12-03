package ch18.com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ch18.com.dbconn.DBConnection;

public class BoardDAO {
	private static BoardDAO instance;
	private BoardDAO(){}
	public static BoardDAO getInstance(){
		if(instance == null) instance = new BoardDAO();
		return instance;
	}
	public void insertBoard(BoardVO boardVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			conn = DBConnection.getConnection();
			
			String sql = "INSERT INTO BOARD VALUES(SEQ_BOARD.NEXTVAL, ?,?,?,?,0)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardVO.getB_title());
			pstmt.setString(2, boardVO.getB_content());
			pstmt.setString(3, boardVO.getB_writer());
			pstmt.setString(4, boardVO.getB_date());
		} catch (Exception e) {
			System.out.println("insertBoard() 에러 : " + e);
		}finally {
			try {
	               if(pstmt != null) pstmt.close();	
	               if(conn != null) conn.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
	public ArrayList<BoardVO> getBoardList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from board order by b_no desc";
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs =pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO board = new BoardVO();
				board.setB_no(rs.getString("B_NO"));
				board.setB_title(rs.getString("B_TITLE"));
				board.setB_content(rs.getString("B_CONTENT"));
				board.setB_writer(rs.getString("B_WRITER"));
				board.setB_date(rs.getString("B_DATE"));
				board.setB_hit(rs.getInt("B_HIT"));
				list.add(board);
			}
			return list;
		} catch (Exception e) {
			System.out.println("insertBoard() 에러 : " + e);
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();	
				if(conn != null) conn.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return null;
	}
}
