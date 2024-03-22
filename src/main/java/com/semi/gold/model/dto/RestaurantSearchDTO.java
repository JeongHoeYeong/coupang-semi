package com.semi.gold.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class RestaurantSearchDTO {
	// 검색 필터
	private String type; // 검색 타입
	private String keyword; // 검색 내용
	private int pageIdx; // 페이징 넘버
	
	// 페이지 클릭 후 쿼리 결과에서 가져오기 시작할 번호
	private int pageRowStartIdx;
	
	//한 인덱스에서 보여줄 데이터 양 갯수
	private int showPageCount;
	
}
