package com.choong.spr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choong.spr.domain.BoardDto;
import com.choong.spr.service.Ex01Service;

@Controller
@RequestMapping("ex01")
public class Ex01Controller {
	// prefix : /WEB-INF/views/
	// suffix : .jsp
	
	@Autowired
	private Ex01Service service;
	
	@GetMapping("board/list")
	public void boardList(Model model) {
		List<BoardDto> list = service.boardList();
		
		model.addAttribute("boardList", list);
	}
	
	@GetMapping("board/{id}")
	public String getBoard(@PathVariable("id")int id, Model model) {
		BoardDto board = service.getBoardById(id);
		
		model.addAttribute("board", board);
		
		return "/ex01/board/get";
	}
}
