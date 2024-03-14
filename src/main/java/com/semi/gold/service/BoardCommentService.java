package com.semi.gold.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.gold.model.dao.BoardCommentDAO;
import com.semi.gold.model.vo.BoardComment;

@Service
public class BoardCommentService {

	@Autowired
	private BoardCommentDAO dao;
	
	public List<BoardComment> selectAll(int no) {
		return dao.selectAll(no);
	}
	
	public int insertBC(BoardComment bc) {
		return dao.insertBC(bc);
	}
}
