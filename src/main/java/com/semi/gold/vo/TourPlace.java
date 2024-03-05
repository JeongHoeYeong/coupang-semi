package com.semi.gold.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

//tourplace-mapper 실행 쿼리에 변수 명과 동일한 파라미터로 값이 할당됨.
@Data @NoArgsConstructor
public class TourPlace {
//	VALUES(#{touristCode}, #{touristName}, #{touristAddress}, #{look})
	private int touristCode;
	private String touristName;
	private String touristAddress;
	private int look;
	private String imgTag;//<img src='localhost:8080/resources&*%&*%*^&'/>
}
