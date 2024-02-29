package com.semi.gold.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.gold.board.dao.BoardDAO;
import com.semi.gold.board.vo.Board;

@Service
public class BoardService {

	@Autowired
	private BoardDAO dao;
	
	public List<Board> selectAll() {
		return dao.selectAll();
	}
}
