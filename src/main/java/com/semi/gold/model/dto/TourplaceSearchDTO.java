package com.semi.gold.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class TourplaceSearchDTO {
	// 검색 필터
	private String type; // 검색 타입
	private String keyword; // 검색 내용
	
}