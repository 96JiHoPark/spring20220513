package com.choong.spr.mapper;

import java.util.List;

import com.choong.spr.domain.BoardDto;

public interface Ex01Mapper {

	List<BoardDto> selectBoardList();

	BoardDto selectBoardById(int id);

}
