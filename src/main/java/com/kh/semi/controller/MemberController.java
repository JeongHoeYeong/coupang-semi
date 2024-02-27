package com.kh.semi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.semi.model.vo.Member;
import com.kh.semi.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	// 전체 페이지로 이동
	@GetMapping("/all")
	public void all() {}
	
	// 회원 페이지 이동
	@GetMapping("/member")
	public void member() {}
	
	// 에러 페이지로 이동
	@GetMapping("error")
	public void error() {}
	
	// 관리자 페이지로 이동
	@GetMapping("admin")
	public void admin() {}
	
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
}
