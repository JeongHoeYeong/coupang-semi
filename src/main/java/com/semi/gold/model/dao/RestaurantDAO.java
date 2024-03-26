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
import com.semi.gold.model.dto.RestaurantDetailSearchDTO;
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
			
			returnList = getApiObject(apiRequestUrl.toString());
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return returnList;
	}
	
	
	//API 사용
	public Restaurant searchRestaurantDetail(RestaurantDetailSearchDTO dto) {
		
		Restaurant returnObject = null;
		
		try {
			
			StringBuilder apiRequestUrl = new StringBuilder(); 
			apiRequestUrl.append("http://apis.data.go.kr/B551011/KorService1/detailCommon1");
			
			apiRequestUrl.append("?");
			
//			apiRequestUrl.append("numOfRows=").append(dto.getShowPageCount());
//			apiRequestUrl.append("&");
//			apiRequestUrl.append("pageNo=").append(dto.getPageIdx());
//			apiRequestUrl.append("&");
			apiRequestUrl.append("contentId=").append(dto.getContentId());
			apiRequestUrl.append("&");
			apiRequestUrl.append("MobileOS=ETC");
			apiRequestUrl.append("&");
			apiRequestUrl.append("MobileApp=AppTest");
			apiRequestUrl.append("&");
			apiRequestUrl.append("ServiceKey=").append(serviceKey);
			apiRequestUrl.append("&");
//			apiRequestUrl.append("arrange=Q");
//			apiRequestUrl.append("&");
			apiRequestUrl.append("contentTypeId=39");
			apiRequestUrl.append("&");
			apiRequestUrl.append("_type=json");
			apiRequestUrl.append("&");
			apiRequestUrl.append("defaultYN=Y");
			apiRequestUrl.append("&");
			apiRequestUrl.append("firstImageYN=Y");
			apiRequestUrl.append("&");
			apiRequestUrl.append("areacodeYN=Y");
			apiRequestUrl.append("&");
			apiRequestUrl.append("catcodeYN=Y");
			apiRequestUrl.append("&");
			apiRequestUrl.append("addrinfoYN=Y");
			apiRequestUrl.append("&");
			apiRequestUrl.append("mapinfoYN=Y");
			apiRequestUrl.append("&");
			apiRequestUrl.append("overviewYN=Y");
			
			List<Restaurant> responseList = getApiObject(apiRequestUrl.toString());
			if(responseList.size() > 0) {
				returnObject = responseList.get(0);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return returnObject;
	}
	
	@SuppressWarnings("unchecked")
	private List<Restaurant> getApiObject(String urlString) throws Exception {
		
		List<Restaurant> returnList = new ArrayList<Restaurant>();
		
		URL url = new URL(urlString.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
//        System.out.println("Response code: " + conn.getResponseCode());
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
			
			String contentid = (String)restaurant.getOrDefault("contentid", "");
			String addr1 = (String)restaurant.getOrDefault("addr1", "");
			String addr2 = (String)restaurant.getOrDefault("addr2", "");
			String title = (String)restaurant.getOrDefault("title", "");
			String firstImage = (String)restaurant.getOrDefault("firstimage", "");
			String firstImage2 = (String)restaurant.getOrDefault("firstimage2", "");
			
			String areaCode = (String)restaurant.getOrDefault("areacode", "");
			String sigunguCode = (String)restaurant.getOrDefault("sigungucode", "");
			String cat1 = (String)restaurant.getOrDefault("cat1", "");
			String cat2 = (String)restaurant.getOrDefault("cat2", "");
			String cat3 = (String)restaurant.getOrDefault("cat3", "");
			String zipCode = (String)restaurant.getOrDefault("zipcode", "");
			String overview = (String)restaurant.getOrDefault("overview", "");
			
			Restaurant data = new Restaurant();
			data.setContentId(contentid);
			data.setRestaurantAddress(addr1+addr2);
			data.setRestaurantName(title);
			data.setImgTag(firstImage);
			data.setImgTag2(firstImage2);
			
			data.setAreaCode(areaCode);
			data.setSigunguCode(sigunguCode);
			data.setCat1(cat1);
			data.setCat2(cat2);
			data.setCat3(cat3);
			data.setZipCode(zipCode);
			data.setOverview(overview);
			
			data.setTotalCount(totalCount);
			
			returnList.add(data);
		}
		
		return returnList;
		
	}
	
	
//	public static void main(String[] args) {
//		
//		try {
//			RestaurantDAO dao = new RestaurantDAO();
////			
//			RestaurantSearchDTO dto= new RestaurantSearchDTO();
//			dto.setKeyword("숯불");
//			dto.setPageIdx(1);
//			dto.setShowPageCount(15);
//			
//			dao.searchRestaurant(dto);
//			
//			RestaurantDetailSearchDTO ddto = new RestaurantDetailSearchDTO();
//			ddto.setContentId("2851930");
//			
//			dao.searchRestaurantDetail(ddto);
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//	}
	
}