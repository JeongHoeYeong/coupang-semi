package com.semi.gold.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

	// 회원 정보 변경
	@GetMapping("/update")
	public String update(Member vo) {
		return "/update";
	}
	
	// 회원 정보 변경
	@PostMapping("/updateMember")
	public String update(Member vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println(vo);
		if(service.updateMember(vo)==1) {
			session.setAttribute("vo", vo);
		}
		return "redirect:/login";
	}
	
	// 회원 탈퇴
	@GetMapping("/userout")
	public String delete(Member vo) {
		System.out.println("--------------------------");
		return "/userout";
	}
	
	// 회원 탈퇴
	@PostMapping("/deleteMember")
	public String delete(Member vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println(vo);
		if(service.deleteMember(vo) == 1) {
			System.out.println("제발 되라!!!!");
			session.setAttribute("vo", vo);
		}
		return "redirect:/login";
	}
}

























