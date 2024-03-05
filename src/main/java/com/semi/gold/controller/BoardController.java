package com.semi.gold.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.semi.gold.model.vo.Board;
import com.semi.gold.model.vo.BoardPaging;
import com.semi.gold.service.BoardService;


@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	// 글 목록
	@GetMapping("/boardlist")
	private void list(Model model, BoardPaging paging) {
		
		List<Board> list = service.selectAll(paging);
		model.addAttribute("list", list);
		model.addAttribute("paging", new BoardPaging(paging.getPage(), service.total()));
	}
	
	@GetMapping("/boardwrite")
	public void write() {}
	
	// 글 등록
	@PostMapping("/boardwrite")
	public String write(Board b) {
		
		// 비즈니스 로직 처리 -> service.insert
		service.insert(b);
		return "redirect:/boardview?no=" + b.getBoardNo();
	}
	
	// 글 정보
	@GetMapping("/boardview")
	public void view(String no, Model model) {
		int num = Integer.parseInt(no);
		service.view(num);
		model.addAttribute("vo", service.select(num));
	}
	
	// 글 삭제
	@GetMapping("/boarddelete")
	public String delete(String no) {
		
		service.delete(Integer.parseInt(no));
		return "redirect:/boardlist";
	}
	
	// 글 수정
	@PostMapping("/boardupdate")
	public String update(Board b) {
		System.out.println(b);
		service.update(b);
		
		return "redirect:/boardview?no="+b.getBoardNo();
	}
	
}
