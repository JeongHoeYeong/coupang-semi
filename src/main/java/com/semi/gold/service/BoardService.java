package com.semi.gold.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.gold.model.dao.BoardDAO;
import com.semi.gold.model.vo.Board;
import com.semi.gold.model.vo.BoardPaging;

@Service
public class BoardService {

	@Autowired
	private BoardDAO dao;
	
	public List<Board> selectAll(BoardPaging paging) {
		paging.setOffset(paging.getLimit() * (paging.getPage() - 1));
		return dao.selectAll(paging);
	}
	
	public int insert(Board b) {
		return dao.insert(b);
	}
	public Board select(int no) {
		return dao.select(no);
	}
	
	public int update(Board b) {
		return dao.update(b);
	}
	
	public int delete(int no) {
		return dao.delete(no);
	}
	public int total() {
		return dao.total();
	}
	
	public int view(int no) {
		return dao.view(no);
	}
}
