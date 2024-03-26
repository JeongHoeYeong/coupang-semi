package com.semi.gold.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class RestaurantSearchDTO {
	
	// 검색 필터
	private String keyword; // 검색 내용
	private int pageIdx; // 페이징 넘버
	
	//한 인덱스에서 보여줄 데이터 양 갯수
	private int showPageCount;
	
}
