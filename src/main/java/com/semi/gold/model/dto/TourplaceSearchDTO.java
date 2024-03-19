package com.semi.gold.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class TourplaceSearchDTO {
	// 검색 필터
	private String type; // 검색 타입
	private String keyword; // 검색 내용
	private int pageIdx; // 페이징 넘버
	
	// 페이지 클릭 후 쿼리 결과에서 가져오기 시작할 번호
	private int pageRowStartIdx;
	
	//한 인덱스에서 보여줄 데이터 양 갯수
	private int showPageCount;
	
	// 검색 기능과 페이징은 동일 쿼리을 사용하기 때문에 페이징에서 limit를 사용하지 않기 위해 있는 변수
	private boolean createPageIndex;
}
