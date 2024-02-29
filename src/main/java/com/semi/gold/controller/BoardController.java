package com.semi.gold.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.semi.gold.service.BoardService;


@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	@GetMapping("boardlist")
	private void list(Model model) {
		model.addAttribute("boardlist", service.selectAll());
	}
}
