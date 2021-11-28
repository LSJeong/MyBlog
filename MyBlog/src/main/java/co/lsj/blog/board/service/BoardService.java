package co.lsj.blog.board.service;

import java.util.List;

public interface BoardService {
	List<BoardVO> boardList();
	BoardVO boardSelect();
	int boardInsert(BoardVO vo);
	int boardUpdate(BoardVO vo);
	int boardDelete(int no);
	List<BoardVO> boardSearchList(String searchKey); //검색을 위한것
}
