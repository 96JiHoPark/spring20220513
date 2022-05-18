package com.choong.spr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.choong.spr.domain.BoardDto;

public interface Ex01Mapper {

	List<BoardDto> selectBoardList(@Param("startFrom") int startFrom, @Param("rowPerPage") int rowPerPage);
	
	BoardDto selectBoardById(int id);

	int updateBoard(BoardDto boardDto);

	int deleteBoardById(int id);

	int insertBoard(BoardDto boardDto);

	int selectBoardCount();


}
