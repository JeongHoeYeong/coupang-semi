package com.semi.gold.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.gold.model.dto.BoardSearchDTO;
import com.semi.gold.model.vo.Board;
import com.semi.gold.model.vo.BoardPaging;
import com.semi.gold.model.vo.LikeBoard;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public int insert(Board b) {
		return session.insert("board.insert", b);
	}
	
	public List<Board> selectAll(BoardPaging paging) {
		System.out.println(session.selectList("board.selectAll", paging));
		return session.selectList("board.selectAll", paging);
	}
	
	public Board select(int no) {
		return session.selectOne("board.select", no);
	}
	
	public int update(Board b) {
		return session.update("board.update", b);
	}
	
	public int delete(int no) {
		return session.delete("board.delete", no);
	}
	
	public int total() {
		return session.selectOne("board.count");
	}
	
	public int view(int no) {
		return session.update("board.view", no);
	}
	
	public int insertLikeBoard(LikeBoard lb) {
		return session.insert("board.insertLikeBoard", lb);
	}
	
	public int deleteLikeBoard(LikeBoard lb) {
		return session.delete("board.deleteLikeBoard", lb);
	}
	
	public int countLikeBoard(int no) {
		return session.selectOne("board.countLikeBoard", no);
	}
	
	
	public int addBoardLike(int no) {
		return session.update("board.addBoardLike", no);
	}
	
	public int subBoardLike(int no) {
		return session.update("board.subBoardLike", no);
	}
	
	public LikeBoard checkLikeBoard(LikeBoard lb) {
		return session.selectOne("board.checkLikeBoard", lb);
	}
	
	public int updateBcCount(int no) {
		return session.update("board.updateBcCount", no);
	}
	
	public List<Board> searchBoard(Map<String, Object> map) {
		return session.selectList("board.searchBoard", map);
	}
	
	public int searchTotal(Map<String, String> map) {
		return session.selectOne("board.searchCount", map);
	}
	
}

