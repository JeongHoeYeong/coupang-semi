package com.kh.security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.security.model.dao.MemberDAO;
import com.kh.security.model.vo.Member;

// Spring Security에서 제공하는 UserDetailsService 인터페이스 상속
@Service
public class MemberService implements UserDetailsService {

	@Autowired
	private BCryptPasswordEncoder bcpe;
	
	@Autowired
	private MemberDAO dao;
	
	// -> 로그인 시 자동으로 이곳으로 온다.
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Member member = dao.getMemberById(username);
		System.out.println("로그인 성공 : " + member);
		return member;
	}
	
	// 회원가입
	public int registerMember(Member vo) {
		//비밀번호 암호화 처리한 후 멤버 정보 다시 담아서 DAO에게 전달!
		String encodePw = bcpe.encode(vo.getPassword());
		vo.setPassword(encodePw);
		return dao.registerMember(vo);
	}
	
}
