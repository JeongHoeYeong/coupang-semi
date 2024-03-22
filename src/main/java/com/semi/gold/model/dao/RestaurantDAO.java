package com.semi.gold.model.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.semi.gold.model.dto.RestaurantSearchDTO;
import com.semi.gold.model.vo.Restaurant;


@Repository
public class RestaurantDAO {
	
//	@Autowired
//	private SqlSessionTemplate session;
//	
//	public List<Restaurant> showRestaurant() {
//		return session.selectList("restaurantMapper.showRestaurant");
//	}
	
	private static final String serviceKey ="ErqvC%2Bbre2AmX5hzKN0IGQv0JadWkkM1fpg%2FGStdYe9HaEOLjySh%2Br2t7K6VKeNk2%2BGfYZA7qD4r4GpIINVgPA%3D%3D";
	
	//API 사용
	@SuppressWarnings("unchecked")
	public List<Restaurant> searchRestaurant(RestaurantSearchDTO dto) {
	
		List<Restaurant> returnList = new ArrayList<Restaurant>();
		
		try {

			StringBuilder apiRequestUrl = new StringBuilder(); 
			if(dto.getKeyword() != null && dto.getKeyword().length() > 0) {
				apiRequestUrl.append("http://apis.data.go.kr/B551011/KorService1/searchKeyword1");
			}else {
				apiRequestUrl.append("http://apis.data.go.kr/B551011/KorService1/areaBasedList1");
			}
			
			apiRequestUrl.append("?");
			apiRequestUrl.append("numOfRows=").append(dto.getShowPageCount());
			apiRequestUrl.append("&");
			apiRequestUrl.append("pageNo=").append(dto.getPageIdx());
			apiRequestUrl.append("&");
			apiRequestUrl.append("MobileOS=ETC");
			apiRequestUrl.append("&");
			apiRequestUrl.append("MobileApp=AppTest");
			apiRequestUrl.append("&");
			apiRequestUrl.append("ServiceKey=").append(serviceKey);
			apiRequestUrl.append("&");
			apiRequestUrl.append("arrange=Q");
			apiRequestUrl.append("&");
			apiRequestUrl.append("contentTypeId=39");
			apiRequestUrl.append("&");
			apiRequestUrl.append("areaCode=");
			apiRequestUrl.append("&");
			apiRequestUrl.append("sigunguCode=");
			apiRequestUrl.append("&");
			apiRequestUrl.append("cat1=");
			apiRequestUrl.append("&");
			apiRequestUrl.append("cat2=");
			apiRequestUrl.append("&");
			apiRequestUrl.append("cat3=");
			apiRequestUrl.append("&");
			apiRequestUrl.append("_type=json");
			if(dto.getKeyword() != null && dto.getKeyword().length() > 0) {
				apiRequestUrl.append("&");
				apiRequestUrl.append("keyword=").append(URLEncoder.encode(dto.getKeyword(), "UTF-8"));
			}
			
			URL url = new URL(apiRequestUrl.toString());
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
//	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        
	        ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Object> result = objectMapper.readValue(sb.toString(), new TypeReference<Map<String, Object>>(){});
			Map<String, Object> response = (Map<String, Object>)result.get("response");
			Map<String, Object> body = (Map<String, Object>)response.get("body");
			Map<String, Object> items = (Map<String, Object>)body.get("items");
			List<Object> itemList = (List<Object>)items.get("item");
			Integer totalCount = (Integer)body.get("totalCount");

			for(Object item : itemList) {
				
				Map<String, Object> restaurant = (Map<String, Object>)item;
				
				String addr1 = (String)restaurant.get("addr1");
				String addr2 = (String)restaurant.get("addr2");
				String title = (String)restaurant.get("title");
				String firstImage = (String)restaurant.get("firstimage");
				
				Restaurant data = new Restaurant();
				data.setRestaurantAddress(addr1+addr2);
				data.setRestaurantName(title);
				data.setImgTag(firstImage);
				data.setTotalCount(totalCount);
				
				returnList.add(data);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return returnList;
	}
	
}