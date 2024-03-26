package com.semi.gold.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.gold.model.dto.RestaurantDetailSearchDTO;
import com.semi.gold.model.dto.RestaurantSearchDTO;
import com.semi.gold.model.vo.Restaurant;
import com.semi.gold.service.RestaurantService;

@RequestMapping("/restaurant")
@Controller
public class RestaurantController {
	
	@Autowired
	private RestaurantService service;
	
	@GetMapping("/search")
	private String restaurant(RestaurantSearchDTO dto, Model model) {
		return "/restaurant/restaurantList"; 
	}

	@ResponseBody
	@RequestMapping("/getSearchList")
	private Map<String, Object> getSearchList(@RequestBody RestaurantSearchDTO dto){
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		List<Restaurant> searchList = service.searchRestaurant(dto);
		returnMap.put("searchList", searchList);
		
		return returnMap;
	}
	
	@GetMapping("/detail")
	private String detailRestaurant(RestaurantDetailSearchDTO dto, Model model) {
		
		model.addAttribute("restaurant", service.searchRestaurantDetail(dto));
		return "/restaurant/restaurantDetail"; 
	}
	
	
}