package com.semi.gold.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor
public class Restaurant {
	
	private String contentId;
	
	private String restaurantName;
	private String restaurantAddress;
	private String imgTag;
	private String imgTag2;
	
	private String areaCode;
	private String sigunguCode;
	private String cat1;
	private String cat2;
	private String cat3;
	private String addr1;
	private String addr2;
	private String zipCode;
	private String overview;
	
	private Integer totalCount;
	
}