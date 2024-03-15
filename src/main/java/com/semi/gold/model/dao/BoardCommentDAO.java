package com.semi.gold.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.gold.model.vo.BoardComment;
import com.semi.gold.model.vo.BoardCommentPaging;

@Repository
public class BoardCommentDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public List<BoardComment> selectAll(BoardCommentPaging paging) {
		return session.selectList("boardComment.selectAll", paging);
	}
	
	public int insertBC(BoardComment bc) {
		return session.insert("boardComment.insertBC", bc);
	}
	
	public int total(int no) {
		return session.selectOne("boardComment.count", no);
	}
	
	public int deleteBC(int no) {
		return session.update("boardComment.deleteBC", no);
	}
}
