package com.semi.gold.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class BoardCommentPaging {
	
	private int board_no;
	
	private int page = 1; // 현재 페이지

	private int offset = 0; // 시작 위치
	private int limit = 15; // 레코드 수
	
	private int pageSize = 10; // 한 페이지 당 페이지 개수
	private int endPage = this.pageSize; // 한 페이지의 마지막 페이지 수
	private int startPage = this.endPage - this.pageSize + 1; // 한 페이지의 첫 페이지 수
	
	private boolean prev;
	private boolean next;
	
	
	public BoardCommentPaging(int page, int total) {
		
		this.page = page;
		this.endPage = (int)(Math.ceil((double) page / this.pageSize)) * this.pageSize;
		this.startPage = this.endPage - this.pageSize + 1;
		
		int lastPage = (int)(Math.ceil((double)total / this.limit));
		if(lastPage < this.endPage) {
			this.endPage = lastPage;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < lastPage;
	}
}
