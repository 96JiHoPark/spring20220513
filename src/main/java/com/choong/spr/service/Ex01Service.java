package com.choong.spr.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.choong.spr.domain.BoardDto;
import com.choong.spr.mapper.Ex01Mapper;
import com.choong.spr.mapper.Ex02Mapper;

@Service
public class Ex01Service {

	@Autowired
	private Ex01Mapper mapper;

	@Autowired
	private Ex02Mapper replyMapper;

	public List<BoardDto> boardList(int page, int rowPerPage) {
		int startFrom = (page - 1) * rowPerPage;
		// 예) 7페이지의 경우 (7-1) * 5 = 30 

		return mapper.selectBoardList(startFrom, rowPerPage);
	}

	public BoardDto getBoardById(int id) {
		return mapper.selectBoardById(id);
	}

	public boolean updateBoard(BoardDto boardDto) {
		int cnt = mapper.updateBoard(boardDto);

		return cnt == 1;
	}

	@Transactional
	public boolean deleteBoardById(int id) {
		// foreign key 제약사항 때문에 댓글이 먼저 지워져야 함
		replyMapper.deleteReplyByBoardId(id);

		int cnt = mapper.deleteBoardById(id);

		return cnt == 1;
	}

	public boolean insertBoard(BoardDto boardDto) {
		// boardDto.setInserted(LocalDateTime.now());

		int cnt = mapper.insertBoard(boardDto);

		return cnt == 1;

	}

	public int boardCount() {
		return mapper.selectBoardCount();
	}

}
