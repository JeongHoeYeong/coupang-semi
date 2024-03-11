package com.semi.gold.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.gold.model.vo.TourPlace;

@Repository
public class TourplaceDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public List<TourPlace> showTourplace() {
		return session.selectList("tourPlaceMapper.showTourplace");
	}
	
	
	
}
