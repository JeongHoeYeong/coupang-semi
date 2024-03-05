package com.semi.gold.tourplace.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.semi.gold.vo.TourPlace;

@Controller
public class TourPlaceController {
	
	@Autowired
	private TourplaceService service;
	
	@GetMapping("/tourplace")
	public String tourplace(Model model) {
		List<TourPlace> list = service.showTourplace();
		model.addAttribute("list", list);
		return "/tourplace/tourlist"; 
	}
	
	
	
	
	
	
}
