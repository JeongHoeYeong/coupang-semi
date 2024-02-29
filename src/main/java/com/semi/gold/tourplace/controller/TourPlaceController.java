package com.semi.gold.tourplace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tourplace")
public class TourPlaceController {
	
	@GetMapping("/allPlace")
	public String test() {
		return "/tourplace/home2";
	}
	
}
