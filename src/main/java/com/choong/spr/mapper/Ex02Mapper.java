package com.choong.spr.mapper;

import java.util.List;

import com.choong.spr.domain.ReplyDto;

public interface Ex02Mapper {

	int insertReply(ReplyDto replyDto);
	
	List<ReplyDto> selectReplyListByBoardId(int id);

	void deleteReplyByBoardId(int id);

	int updateReply(ReplyDto replyDto);

	int deleteReply(ReplyDto replyDto);



}
