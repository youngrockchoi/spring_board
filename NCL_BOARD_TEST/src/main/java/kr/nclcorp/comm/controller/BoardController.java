package kr.nclcorp.comm.controller;

import java.util.List;

import javax.swing.border.Border;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.nclcorp.comm.service.BoardService;
import kr.nclcorp.comm.vo.BoardVO;
import kr.nclcorp.comm.vo.PaginationVO;

@Controller
public class BoardController {
	private Logger logger = LoggerFactory.getLogger(this.getClass().getPackage().getName());
	
	
	@Autowired
	private BoardService boardService;
	
	
	
	//리스트 페이지
	@GetMapping(value = "/list")
	public String list(Model model, BoardVO boardVO) {
		logger.info("========= 리스트 페이지 ========= ");
		
		//게시판 페이징
		int listCnt = boardService.selBoardListCnt(boardVO);
		PaginationVO paginationVO = new PaginationVO(listCnt, boardVO.getPageIndex(), 10);
		boardVO.setFirstIndex(paginationVO.getStartIndex());
		boardVO.setPageSize(paginationVO.getPageSize());
		model.addAttribute("paginationVO", paginationVO);
		
		//게시판 리스트 
		 List<BoardVO> boardListVO = boardService.selBoardList(boardVO);
		 model.addAttribute("boardListVO", boardListVO);
		
		return "board/list";
	}
	
	
	
	//상세 페이지
	@GetMapping(value = "/detail/{id}")
	public String detail(@PathVariable("id") Integer id,  Model model) {
		logger.info("========= 상세 페이지 ========= ");
		
		
		BoardVO boardVO = new BoardVO();
		boardVO.setIdx(id);
		
		//게시판 상세
		BoardVO boardDetailVO = boardService.selBoardDetail(boardVO);
		model.addAttribute("boardDetailVO", boardDetailVO);
		return "board/detail";
	}
	
	
	//등록페이지
	@GetMapping(value = "/insert")
	public String insert(Model model, BoardVO boardVO) {
		logger.info("========= 등록페이지 ========= ");
		return "board/insert";
	}
	
	
	
	//수정페이지
	@GetMapping(value = "/update/{id}")
	public String update(@PathVariable("id") Integer id, Model model) {
		logger.info("========= 수정 페이지 ========= ");
	
		BoardVO boardVO = new BoardVO();
		boardVO.setIdx(id);
		
		BoardVO boardDetailVO = boardService.selBoardDetail(boardVO);
		model.addAttribute("boardDetailVO", boardDetailVO);
		return "board/update";
	}
	
	
	//등록
	@PostMapping(value = "/insBoard")
	public String insBoard(Model model, BoardVO boardVO) {
		logger.info("========= 등록 ========= ");
		int result = boardService.insBoard(boardVO);
		return "redirect:list";
	}
	
	
	//삭제
	@PostMapping(value = "/delBoard")
	public String delBoard(Model model, BoardVO boardVO) {
		logger.info("========= 삭제 ========= ");
		int result = boardService.delBoard(boardVO);
		return "redirect:list";
	}
	
	
	//수정
	@PostMapping(value = "/udtBoard")
	public String udtBoard(Model model, BoardVO boardVO) {
		logger.info("========= 수정 ========= ");
		System.out.println(boardVO.toString());
		int result = boardService.udtBoard(boardVO);
		return "redirect:detail/" + boardVO.getIdx();
	}
	
	
	
}
