package com.semi.gold.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.gold.model.dao.BoardDAO;
import com.semi.gold.model.vo.Board;
import com.semi.gold.model.vo.BoardPaging;
import com.semi.gold.model.vo.LikeBoard;


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
	
	public int insertLikeBoard(LikeBoard lb) {
		return dao.insertLikeBoard(lb);
	}
	
	public int deleteLikeBoard(LikeBoard lb) {
		return dao.deleteLikeBoard(lb);
	}
	
	public int countLikeBoard(int no) {
		return dao.countLikeBoard(no);
	}
	
	
	public int addBoardLike(int no) {
		return dao.addBoardLike(no);
	}
	
	public int subBoardLike(int no) {
		return dao.subBoardLike(no);
	}
	
	public LikeBoard checkLikeBoard(LikeBoard lb) {
		return dao.checkLikeBoard(lb);
	}
	
	public int updateBcCount(int no) {
		return dao.updateBcCount(no);
	}
}
