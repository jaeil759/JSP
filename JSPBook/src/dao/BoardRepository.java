package dao;

import java.util.ArrayList;

import dto.BoardVO;


public class BoardRepository {
	private int cnt = 0;
	private ArrayList<BoardVO> BoardList = new ArrayList<BoardVO>();
	private static BoardRepository instance = new BoardRepository();
	public static BoardRepository getInstance() {
		return instance;
	}
	
	public ArrayList<BoardVO> getBoardList() {
		return BoardList;
	}
	public BoardRepository() {
		BoardVO board = new BoardVO();
		board.setBo_id("jaeil759");
		board.setBo_title("게시판하기싫어");
		board.setBo_content("집에가고싶다");
		board.setBo_writer("감옥");
		board.setBo_date("2022-11-09");
		board.setBo_hit("0");
		
		BoardList.add(board);
	}
	
	public BoardVO getBoardById(String bo_id) {
		BoardVO boardById = null;
		
		for(int i = 0; i < BoardList.size(); i++) {
			BoardVO boardvo = BoardList.get(i);
			if(boardvo != null && boardvo.getBo_id() != null) {
				boardById = boardvo;
			}
		}
		return boardById;
	}
	
	public void addBoard(BoardVO boardvo) {
		BoardList.add(boardvo);
	}

	public int clickcount() {
		cnt ++;
		return cnt;
	}
}
