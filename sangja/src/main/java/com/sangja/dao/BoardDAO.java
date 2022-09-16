package com.sangja.dao;

import java.util.List;

import com.sangja.domain.BoardVO;

public interface BoardDAO {

	public List<BoardVO> list() throws Exception;

	public void write(BoardVO vo) throws Exception;

	public BoardVO view(int bno) throws Exception;

	public void modify(BoardVO vo) throws Exception;

	// 게시뮬 삭제
	public void delete(int bno) throws Exception;

	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징
	public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception;

	// 게시물 총 갯수
	public int searchCount(String searchType, String keyword) throws Exception;

}
