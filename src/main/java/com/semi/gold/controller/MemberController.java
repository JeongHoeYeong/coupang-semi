	package com.semi.gold.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.semi.gold.model.vo.Member;
import com.semi.gold.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// 로그인 페이지로 이동
	@GetMapping("/login")
	public void login() {}
	
	// 회원가입 페이지 이동(register.jsp 페이지로 이동)
	@GetMapping("/register")
	public void register() {}
	
	// 회원가입 로직
	@PostMapping("/register")
	public String register(Member vo) {
		service.registerMember(vo);
		return "redirect:/login";
	}
	
	@GetMapping("/member")
	public void member() {}

	@GetMapping("/change")
	public void change() {}
	
	@GetMapping("/update")
	public void update() {}
	
	@PostMapping("/update")
	public String update(Member vo) {
		service.updateMember(vo);
		return "redirect:/member";
	}
}


