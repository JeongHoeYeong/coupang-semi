package com.semi.gold.controller;

import java.security.Principal;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.protocol.a.NativeConstants.IntegerDataType;
import com.semi.gold.model.vo.Board;
import com.semi.gold.model.vo.BoardComment;
import com.semi.gold.model.vo.BoardCommentPaging;
import com.semi.gold.model.vo.BoardPaging;
import com.semi.gold.model.vo.LikeBoard;
import com.semi.gold.model.vo.Member;
import com.semi.gold.service.BoardCommentService;
import com.semi.gold.service.BoardService;


@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	@Autowired
	private BoardCommentService bcService;
	
	// 글 목록
	@GetMapping("/boardlist")
	private String list(Model model, BoardPaging paging, Principal principal, String sort,
			String select, String keyword) {
		if(principal !=null) {
		model.addAttribute("member", principal.getName());
		}
		paging.setSort(sort);
		if(keyword != null) {
			List<Board> list = service.boardSearch(keyword, select, paging);
			model.addAttribute("list", list);
			model.addAttribute("paging", new BoardPaging(paging.getPage(), service.total()));
			model.addAttribute("sort", paging.getSort());
			return "/board/boardlist";
		} 
		List<Board> list = service.selectAll(paging);
		model.addAttribute("list", list);
		model.addAttribute("paging", new BoardPaging(paging.getPage(), service.total()));
		model.addAttribute("sort", paging.getSort());
		return "/board/boardlist";
	}
	
	@GetMapping("/boardwrite")
	private String write() {
		return "/board/boardwrite";
	}
	
	// 글 등록
	@PostMapping("/boardwrite")
	private String write(Board b) {
		
		// 비즈니스 로직 처리 -> service.insert
		service.insert(b);
		return "redirect:/boardview?no=" + b.getBoardNo();
	}
	
	// 글 정보
	@GetMapping("/boardview")
	private String view(Principal principal, BoardCommentPaging paging, String no, Model model,
			 HttpServletRequest req, HttpServletResponse res) {
		
		LikeBoard vo = new LikeBoard();
		
		int num = Integer.parseInt(no);
		viewCountUp(no, req, res);
		paging.setBoard_no(num);
		List<BoardComment> list = bcService.selectAll(paging);
		model.addAttribute("boardComment", list);
		model.addAttribute("paging", new BoardCommentPaging(paging.getPage(), bcService.total(num)));
		model.addAttribute("vo", service.select(num));
		if(principal!=null) {
			String id = principal.getName();
			vo.setId(id);
			vo.setBoardNo(num);
			LikeBoard likeBoard = service.checkLikeBoard(vo);
			model.addAttribute("id", id);
			model.addAttribute("likeBoard", likeBoard);
		}
		return "/board/boardview";
	}
	
	@RequestMapping("/boardview")
	private void viewCountUp(String no, HttpServletRequest req, HttpServletResponse res) {
		int num = Integer.parseInt(no);
		
		Cookie[] cookies = Optional.ofNullable(req.getCookies()).orElseGet(() -> new Cookie[0]); 
		
		Cookie cookie = Arrays.stream(cookies)
				.filter(c -> c.getName().equals("boardView"))
				.findFirst()
				.orElseGet(() -> {
					service.view(num);
					return new Cookie("boardView", "[" + no + "]");
				});
		
		if(!cookie.getValue().contains("[" + no + "]")) {
			service.view(num);
			cookie.setValue(cookie.getValue() + "[" + no + "]");
		}
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		res.addCookie(cookie);
		
	}
	
	// 글 삭제
	@GetMapping("/boarddelete")
	private String delete(String no) {
		
		service.delete(Integer.parseInt(no));
		return "redirect:/boardlist";
	}
	
	// 글 수정
	@PostMapping("/boardupdate")
	public String update(Board b) {
		System.out.println(b);
		service.update(b);
		
		return "redirect:/boardview?no="+b.getBoardNo();
	}
	
	// 글 추천
	@ResponseBody
	@PostMapping("/insertLikeBoard")
	private boolean insertLikeBoard(LikeBoard lb) {
		service.insertLikeBoard(lb);
		service.addBoardLike(lb.getBoardNo());
		return true;
	}
	
	// 글 추천취소
	@ResponseBody
	@PostMapping("/deleteLikeBoard")
	public boolean deleteLikeBoard(LikeBoard lb) {
		service.deleteLikeBoard(lb);
		service.subBoardLike(lb.getBoardNo());
		return true;
	}
	
	// 댓글 작성
	@ResponseBody
	@PostMapping("/insertBc")
	public boolean insertBc(BoardComment bc) {
		bcService.insertBC(bc);
		service.updateBcCount(bc.getBoardNo());
		return true;
	}
	
	//댓글 삭제
	@ResponseBody
	@GetMapping("/deleteBC")
	public boolean deleteBC(BoardComment bc) {
		bcService.deleteBC(bc.getBcNo());
		service.updateBcCount(bc.getBoardNo());
		return true;
	}
	
}
