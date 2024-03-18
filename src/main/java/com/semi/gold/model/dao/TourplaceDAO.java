package com.semi.gold.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.gold.model.dto.TourplaceSearchDTO;
import com.semi.gold.model.vo.TourPlace;


@Repository
public class TourplaceDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public List<TourPlace> showTourplace() {
		return session.selectList("tourPlaceMapper.showTourplace");
	}
	
	public List<TourPlace> searchTourplace(TourplaceSearchDTO dto) {
		return session.selectList("tourPlaceMapper.searchTourplace", dto);
	}
	
	
//	public List<TourplaceSearchDTO> showPaging()
	
//	public List<Member> findMember(SearchDTO search) {
//		return session.selectList("memberMapper.findMember", search);
//	}
	
//	public List<Member> findMember2(List<String> idList){
//		return session.selectList("memberMapper.findMember2", idList);
//	}
	
	
	
}
