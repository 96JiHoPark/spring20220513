package com.choong.spr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choong.spr.domain.ReplyDto;
import com.choong.spr.service.Ex02Service;

@Controller
@RequestMapping("ex02")
public class Ex02Controller {
	
	@Autowired
	private Ex02Service service;

	
	@RequestMapping("reply/insert")
	public String insertReply(ReplyDto replyDto) {
		
		boolean success = service.insertReply(replyDto);
		
		return "redirect:/ex01/board/" + replyDto.getBoardId();
	}
	
	
	@PostMapping("reply/modify")
	public String modifyReply(ReplyDto replyDto) {
		boolean success = service.modifyReply(replyDto);
		
		return "redirect:/ex01/board/" + replyDto.getBoardId();
	}
	
	
	
	@PostMapping("reply/delete")
	public String deleteReply(ReplyDto replyDto) {
		boolean success = service.deleteReply(replyDto);
		
		return "redirect:/ex01/board/" + replyDto.getBoardId();
	}
	
}
