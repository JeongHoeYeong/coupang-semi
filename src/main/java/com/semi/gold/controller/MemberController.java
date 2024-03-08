package com.semi.gold.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.semi.gold.model.dao.MemberDAO;
import com.semi.gold.model.vo.Member;
import com.semi.gold.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private BCryptPasswordEncoder bcpe;
	
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
		if(service.updateMember(vo)==1) {
			session.setAttribute("vo", vo);
		}
		return "redirect:/login";
	}
	
	// 회원 탈퇴
	@GetMapping("/userout")
	public String delete(Member vo) {
		return "/userout";
	}
	
	// 회원 탈퇴
	@PostMapping("/deleteMember")
	public String delete(Member vo, HttpServletRequest request) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails)principal;
		if(bcpe.matches(vo.getPassword(), userDetails.getPassword())) {
			service.deleteMember(vo);
			SecurityContextHolder.clearContext();
			return "redirect:/login";
		} 
		return "/userout";
	}
	

	// 아이디 중복 체크
	@ResponseBody
	@PostMapping("/check")
	public boolean check(String id) {
		Member member = service.idCheck(id);
		if(member == null) return false;
		return true;
	}
	
	// 닉네임 중복 체크
	@ResponseBody
	@PostMapping("/checko")
	public boolean nickcheck(String nickname) {
		Member member = service.nicknameCheck(nickname);
		if(member == null) return false;
		return true;
	}
	
	// 카카오 로그인
	@GetMapping("/kakaoLogin")
	public String kakaoLogin(String code, HttpServletResponse response) throws IOException {
		
		// 카카오 로그인을 실행하면 결국 토큰! accesstoken!!!! -> 다음주 localStorage -> JWT 
		
		// -> 즉, DB에 해당 토큰이 존재하는지 처리를 해야겠죠? 
		// -> 카카오 로그인 했을 때 처음 로그인 했다면 -> 회원가입!
		//    -> DB에 해당 정보 저장을 해야하는 로직!
		// -> 처음이 아니라면 로그인 처리를 해야겠죠! -> 스프링 시큐리티랑 연결하셔도 되고! 
		
		
		System.out.println(code);
		String token = getToken(code);
		System.out.println("getToken : " + token);
		
		Cookie cookie = new Cookie("authorize-access-token", token);
		cookie.setDomain("localhost");
		cookie.setPath("/");
		// 30초간 저장
		cookie.setMaxAge(30*60);
		cookie.setSecure(true);
		response.addCookie(cookie);
	
		return "redirect:/login";
	}
	
	private String getToken(String authorize_code) throws IOException {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=b0074aec5e03ddf2d9c078971f5bdf15"); // REST_API키 본인이 발급받은 key 넣어주기
			sb.append("&redirect_uri=http://localhost:8080/kakaoLogin"); // REDIRECT_URI 본인이 설정한 주소 넣어주기

			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			//System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			//System.out.println("response body : " + result);

			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});

			access_Token = jsonMap.get("access_token").toString();
			refresh_Token = jsonMap.get("refresh_token").toString();

			//System.out.println("access_token : " + access_Token);
			//System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
}

























