package com.semi.gold.board.vo;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Board {
	
	private int boardNo;
	private Timestamp boardDate;
	private String id;
	private int boardViews;
	private int boardLike;
	private String boardTitle;
	private String boardContent;
}
