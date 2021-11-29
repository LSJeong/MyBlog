package co.lsj.blog.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.lsj.blog.board.service.BoardMapper;
import co.lsj.blog.board.service.BoardService;
import co.lsj.blog.board.service.BoardVO;

@Repository("boardDao")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper map;
	
	@Override
	public List<BoardVO> boardList() {
		return map.boardList();
	}

	@Override
	public BoardVO boardSelect(BoardVO vo) {
		return map.boardSelect(vo);
	}

	@Override
	public int boardInsert(BoardVO vo) {
		return map.boardInsert(vo);
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		return map.boardUpdate(vo);
	}

	@Override
	public int boardDelete(int no) {
		return map.boardDelete(no);
	}

	@Override
	public List<BoardVO> boardSearchList(String searchKey) {
		return map.boardSearchList(searchKey);
	}

}
