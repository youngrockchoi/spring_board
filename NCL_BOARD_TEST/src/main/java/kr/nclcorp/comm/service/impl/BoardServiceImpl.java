package kr.nclcorp.comm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.nclcorp.comm.dao.BoardDao;
import kr.nclcorp.comm.service.BoardService;
import kr.nclcorp.comm.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao boardDao;
	
	//게시판 리스트 페이징
	@Override
	public int selBoardListCnt(BoardVO boardVO) {
		return boardDao.selBoardListCnt(boardVO);
	}
	
	
	//게시판 리스트 
	@Override
	public List<BoardVO> selBoardList(BoardVO boardVO) {
		return boardDao.selBoardList(boardVO);
	}

	//게시판 상세
	@Override
	public BoardVO selBoardDetail(BoardVO boardVO) {
		return boardDao.selBoardDetail(boardVO);
	}

	//등록
	@Override
	public int insBoard(BoardVO boardVO) {
		return boardDao.insBoard(boardVO);
	}

	//삭제
	@Override
	public int delBoard(BoardVO boardVO) {
		return boardDao.delBoard(boardVO);
	}

	//수정
	@Override
	public int udtBoard(BoardVO boardVO) {
		return boardDao.udtBoard(boardVO);
	}

}
