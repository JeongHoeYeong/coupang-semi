package com.semi.gold.controller;

import java.util.List;

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
		
		dto.setCreatePageIndex(true);
		
		List<TourPlace> returnList = service.searchTourplace(dto);
		int maxPage = returnList.size()/30 ;
		
		if(returnList.size()%30 > 0) {
			maxPage++;
		}
		model.addAttribute("maxPage", maxPage);
		return "/tourplace/tourlist"; 
	}

	@ResponseBody
	@RequestMapping("/getSearchList")
	private List<TourPlace> getSearchList(@RequestBody TourplaceSearchDTO dto){
		
		dto.setPageRowStartIdx((dto.getPageIdx()-1)*30);
		
		List<TourPlace> returnList = service.searchTourplace(dto);
		return returnList;
	}	

//	@GetMapping("")
//	public String allMember(Model model) {
//		List<Member> list = service.showAllMember();
//		model.addAttribute("list", list);
//		return "allMember";
//	}

	
	
	
}
