package com.choong.spr.domain;

import lombok.Data;

@Data
public class PageDto {
	private int current; 
	private int totalRow;  
	private int rowPerPage;

	public int getLeft() {
		int left = (getCurrentPage() - 1) * rowPerPage + 1;
		return left;
	}

	public int getRight() {
		int right = getCurrentPage() * rowPerPage;
		return Math.min(right, getLastPage());
	}

	public int getCurrentPage() {
		int currentPage = (current - 1) / rowPerPage + 1;
		return Math.max(currentPage, 1);
	}

	public int getLastPage() {
		int lastPage = (totalRow -1) / rowPerPage + 1;
		return lastPage;
	}
	

}
