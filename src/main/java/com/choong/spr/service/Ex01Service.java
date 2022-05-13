package com.choong.spr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choong.spr.domain.BoardDto;
import com.choong.spr.mapper.Ex01Mapper;

@Service
public class Ex01Service {

	@Autowired
	private Ex01Mapper mapper;
	
	public List<BoardDto> boardList() {
		return mapper.selectBoardList();
	}

	public BoardDto getBoardById(int id) {
		return mapper.selectBoardById(id);
	}

}
