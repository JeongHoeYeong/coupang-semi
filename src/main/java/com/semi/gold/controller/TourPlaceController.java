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

import com.semi.gold.model.dto.TourplaceSearchDTO;
import com.semi.gold.model.vo.TourPlace;
import com.semi.gold.service.TourplaceService;

@RequestMapping("/tourplace")
@Controller
public class TourPlaceController {
	
	@Autowired
	private TourplaceService service;
	
	@GetMapping("/search")
	private String tourplace(TourplaceSearchDTO dto, Model model) {
		return "/tourplace/tourlist"; 
	}

	@ResponseBody
	@RequestMapping("/getSearchList")
	private Map<String, Object> getSearchList(@RequestBody TourplaceSearchDTO dto){
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		List<TourPlace> searchList = service.searchTourplace(dto);
		returnMap.put("searchList", searchList);
		
		dto.setCreatePageIndex(true);
		List<TourPlace> totalSearchList = service.searchTourplace(dto);
		returnMap.put("totalListSize", totalSearchList.size());
		
		return returnMap;
	}	

//	@GetMapping("")
//	public String allMember(Model model) {
//		List<Member> list = service.showAllMember();
//		model.addAttribute("list", list);
//		return "allMember";
//	}

	
	
	
}
