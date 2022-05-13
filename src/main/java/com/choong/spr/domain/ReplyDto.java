package com.choong.spr.domain;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ReplyDto {
	private int id;
	private int boardId; // board_id 와 매칭
	private String content;
	private LocalDateTime inserted;
	
}
