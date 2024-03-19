package com.semi.gold.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.gold.model.dao.BoardCommentDAO;
import com.semi.gold.model.vo.BoardComment;
import com.semi.gold.model.vo.BoardCommentPaging;

@Service
public class BoardCommentService {

	@Autowired
	private BoardCommentDAO dao;
	
	public List<BoardComment> selectAll(BoardCommentPaging paging) {
		paging.setOffset(paging.getLimit() * (paging.getPage() - 1));
		return dao.selectAll(paging);
	}
	
	public int insertBC(BoardComment bc) {
		return dao.insertBC(bc);
	}
	
	public int total(int no) {
		return dao.total(no);
	}
	
	public int deleteBC(int no) {
		return dao.deleteBC(no);
	}
	
	public int editBC(BoardComment bc) {
		return dao.editBC(bc);
	}
}
