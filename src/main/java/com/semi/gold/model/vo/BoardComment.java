package com.semi.gold.model.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class BoardComment {

	private int bcNo;
	private int boardNo;
	private int parentNo;
	private String id;
	private String bcContent;
	private Date bcDate;
	private String bcDelete;
}
