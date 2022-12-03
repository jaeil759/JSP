package ch18.com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ch18.com.dbconn.DBConnection;

public class NoticeDAO {
	private static NoticeDAO instance;
	private NoticeDAO(){}
	public static NoticeDAO getInstance(){
		if(instance == null) instance = new NoticeDAO();
		return instance;
	}
	public void insertBoard(NoticeVO NoticeVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			conn = DBConnection.getConnection();
			
			String sql = "INSERT INTO NOTICE VALUES(SEQ_NOTICE.NEXTVAL, ?,?,?,?,0)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, NoticeVO.getBo_title());
			pstmt.setString(2, NoticeVO.getBo_content());
			pstmt.setString(3, NoticeVO.getBo_writer());
			pstmt.setString(4, NoticeVO.getBo_date());
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
	public ArrayList<NoticeVO> getNoticeList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from NOTICE order by bo_no desc";
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs =pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeVO notice = new NoticeVO();
				notice.setBo_no(rs.getString("BO_NO"));
				notice.setBo_title(rs.getString("BO_TITLE"));
				notice.setBo_content(rs.getString("BO_CONTENT"));
				notice.setBo_writer(rs.getString("BO_WRITER"));
				notice.setBo_date(rs.getString("BO_DATE"));
				notice.setBo_hit(rs.getInt("BO_HIT"));
				list.add(notice);
			}
			return list;
			
		} catch (Exception e) {
			System.out.println("lsit() 에러 : " + e);
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
