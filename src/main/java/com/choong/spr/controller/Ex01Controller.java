package com.choong.spr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.choong.spr.domain.BoardDto;
import com.choong.spr.domain.PageDto;
import com.choong.spr.domain.ReplyDto;
import com.choong.spr.service.Ex01Service;
import com.choong.spr.service.Ex02Service;

@Controller
@RequestMapping("ex01")
public class Ex01Controller {
	// prefix : /WEB-INF/views/
	// suffix : .jsp
	
	@Autowired
	private Ex01Service service;
	
	@Autowired
	private Ex02Service replyService;
	
	
	@GetMapping("board/list")
	public void boardList(@RequestParam(name = "page", defaultValue = "1") int page, Model model) {
		
		int rowPerPage = 5;
		int totalRow = service.boardCount();
		
		PageDto pageDto = new PageDto();
		pageDto.setCurrent(page);
		pageDto.setTotalRow(totalRow);
		pageDto.setRowPerPage(rowPerPage);
				
		List<BoardDto> list = service.boardList(page, rowPerPage);
		
		model.addAttribute("pageInfo", pageDto);
		model.addAttribute("boardList", list);
	}
	
	
	@GetMapping("board/{id}")
	public String getBoard(@PathVariable("id")int id, Model model) {
		BoardDto board = service.getBoardById(id);
		
		List<ReplyDto> replyList = replyService.getReplyListByBoardId(id);
		
		model.addAttribute("board", board);
		model.addAttribute("replyList", replyList);
		
		return "/ex01/board/get";
	}
	
	
	@PostMapping("board/modify")
	public String modifyBoard(BoardDto boardDto, Model model) {
		boolean success = service.updateBoard(boardDto);
		
		model.addAttribute("boardModifySuccess", success);
		
		return "redirect:/ex01/board/" + boardDto.getId();
	}
	
	
	@PostMapping("board/remove")
	public String removeBoard(int id) {
		boolean success = service.deleteBoardById(id);
		
		return "redirect:/ex01/board/list";
	}
	
	@GetMapping("board/insert")
	public void insertBoard() {
		
	}
	
	@PostMapping("board/insert")
	public String insertBoardProcess(BoardDto boardDto) {
		boolean success = service.insertBoard(boardDto);
		
		return "redirect:/ex01/board/" + boardDto.getId();
	}
	
}
