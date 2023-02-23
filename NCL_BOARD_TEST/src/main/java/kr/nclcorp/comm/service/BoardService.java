package kr.nclcorp.comm.service;

import java.util.List;

import kr.nclcorp.comm.vo.BoardVO;

public interface BoardService {
	
	//게시판 페이징
	int selBoardListCnt(BoardVO boardVO);
	
	
	//게시판 리스트 
	List<BoardVO> selBoardList(BoardVO boardVO);

	//게시판 상세
	BoardVO selBoardDetail(BoardVO boardVO);

	//등록
	int insBoard(BoardVO boardVO);

	//삭제
	int delBoard(BoardVO boardVO);

	//수정
	int udtBoard(BoardVO boardVO);

}
