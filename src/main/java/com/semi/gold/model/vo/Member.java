package com.semi.gold.model.vo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;
import lombok.NoArgsConstructor;

// Spring Security에서 제공하는 UserDetails 인터페이스 상속
@Data @NoArgsConstructor
public class Member implements UserDetails{
	
	private String id;
	private String password;
	private String name;
	private String email;
	private String address;
	private String phone;
	private String nickname;
	private String gender;
	private String resident;
	private String auth;
	private int enabled;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> authList = new ArrayList<>();
		authList.add(new SimpleGrantedAuthority(auth));
		return authList;
	}
	
	@Override
	public String getUsername() {
		return id;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	// 회원 탈퇴 여부
	@Override
	public boolean isEnabled() {
		return enabled == 1 ? true : false;
	}


	
}
