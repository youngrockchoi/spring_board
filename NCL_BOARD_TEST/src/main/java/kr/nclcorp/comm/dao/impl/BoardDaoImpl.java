package kr.nclcorp.comm.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.nclcorp.comm.dao.BoardDao;
import kr.nclcorp.comm.vo.BoardVO;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	protected SqlSessionTemplate sqlSession;
	
	
	//게시판 리스트 페이징
	@Override
	public int selBoardListCnt(BoardVO boardVO) {
		return sqlSession.selectOne("selBoardListCnt", boardVO);
	}
	
	
	//게시판 리스트 
	@Override
	public List<BoardVO> selBoardList(BoardVO boardVO) {
		return sqlSession.selectList("selBoardList", boardVO);
	}


	//게시판 상세
	@Override
	public BoardVO selBoardDetail(BoardVO boardVO) {
		return sqlSession.selectOne("selBoardDetail", boardVO);
	}


	//등록
	@Override
	public int insBoard(BoardVO boardVO) {
		return sqlSession.insert("insBoard", boardVO);
	}


	//삭제
	@Override
	public int delBoard(BoardVO boardVO) {
		return sqlSession.insert("delBoard", boardVO);
	}


	//수정
	@Override
	public int udtBoard(BoardVO boardVO) {
		return sqlSession.insert("udtBoard", boardVO);
	}

	
}
