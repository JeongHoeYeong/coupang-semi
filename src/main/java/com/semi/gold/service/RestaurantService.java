package com.semi.gold.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.gold.model.dao.RestaurantDAO;
import com.semi.gold.model.dto.RestaurantDetailSearchDTO;
import com.semi.gold.model.dto.RestaurantSearchDTO;
import com.semi.gold.model.vo.Restaurant;

@Service
public class RestaurantService {

	@Autowired
	private RestaurantDAO dao;
	
	public List<Restaurant> searchRestaurant(RestaurantSearchDTO dto) { 

		List<Restaurant> returnList = dao.searchRestaurant(dto);
		return returnList;
	}
	
	public Restaurant searchRestaurantDetail(RestaurantDetailSearchDTO dto) {
		return dao.searchRestaurantDetail(dto); 
	}


}
