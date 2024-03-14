package com.semi.gold.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.gold.model.vo.BoardComment;

@Repository
public class BoardCommentDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public List<BoardComment> selectAll(int no) {
		return session.selectList("boardComment.selectAll", no);
	}
	
	public int insertBC(BoardComment bc) {
		return session.insert("boardComment.insertBC", bc);
	}
}
