package com.semi.gold.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.gold.board.vo.Board;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public List<Board> selectAll() {
		return session.selectList("board.selectAll");
	}
}
