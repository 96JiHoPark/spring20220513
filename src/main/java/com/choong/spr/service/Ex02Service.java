package com.choong.spr.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choong.spr.domain.ReplyDto;
import com.choong.spr.mapper.Ex02Mapper;

@Service
public class Ex02Service {

	@Autowired
	private Ex02Mapper mapper;
	
	public boolean insertReply(ReplyDto replyDto) {
		// replyDto.setInserted(LocalDateTime.now());
		
		int cnt = mapper.insertReply(replyDto);
		
		return cnt == 1;
	}

	public List<ReplyDto> getReplyListByBoardId(int id) {
		return mapper.selectReplyListByBoardId(id);
	}

	public boolean modifyReply(ReplyDto replyDto) {
		int cnt = mapper.updateReply(replyDto);
		
		return cnt == 1;
	}

	public boolean deleteReply(ReplyDto replyDto) {
		int cnt = mapper.deleteReply(replyDto);

		return cnt == 1;
	}

}
