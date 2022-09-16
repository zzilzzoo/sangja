package com.sangja.dao;

import java.util.List;

import com.sangja.domain.MenuVO;

public interface MenuDAO {
	public List<MenuVO> list() throws Exception;

	public void write(MenuVO vo) throws Exception;

	public MenuVO view(int menu_num) throws Exception;

	public void modify(MenuVO vo) throws Exception;

	// 게시뮬 삭제
	public void delete(int menu_num) throws Exception;

	// 게시물 총 갯수
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List<MenuVO> listPage(int displayPost, int postNum) throws Exception;

	// 게시물 목록 + 페이징
	public List<MenuVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception;

	// 게시물 총 갯수
	public int searchCount(String searchType, String keyword) throws Exception;
}
