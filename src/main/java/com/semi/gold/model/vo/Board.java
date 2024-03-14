package com.semi.gold.model.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Board {
	
	private int boardNo;
	private Date boardDate;
	private String id;
	private int boardViews;
	private int boardLike;
	private String boardTitle;
	private String boardContent;
	private String bcCount;
}
